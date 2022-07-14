// Entry point for the build script in your package.json
// import * as ActiveStorage from "@rails/activestorage"
import "@hotwired/turbo-rails"
import "./channels"
import "./controllers"

// ActiveStorage.start()
console.log("here")
window.initMap = () => {
  console.log('initMap was called');
  const event = new Event("MapLoaded")
  event.initEvent("map-loaded", true, true);
  window.dispatchEvent(event)
}
