import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {
  static targets = ["modal"]
  connect() {
    console.log("Blabla")
  }

  toggle() {
    console.log('TEST MODAL')
    this.modalTarget.classList.toggle("active");
    console.log("Profile")
  }
}
