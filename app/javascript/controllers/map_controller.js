import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    challengeId: Number
  }
  static targets = ["coordinates"]

  connect() {
    console.log(this.markersValue)
    // stocker markersValue
    this.twoMarkersValue = this.markersValue
    this.firstUser = this.twoMarkersValue[0]
    // reassign as user 1
    this.markersValue = [{lat: }, this.twoMarkersValue[1]]
    console.log(this.markersValue)
//     mapboxgl.accessToken = this.apiKeyValue

    navigator.geolocation.getCurrentPosition((data) => {
      console.log("get current position", data)
    })
// Récupérer la position de l'autre participation
// Mettre à jour lorsque déplacement
// Renvoyer des alertes
    console.log(this)

    this.channel = createConsumer().subscriptions.create(
      { channel: "ChallengeChannel", id: this.challengeIdValue },
      { received: data => this.#updateCoordinates(data) }
    )

    console.log(`Subscribed to the challenge with the id ${this.challengeIdValue}.`)

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/thomasbeguin/clf6prqnq005b01mtf6o5lkvt",
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
      )


    console.log("Hello")

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  disconnect() {
    console.log("Unsubscribed from the challenge")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  #updateCoordinates(data) {
    const latitude = (data) => { navigator.geolocation.getCurrentPosition.coords.latitude
    }
    raise
    const longitude = (data) => { navigator.geolocation.getCurrentPosition.coords.longitude
    }
    fetch(challenge_path(challenge), {
      method: "PATCH",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify({"latitude": latitude, "longitude": longitude})
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }

  // #addMarkersToMap() {
  //   this.markersValue.forEach((marker) => {

  //     const customMarker = document.createElement("div")
  //     customMarker.innerHTML = marker.marker_html

  //     new mapboxgl.Marker(customMarker)
  //       .setLngLat([ marker.lng, marker.lat ])
  //       .addTo(this.map)
  //   })
  // }

  // #fitMapToMarkers() {
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  //   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  // }
}
