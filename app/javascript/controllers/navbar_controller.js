import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["home"]

  connect() {
  }

  active(e) {
    this.homeTarget.classList.toggle("active-button");
  }
}
