import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-submit"
export default class extends Controller {
  static targets = []

  submit () {
    // Add a small delay for text inputs to avoid submitting on every keystroke
    if (this.timeout) {
      clearTimeout(this.timeout)
    }

    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 300) // 300ms delay for debouncing
  }

  // For immediate submission (checkboxes, selects, date inputs)
  submitImmediate () {
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
    this.element.requestSubmit()
  }
}
