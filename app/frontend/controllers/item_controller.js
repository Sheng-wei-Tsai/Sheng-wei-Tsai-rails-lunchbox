// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
// import axios from "axios"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["icon"]

  heart(e) {
    e.preventDefault();

    let item_id = document.querySelector('#item_id').value;

    Rails.ajax({
      url: `/api/v1/items/${item_id}/favorite`, 
      type: 'POST', 
      success: resp => {
        if (resp.status === "favorited") {
          this.iconTarget.classList.remove('far');
          this.iconTarget.classList.add('fas');
        } else {
          this.iconTarget.classList.remove('fas');
          this.iconTarget.classList.add('far');
        }
      }, 
      error: err => {
        console.log(err);
      } 
    })
  }
}

//   heart(e) {
//     e.preventDefault();
//     // axios
//     // const csrfToken = document.querySelector('[name=csrf-token]').content
//     // axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

//     let item_id = document.querySelector('#item_id').value;

//     axios.post(`/api/v1/items/${item_id}/favorite`)
//     // 這邊要寫arrow function 因為是不同的 scope
//     .then(resp => {
//       if(resp.data.status === "favorited") {
//           console.log('Yes')
//          this.iconTarget.classList.remove('far'); // s = solid
//          this.iconTarget.classList.add('fas');    // r = regular
//       } else {
//         console.log('No')
//           this.iconTarget.classList.remove('fas');
//           this.iconTarget.classList.add('far');
//       }
//     })
//     .catch( err => {
//       console.log(err);
//     })
//   }
// }
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


