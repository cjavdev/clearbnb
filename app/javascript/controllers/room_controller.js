import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="room"
export default class extends Controller {
  static targets = [
    'bedFields',
    'beds',
  ]

  connect() {
  }

  addBed(e) {
    e.preventDefault();
    this.bedsTarget.insertAdjacentHTML(
      'beforeend',
      this.bedFieldsTarget.innerHTML
    )
  }
}
