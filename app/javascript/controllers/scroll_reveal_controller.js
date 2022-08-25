import { Controller } from "@hotwired/stimulus"
import ScrollReveal from "stimulus-scroll-reveal"

// Connects to data-controller="scroll-reveal"
export default class extends ScrollReveal {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }

  // Override this method to change the IntersectionObserver behavior
  intersectionObserverCallback(entries, observer) {
    //
  }

  // Options used for the IntersectionObserver
  get intersectionObserverOptions() {
    return {}
  }

  // You can override this getter to set your default options here.
  get defaultOptions() {
    return {
      class: 'active',
      threshold: 0.5,
      rootMargin: '100px',
    }
  }
}
