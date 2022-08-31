import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scores"
export default class extends Controller {
  static targets = ["num"];

  connect() {
    this.numTargets;
    let valueDisplays = this.numTargets;
    let interval = 500;

    valueDisplays.forEach((valueDisplay) => {
      let startValue = 0;
      let endValue = parseInt(valueDisplay.getAttribute("data-val"));
      let duration = Math.floor(interval / endValue);
      let counter = setInterval(function () {
        startValue += 1;
        valueDisplay.textContent = startValue;
        if (startValue == endValue) {
          clearInterval(counter);
        }
      }, duration);
    });
    console.log("");
  }
}
