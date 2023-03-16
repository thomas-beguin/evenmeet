import { Controller } from "@hotwired/stimulus"
import { Modal } from "../components/modal";
import { Swiper } from "../helpers/swiper";

export default class extends Controller {
  static targets = ["card", "content"]

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
    this.modal = new Modal()
  }

  hideModal() {
    this.modal.close()
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
      this.modal.replaceContent({ html: data.content })
      this.modal.open()
    }
  }

}
