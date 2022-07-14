import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="listing_map"
export default class extends Controller {
  static targets = ["map", "listings"]
  connect() {
    console.log("ListingMapController connected")

    if(window.google) {
      this.initGoogle();
    }
  }

  initGoogle() {
    console.log('init google')
    const myLatLng = { lat: -25.363, lng: 131.044 };
    const map = new google.maps.Map(this.mapTarget, {
      zoom: 4,
      center: myLatLng,
    });
    this.addMarkers(map);
  }

  addMarkers(map) {
    console.log('adding markers')
    Array.from(this.listingsTarget.children).forEach((listing) => {
      if(listing.dataset.lat) {
        new google.maps.Marker({
          position: {
            lat: parseFloat(listing.dataset.lat),
            lng: parseFloat(listing.dataset.lng),
          },
          map,
          title: listing.dataset.title,
        });
      }
    })
  }
}
