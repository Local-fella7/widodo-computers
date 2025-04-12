<template>
  <div class="text-white" text-center font-bold p4 mb-4 v-if="login_show_alert" :class="login_alert_variant">
    {{ login_alert_msg }}
  </div>
            <vee-form :validation-schema="loginSchema"
            @submit="login"
            :initial-values="loginData"
            >
              <!-- Email -->
              <div class="mb-3">
                <label class="inline-block mb-2">Email</label>
                <vee-field
                  type="email"
                  name="email"
                  class="block w-full py-1.5 px-3 text-gray-800 border border-gray-300 transition duration-500 focus:outline-none focus:border-black rounded"
                  placeholder="Enter Email"
                />
                <ErrorMessage class="text-red-600" name="email"/>
              </div>
              <!-- Password -->
              <div class="mb-3">
                <label class="inline-block mb-2">Password</label>
                <vee-field
                  type="password"
                  name="password"
                  class="block w-full py-1.5 px-3 text-gray-800 border border-gray-300 transition duration-500 focus:outline-none focus:border-black rounded"
                  placeholder="Password"
                />
                <ErrorMessage class="text-red-600" name="Password"/>
              </div>
              <button
                :disabled="login_in_submission"
                type="submit"
                class="block w-full bg-purple-600 text-white py-1.5 px-3 rounded transition hover:bg-purple-700"
              >
                Submit
              </button>
            </vee-form>
</template>

<script>
 import { mapActions } from 'pinia';
 import  useUserStore  from '../stores/user';


export default {
  name:'LoginForm',
  data() {
    return {
      loginSchema: {
        email: 'required|email',
        password: 'required|min:9|max:100',
      },
    loginData: {
      email: '',
      password: '',
    },
    login_in_submission: false,
    login_show_alert: false,
    login_alert_variant: 'bg-blue-500',
    login_alert_msg: 'Please wait! we are logging you in',
      }
      },
      methods: {
      ...mapActions(useUserStore, ['authenticate']),
      async login(values) {
        this.login_show_alert = true;
        this.login_in_submission = true;
        this.login_alert_variant = 'bg-blue-500';
        this.login_alert_msg = 'Please wait while we are logging you in';

        this.login_alert_variant = 'bg-green-500';
        this.login_alert_msg = 'Success! You are now logged in';
        // console.log(values);

        try{
          await this.authenticate(values);


            this.login_alert_variant = 'bg-green-500';
            this.login_alert_msg = 'Success! You are now logged in';


            setTimeout(() => {
              this.$router.push({ name: 'manage' }); // Use router navigation
            }, 1000);
        }catch(error){
          this.login_in_submission = false;
          this.login_alert_variant = 'bg-red-500';
          this.login_alert_msg = 'Invalid credentials! Please try again';
          console.log(error);
          return;
        }
        this.login_alert_variant = 'bg-green-500'
        this.login_alert_msg = 'Success! You are now logged in'
        window.location.reload();
      }
    }

}
</script>

