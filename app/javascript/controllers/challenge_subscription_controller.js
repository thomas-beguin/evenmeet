import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { challengeId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChallengeChannel", id: this.challengeIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.challengeIdValue}.`)
  }
}
