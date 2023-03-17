import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    chatroomId: Number,
    challengeId: Number,
    apiKey: String,
    markers: Array,
    userId: Number
  }

  static targets = ["participation"]

  connect() {
    this.orientation = 0
    this.markers = []
    this.#initMap()
    this.#addMarkersToMap(this.markersValue)
    this.#subscribe()
    this.#watchPos()
    this.#fitMapToMarker(this.#myMarker(this.markersValue))
    this.#userOrientation()
    this.markers = []
  }

  #isIOS() {
    return navigator.userAgent.match(/(iPod|iPhone|iPad)/) && navigator.userAgent.match(/AppleWebKit/)
  }

  #userOrientation() {
    if (this.#isIOS()) {
      DeviceOrientationEvent.requestPermission()
        .then((response) => {
          if (response === "granted") {
            window.addEventListener("deviceorientation", this.#handleOrientationChangeEvent.bind(this), true);
          } else {
            alert("has to be allowed!");
          }
        })
        .catch(() => alert("not supported"));
    } else {
      window.addEventListener("deviceorientationabsolute", this.#handleOrientationChangeEvent.bind(this), true);
    }
  }

  #handleOrientationChangeEvent(e) {
    let compass = e.webkitCompassHeading || Math.abs(e.alpha - 360);
    this.orientation = compass // + 90
    this.map.setBearing(this.orientation)
  }

  #subscribe() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChallengeChannel", id: this.challengeIdValue },
      { received: (data) => {
          if (data.markers && data.markers.length >= 2) {
            var markersToDelete = document.querySelectorAll(".marker")
            markersToDelete.forEach((marker) => {
              marker.remove()
            })
            this.#addMarkersToMap(data.markers)
            this.#fitMapToMarker(this.#myMarker(data.markers))
          }
        }
      }
      )
    }

    #watchPos() {
      navigator.geolocation.watchPosition(throttle((data) => {
      const lat = data.coords.latitude;
      const lng = data.coords.longitude;
      const participationId = this.participationTarget.dataset.participationId
      const challengeId = this.participationTarget.dataset.challengeId
      const url = `/participations/${participationId}/`
      const options = {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          "lng": lng,
          "lat": lat,
          "challenge-id": challengeId
        })
      }

        fetchWithToken(url, options)
      }, 500), () => {}, {
          enableHighAccuracy: true,
          timeout: 5000,
          maximumAge: 0
        })
    }

  #addMarkersToMap(markers) {
    // if (this.myMarker && this.#myMarker(markers)) this.myMarker.remove()
    if (this.#myMarker(markers)) {
      const myMarker = document.createElement("div")
      myMarker.classList.add("marker")
      myMarker.innerHTML = this.#myMarker(markers).marker_html

      this.myMarker = new mapboxgl.Marker(myMarker)
      .setLngLat([ this.#myMarker(markers).lng, this.#myMarker(markers).lat ])
      .addTo(this.map)
    }

    // target marker
    // if (this.targetMarker && this.#targetMarker(markers)) this.targetMarker.remove()
    if (this.#targetMarker(markers)) {
      const targetMarker = document.createElement("div")
      targetMarker.classList.add("marker")
      targetMarker.innerHTML = this.#targetMarker(markers).marker_html

      this.targetMarker = new mapboxgl.Marker(targetMarker)
      .setLngLat([ this.#targetMarker(markers).lng, this.#targetMarker(markers).lat ])
      .addTo(this.map)
    }
  }

  #initMap() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/thomasbeguin/clf6pymut007b01mry8gyq1wi",
    })
  }

  #fitMapToMarker(marker) {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ marker.lng, marker.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 18, duration: 0 })
    this.map.flyTo({
      center: [marker.lng, marker.lat],
      duration: 0,
      bearing: this.orientation
    })
  }

  #myMarker(markers) {
    return Array.from(markers).find(e => e.user_id == this.userIdValue)
  }

  #targetMarker(markers) {
    return Array.from(markers).find(e => e.user_id != this.userIdValue)
  }
}

const fetchWithToken = (url, options) => {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers
  };

  return fetch(url, options)
}

const csrfToken = () => {
  return document.querySelector('[name="csrf-token"]').content
}
