<template>

  <div id="login" class="text-center">

    <form class="form-signin" @submit.prevent="login">

      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>

      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div> <br>

<div class="main">

  <p class="sign" align="center">Welcome to City Tours</p>
  <p id="city-tours-description">Plan your trip to Austin, TX!</p>

      <input class="un"
        type="text"
        align="center"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      
      <input class="pass"
        type="password"
        align= "center"
        placeholder="Password"
        v-model="user.password"
        required
      />

      <button class="submit" type="submit">Sign in </button> <br> <br>

    <div class="forgot" align="center">
      <router-link :to="{ name: 'register' }">Need an account?</router-link> <br> <br>
    </div>


</div>
    </form>
    <div id="ViewList" align="center">
      <router-link :to="{ name: 'landmark' }">Explore landmarks without signing in!</router-link>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>

.main {
  background-color: #FFFFFF;
  width: 400px;
  height: 400px;
  margin: 7em auto;
  border-radius: 1.5em;
  box-shadow: 0px 11px 35px 2px rgba(0,0,0,0.14);
}

.sign {
  padding-top: 40px;
  color: #8C5AAA;
  font-family: 'Open Sans', sans-serif;
  font-weight: bold;
  font-size: 23px;
}

.un {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Open Sans', sans-serif;
}

.pass {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Open Sans', sans-serif;
    }

    #city-tours-description {
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    padding: 10px 20px;
    border: none;
    margin-bottom: 50px;
    /* margin-left: 5px; */
    text-align: center;
    margin-bottom: 27px;
   font-family: 'Open Sans', sans-serif;
    }

    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #9C27B0, #E040FB);
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Open Sans', sans-serif;
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);

    }

  #ViewList {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        font-weight: 700;
        font-size: 18px;
        letter-spacing: 1px;
        font-family: 'Open Sans', sans-serif;
  }

  .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    .alert {
        color: #E1BEE7;
        padding-top: 15px;
        font-weight: 700;
        font-size: 14px;
        letter-spacing: 1px;
        font-family: 'Open Sans', sans-serif;
        text-align: center;
    }

</style>