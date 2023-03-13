import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="radar"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["coordinates"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    navigator.geolocation.getCurrentPosition((data) => {
      console.log("entering get current position", data)
    this.#addMarkersToMap()


  this.map = new mapboxgl.Map({
    container: this.element,
    style: "mapbox://styles/mapbox/streets-v10"
  })
}


      fetch("", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({"position": GeolocationCoordinates.coords})
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })




    }

      const form = document.querySelector("#form")
      form.addEventListener("submit", signUp)

      // fetch
      // envoie lat LockManagerstock server save sur current_user
      // Broadcast via action du controller
     })
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChallengeChannel", id: this.challengeIdValue },
      { received: (data) => this.#insertCoordinates(data) }
    )

    console.log(`Subscribe to the chatroom with the id ${this.challengeIdValue}.`)
  }

  #insertCoordinates(data) {
    this.coordinatesTarget.insertAdjacentHTML("beforeend", data)
    console.log("insert coordinates", data)
  }




}
