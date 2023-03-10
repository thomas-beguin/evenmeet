import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-element"
export default class extends Controller {
  static targets = ["modal", "menuactive"]
  connect() {
    console.log("coucou")
  }

  toggle() {
    this.modalTarget.classList.toggle("active");
  }

  menuactive() {
    console.log("coucou act")
    this.modalTarget.classList.toggle("active");
    this.menuactiveTarget.classList.toggle("menu-active");
    this.menuactiveTarget.classList.toggle("fa-bars");
    this.menuactiveTarget.classList.toggle("fa");
    this.menuactiveTarget.classList.toggle("fa-solid");
    this.menuactiveTarget.classList.toggle("fa-chevron-left");
  }
}
