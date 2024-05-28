<template>
  <div>
    <svg-icon icon-class="github" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'WeBASE-Micro-Git',
  data() {
    return {
      url: 'https://gitee.com/dromara/WeBASE-Micro'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
