<template>
  <div>
    <svg-icon icon-class="question" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'WeBASE-Micro-Wiki',
  data() {
    return {
      url: 'https://gitee.com/dromara/WeBASE-Micro/wikis'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
