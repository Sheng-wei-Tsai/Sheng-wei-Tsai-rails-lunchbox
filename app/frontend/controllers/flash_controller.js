import { Controller } from "stimulus"
// import axios from "axios"

export default class extends Controller {
  static targets = ["message"]

  close(e) {
    e.preventDefault();
    this.messageTarget.remove();
  }
}

