import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'helloParagraph',
  ]

  connect() {
    console.log("hello")
    this.helloParagraphTarget.textContent = "Hello World! + Stimulus";
  }
}
