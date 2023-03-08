import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap";
import { Swiper } from "../helpers/swiper";

export default class extends Controller {
  static targets = ["card", "modal", "modalBody", "content"]

  connect() {
    this.initSwiper()
    this.initModal()
  }

  initSwiper() {
    new Swiper({
      cards: this.cardTargets,
      likedCallback: this.swipeRight.bind(this),
      dislikedCallback: this.swipeLeft.bind(this)
    })
  }

  initModal() {
    this.modal = new Modal(this.modalTarget)
  }

  hideModal() {
    this.modal.hide()
  }

  swipeLeft(id) {
    const participationId = this.contentTarget.dataset.participationId
    const url = `/participations/${participationId}/relationships`
    const options = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        "id": id,
        "liked": false
      })
    }

    fetchWithToken(url, options)
  }

  swipeRight(id) {
    const participationId = this.contentTarget.dataset.participationId
    const url = `/participations/${participationId}/relationships`
    const options = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        "id": id,
        "liked": true
      })
    }

    fetchWithToken(url, options)
    .then(response => response.json())
    .then(this.responseHandler.bind(this))

  }

  responseHandler(data) {
    if (data.content) {
      this.modalBodyTarget.innerHTML = data.content
      this.modal.show()
    }
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

global.csrfToken = csrfToken
global.fetchWithToken = fetchWithToken
