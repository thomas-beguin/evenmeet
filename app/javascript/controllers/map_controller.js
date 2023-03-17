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
    this.#subscribe()
    this.#watchPos()
    this.#addMarkersToMap(this.markersValue)
    this.#fitMapToMarker(this.#myMarker(this.markersValue))
    this.#userOrientation()
    this.markers = []
  }

  #isIOS() {
    return navigator.userAgent.match(/(iPod|iPhone|iPad)/) && navigator.userAgent.match(/AppleWebKit/)
  }

  #userOrientation() {
    if (this.#isIOS()) {
      console.log("je suis un iphone")
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
      console.log("je suis pas un iphone")
      window.addEventListener("deviceorientationabsolute", this.#handleOrientationChangeEvent.bind(this), true);
    }
  }

  #handleOrientationChangeEvent(e) {
    let compass = e.webkitCompassHeading || Math.abs(e.alpha - 360);
    this.orientation = compass + 90
    this.map.setBearing(this.orientation)
  }

  #subscribe() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChallengeChannel", id: this.challengeIdValue },
      { received: (data) => {
          if (data.markers && data.markers.length >= 2) {
            console.log(`data.markers received:`, [data.markers[0].lat, data.markers[0].lng], [data.markers[1].lat, data.markers[1].lng])
            const markersToDelete = document.querySelectorAll(".marker")
            this.#addMarkersToMap(data.markers)

            // const camera = this.map.getFreeCameraOptions({bearing: 85});

            // Update camera pitch and bearing
            // camera.setPitchBearing(60, 140);
            // Apply changes
            // console.log('preslice', this.markers)
            markersToDelete.forEach((marker) => {
              marker.remove()
            })
            this.#fitMapToMarker(this.#myMarker(data.markers))
            // this.map.setBearing(80)
          }
        }
      }
      )
    }

    #watchPos() {
      navigator.geolocation.watchPosition((data) => {
      const lat = data.coords.latitude;
      const lng = data.coords.longitude;
      const participationId = this.participationTarget.dataset.participationId
      const challengeId = this.participationTarget.dataset.challengeId
      const url = `/participations/${participationId}`
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
    }, () => {}, {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 50
    })
  }

  #addMarkersToMap(markers) {
    markers.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.classList.add("marker")
      customMarker.innerHTML = marker.marker_html

      var marker = new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map)
      // this.markers.push(marker)
    })
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
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 0 })
    this.map.flyTo({
      center: [marker.lng, marker.lat],
      duration: 0,
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
