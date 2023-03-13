import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    challengeId: Number,
    apiKey: String,
    markers: Array,
  }

  static targets = ["participation"]

  connect() {

    setInterval( () => navigator.geolocation.getCurrentPosition((data) => {
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
                          .then(response => response.json())
                          .then((data) => {
                            console.log(data)
                            // Desrtroy all previous markers
                            this.markers.forEach((e) => { e.remove() })
                            this.#addMarkersToMap(data.markers)
                          })
                      })
                , 10000)

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/thomasbeguin/clf6pymut007b01mry8gyq1wi",
    })

    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        // When active the map will receive updates to the device's location as it changes.
        trackUserLocation: true,
        // Draw an arrow next to the location dot to indicate which direction the device is heading.
        showUserHeading: true
      })
      );

    this.#addMarkersToMap(this.markersValue)
    this.#fitMapToMarkers()
    this.markers = []
  }

  #addMarkersToMap(markers) {
    this.markersValue.forEach((marker) => {

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      var marker = new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
      this.markers.push(marker)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  getCurrentPosition() {
    navigator.geolocation.getCurrentPosition((data) => {
      const lat = data.coords.latitude;
      const lon = data.coords.longitude;
      const participationId = this.participationTarget.dataset.participationId
      const challengeId = this.participationTarget.dataset.challengeId
      const url = `/participations/${participationId}`
      const options = {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          "lon": lon,
          "lat": lat,
          "challenge-id": challengeId
        })
      }

      fetchWithToken(url, options)
        .then(response => response.json())
        .then((data) => {
          console.log(data)
        })
    });
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
