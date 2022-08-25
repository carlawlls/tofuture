import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Invest", "in change", "(投布)"],
      typeSpeed: 50,
      loop: true
    })
  }
}

// paste this into HTML
//<p><span data-controller="typed-js"></span></p>
