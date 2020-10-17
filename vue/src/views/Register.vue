<template>
  <div id="register" class="text-center">

    <form class="form-register" @submit.prevent="register">

      <!-- <h1 class="h3 mb-3 font-weight-normal">Create Your City Tours Account</h1>
      <h3>For security purposes, your password should contain at least 1 uppercase and 1 lowercase letter.</h3> -->

      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>

      <div class="main">

      <p class="sign" align="center">Create Your City Tours Account</p>

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
        align="center"
        placeholder="Password"
        v-model="user.password"
        required
      />
      

      <input class="pass"
        type="password"
        align="center"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      /> 

      
      <button class="submit-button" align="center" type="submit">Create Account</button> <br> <br>

      <div class="forgot" align="center">
      <router-link :to="{ name: 'login' }">Already have an account?</router-link>
      </div>


      </div>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
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

  .submit-button {
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
        margin-left: 30%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
        text-align: center;

    }

  .forgot {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        padding-top: 15px;
         font-weight: 700;
        font-size: 14px;
        letter-spacing: 1px;
        font-family: 'Open Sans', sans-serif;
  }

  .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }


</style>
