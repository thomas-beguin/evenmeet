import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-element"
export default class extends Controller {
  static targets = ["modal", "menuactive",  "passedparticipations", "currentparticipations", "incoming", "passed"]

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

  current() {
    this.passedTarget.classList.remove("menu-bar")
    this.incomingTarget.classList.add("menu-bar")
    this.passedparticipationsTarget.classList.add("d-none")
    this.currentparticipationsTarget.classList.remove("d-none")
  }

  passed() {
    this.passedTarget.classList.add("menu-bar")
    this.incomingTarget.classList.remove("menu-bar")
    this.passedparticipationsTarget.classList.remove("d-none")
    this.currentparticipationsTarget.classList.add("d-none")
  }
}
