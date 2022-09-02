import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="like-button"
export default class extends Controller {
  connect() {
    console.log("hello");
  }
}
