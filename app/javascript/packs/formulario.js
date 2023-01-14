/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'


Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  var element = document.getElementById('model_visita_form');
  if( element != null){
    var model_visitum = JSON.parse(element.dataset.modelVisitum)
    var categorias_attributes = JSON.parse(element.dataset.categoriasAttributes)
    categorias_attributes.forEach(function(categoria){categoria._destroy = null })
    model_visitum.categorias_attributes = categorias_attributes
    var app = new Vue({
      el: element,
      data: function() {
        return { model_visitum: model_visitum}
      },
      methods: {
        addCategoria: function(){
          this.model_visitum.categorias_attributes.push({
            id: null,
            _destroy: null
          })
        },
        removeCategoria: function(index){
          var category = this.model_visitum.categorias_attributes[index]
          if (category.id == null ){
            this.model_visitum.categorias_attributes.splice(index,1)
          }else {
            this.model_visitum.categorias_attributes[index]._destroy = "1"
          }
          

        },
        undoDestroy: function(index) {
          this.model_visitum.categorias_attributes[index]._destroy = null
        },
        isToggled: function(){
          console.log('Ay Caramba!')
          if (this.model_visitum.status == 'completed'){
            this.model_visitum.status = null
            console.log(this.model_visitum.status)
          }else {
            this.model_visitum.status = 'completed'
            console.log(this.model_visitum.status)
          }
        },
        saveTrip : function () {
          if(this.model_visitum.id == null) {
            this.$http.post('/model_visita',{model_visitum: this.model_visitum}).then( response => 
              {
                console.log(response),
                window.location = `/dashboard/dashboard?viaje=${response.body.id}#new_trip`
              }, response => {
                console.log(response)
              })
          }
          else {
            this.$http.put(`/model_visita/${this.model_visitum.id}`,{model_visitum: this.model_visitum}).then( response => 
              {
                console.log(response),
                window.location = `/dashboard/dashboard?viaje=${response.body.id}#new_trip`
              }, response => {
                console.log(response)
              })
          }
          
        }
      }
    })
    //document.body.appendChild(app.$el)
  
    console.log(app)
  }
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
