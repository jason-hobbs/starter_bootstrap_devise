import { Controller } from "stimulus"

export default class extends Controller {
  show() {
    var att = document.querySelector('.twofa')
    att.classList.toggle('d-none');
    var att2 = document.querySelector('.facbut')
    att2.classList.toggle('active');
    document.querySelector('.facbut').blur();
  }
}