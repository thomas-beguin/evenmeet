import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-element"
export default class extends Controller {
  static targets = ["modal", "menuactive", "participations", "passedparticipations", "currentparticipations"]
  connect() {
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

  passed() {
    this.participationsTarget.classList.add("passed")
    this.passedparticipationsTarget.classList.remove("d-none")
    this.currentparticipationsTarget.classList.add("d-none")
  }

  current() {
    this.participationsTarget.classList.remove("passed")
    this.passedparticipationsTarget.classList.add("d-none")
    this.currentparticipationsTarget.classList.remove("d-none")
  }
}
