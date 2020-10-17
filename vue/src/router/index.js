import Vue from 'vue'
import Router from 'vue-router'
import store from '../store/index'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import Itinerary from '../views/Itinerary.vue'
import Landmark from '../views/Landmark.vue'
import LandmarkDetails from '../views/LandmarkDetails.vue'
import ItineraryDetails from '../views/ItineraryDetails.vue'

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/itinerary",
      name: "itinerary",
      component: Itinerary,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/landmark",
      name: "landmark",
      component: Landmark,
      meta: {
        requiresAuth: false
      }
    },
    {
    path: "/landmark/details/:id",
    name: "landmark-details",
    component: LandmarkDetails,
    meta: {
      requiresAuth: false
      }
    },
    {
      path: "/itinerary/details/:id",
      name: "itinerary-details",
      component: ItineraryDetails,
      meta: {
        requiresAuth: true
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
