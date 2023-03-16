import { Controller } from "@hotwired/stimulus"
import { Modal } from "../components/modal"

export default class extends Controller {
  static targets = [ 'modal' ]

  connect() {
    this.modal = new Modal()
    console.log("modal controller", this.modal)
  }

  open(event) {
    this.modal.open()
    if (event.params.url) this.modal.replaceContent({ url: event.params.url })
  }

  close() {
    this.modal.close()
  }
}
