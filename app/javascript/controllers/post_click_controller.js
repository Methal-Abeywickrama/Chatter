import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-click"
export default class extends Controller {
  static values = { url: String }
  connect() {
    this.element.style.cursor = 'pointer'
  }

  goToPost() {
    window.location.href = this.urlValue
  }
}
