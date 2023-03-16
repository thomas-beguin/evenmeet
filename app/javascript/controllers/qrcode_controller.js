import { Controller } from "@hotwired/stimulus"
// To use Html5QrcodeScanner (more info below)
import {Html5QrcodeScanner} from "html5-qrcode"

// Connects to data-controller="qrcode"
export default class extends Controller {
  connect() {
    function onScanSuccess(decodedText, decodedResult) {
      // handle the scanned code as you like, for example:
      window.location.href = decodedText
    }

    function onScanFailure(error) {
      // handle scan failure, usually better to ignore and keep scanning.
      // for example:
    }

    let html5QrcodeScanner = new Html5QrcodeScanner(
      "qr-reader",
      { fps: 1, qrbox: {width: 250, height: 250} },
      /* verbose= */ false);
    html5QrcodeScanner.render(onScanSuccess, onScanFailure);
  }
}

// const modal = new Modal()

// modal.open()
