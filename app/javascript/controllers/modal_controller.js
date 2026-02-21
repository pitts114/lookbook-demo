import { Controller } from "@hotwired/stimulus"

// This controller is attached to the modal element itself (inside the turbo frame).
// When Turbo loads modal content into <turbo-frame id="modal">, Stimulus
// automatically connects this controller → the modal is visible.
// Closing clears the turbo frame, which disconnects the controller.
export default class extends Controller {
  close() {
    // Remove the modal content from the turbo frame
    this.element.closest("turbo-frame")?.replaceChildren()
  }
}
