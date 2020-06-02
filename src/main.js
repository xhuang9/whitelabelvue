import Vue from "vue";
import Components from "./components"; //vue components
import "./scss/index.scss"; // css file


// Install BootstrapVue take around 800kb, not import some of the plugin if you need the website to speed up.
//check https://bootstrap-vue.org/docs/components for components you might need (there are more components)
// iconPlugin is 300kb itself, make sure import individual icons as need
import {
  LayoutPlugin,
  ModalPlugin,
  NavPlugin,
  NavbarPlugin,
  DropdownPlugin,
  FormPlugin,
  FormCheckboxPlugin,
  InputGroupPlugin,
  // ImagePlugin,
  // ButtonPlugin,
  // CardPlugin,
  // TablePlugin,
} from 'bootstrap-vue';
Vue.use(LayoutPlugin);
Vue.use(ModalPlugin);
Vue.use(NavPlugin);
Vue.use(NavbarPlugin);
Vue.use(DropdownPlugin);
Vue.use(FormPlugin);
Vue.use(FormCheckboxPlugin);
Vue.use(InputGroupPlugin);
// Vue.use(ImagePlugin); // todo: compare it with lazy load functions, see if it is working properly
// Vue.use(ButtonPlugin);
// Vue.use(CardPlugin);
// Vue.use(TablePlugin);


//Install Axios
// import Axios from "axios";
// import VueAxios from "vue-axios";
// Vue.use(VueAxios, Axios);

//Import vue-lazyload
import VueLazyload from 'vue-lazyload';
// or with options
Vue.use(VueLazyload, {
  preLoad: 1.3,
  error: 'assets/repoImg/error.jpg',
  loading: 'assets/repoImg/loading.gif',
  attempt: 1
});

//Install Vue Validate
// import Vuelidate from "vuelidate";  //https://vuelidate.js.org/#sub-basic-form
// Vue.use(Vuelidate);

//vue
Vue.config.productionTip = false;

new Vue({
  el: "#app",
  delimiters: ["${", "}"],
  data: {
    showModal: false,
  },
  methods:{
  },
  mounted(){
    // console.log("mounted");
  },
  updated(){
    // console.log("updated");
  }
});
