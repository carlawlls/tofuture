import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  static targets = ["invest", "change"]
  connect() {
    console.log(this.investTarget)
    new Typed(this.investTarget, {
      strings: ["Invest"],
      typeSpeed: 50,
    })
    console.log(this.changeTarget)
    new Typed(this.changeTarget, {
      startDelay: 1000,
      strings: ["in change"],
      typeSpeed: 50,
    })
  }
}

// paste this into HTML
//<p><span data-controller="typed-js"></span></p>
