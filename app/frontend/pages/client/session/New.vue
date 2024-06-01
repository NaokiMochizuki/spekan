<template>
  <ToastAlert ref="toastAlertRef"/>
  <Loading v-show="isLoading" />
  <div class="page main-signin-wrapper">
    <!-- Row -->
    <div class="row signpages text-center">
      <div class="col-md-12 my-auto">
        <div class="card">
          <div class="row row-sm">
            <div class="col-lg-6 col-xl-5 d-none d-lg-block text-center bg-primary details">
              <div class="mt-5 pt-4 p-2 position-absolute">
                <img src="../../../images/template/brand-logos/desktop-white.png" class="header-brand-img mb-4" alt="logo" />
                <div class="clearfix"></div>
                <img src="../../../images/template/svgs/user.svg" class="ht-100 mb-0" alt="user" />
                <h5 class="mt-4 text-fixed-white">Create Your Account</h5>
                <span class="fs-white-6 fs-13 mb-5 mt-xl-0">Signup to create, discover and connect with the global
                  community</span>
              </div>
            </div>
            <div class="col-lg-6 col-xl-7 col-xs-12 col-sm-12 login_form">
              <div class="main-container container-fluid">
                <div class="row row-sm">
                  <div class="card-body mt-2 mb-2">
                    <div class="clearfix"></div>
                    <form @submit.prevent="onLogin">
                      <h5 class="text-start mb-2">Signin to Your Account</h5>
                      <p class="mb-4 text-muted fs-13 ms-0 text-start">
                        Signin to create, discover and connect with the global community
                      </p>
                      <div class="form-group text-start">
                        <label>メールアドレス</label>
                        <input class="form-control" type="text" v-model='email' />
                      </div>
                      <div class="form-group text-start">
                        <label>パスワード</label>
                        <input class="form-control" type="password" v-model='password' />
                      </div>
                      <button type='submit' class="btn ripple btn-primary d-grid w-100">
                        ログイン
                      </button>
                    </form>
                    <div class="text-start mt-5 ms-0">
                      <div class="mb-1">
                        <router-link to="/client/forget_password">パスワードを忘れた方</router-link>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import ToastAlert from '@/components/shared/ToastAlert.vue'
import Loading from '@/components/shared/Loading.vue'
import axios from 'axios'
export default {
  name: 'clientSessionNew',
  components: { ToastAlert, Loading },
  data(){
    return {
      isLoading: false,
      email: null,
      password: null,
      submitable: false,
    }
  },
  mounted(){
    if (localStorage.getItem("loggedOut") === "true") {
      this.$refs.toastAlertRef.showSuccessToast('Success!', 'ログアウトしました')
      localStorage.removeItem("loggedOut")
    }
    if (localStorage.getItem("loggedInRequired") === "true") {
      this.$refs.toastAlertRef.showWarningToast('Warning!', 'ログインが必要です')
      localStorage.removeItem("loggedInRequired")
    }
  },
  computed: {
    ...mapState('clientUser', ['authToken', 'authedClientUser']),
  },
  methods: {
    ...mapActions('clientUser', ['login', 'logout']),
    async onLogin(){
      this.isLoading = true
      let payload = { email: this.email, password: this.password }
      try{
        await this.login(payload)
        localStorage.setItem("loggedIn", "true")
        this.isLoading = false
        this.$router.push('/client')
      }catch(error){
        this.isLoading = false
        this.$refs.toastAlertRef.showErrorToast('Error!', 'ログインに失敗しました')
      }

    },
  }
}
</script>

<style>
</style>

