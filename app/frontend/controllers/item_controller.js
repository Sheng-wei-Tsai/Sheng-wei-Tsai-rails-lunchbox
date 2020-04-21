// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import axios from "axios"
export default class extends Controller {
  static targets = ["icon"]

  initialize() {
    // @clicked = false ruby
    this.clicked = false;
  }

  heart(e) {
    e.preventDefault();

    axios.post('/api/v1/items/4/favoirte')
    .then(function(resp) {
      console.log(resp);
    })
    .catch(function(err) {
      console.log(err);
    })
    
    // console.log('Heart is clicked');
  //   if (this.clicked) {
  //     this.iconTarget.classList.remove('far'); // s = solid
  //     this.iconTarget.classList.add('fas');    // r = regular
  //     this.clicked = false;
  //   } else {
  //     this.iconTarget.classList.remove('fas');
  //     this.iconTarget.classList.add('far');
  //     this.clicked = true;
  //   }
  // }


}
