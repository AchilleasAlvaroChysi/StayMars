<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
  created () {
    this.checkCurrentLogin()
  },
  updated () {
    if (!localStorage.token && this.$route.path !== '/') {
      this.$router.push('/?redirect=' + this.$route.path)
        .catch(() => {})
    }
  },
  methods: {
    checkCurrentLogin () {
      if (localStorage.token) {
        this.$router.replace(this.$route.query.redirect || '/units')
          .catch(() => {})
      } else {
        console.log('HERE I GOT ERROR')
      }
    }
  }
}

</script>

<style>
</style>
