
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "submit"]
  
  check() {
  if  (this.contentTarget.value.length >= 2 ) {
      this.submitTarget.disabled = false
    } else {
      this.submitTarget.disabled = true
    }
  }
}