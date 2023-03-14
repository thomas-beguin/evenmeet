import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showmap"
export default class extends Controller {
  static targets = ["map"]

  displaymap() {
    this.mapTarget.classList.toggle("showmap")
    this.mapTarget.classList.toggle("hidemap")
    this.mapTarget.scrollTo(0, this.mapTarget.scrollHeight)
  }
}
