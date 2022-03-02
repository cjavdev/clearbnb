import { Controller } from "@hotwired/stimulus"
import {toggle} from "el-transition";

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = [ "mobileMenu", "desktopMenu" ]
  connect() {
    console.log("menu controller connected");
  }

  toggleDesktopMenu() {
    toggle(this.desktopMenuTarget);
  }

  toggleMobileMenu() {
    toggle(this.mobileMenuTarget);
  }
}
