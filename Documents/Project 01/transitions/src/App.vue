<script>
export default{
  name: 'App',
  data(){
    return{
      items: ['a','b','c','d','e']
  }
},
methods:{
  shuffle() {
    this.items.sort(() => Math.random() - 0.5)
  }
 }
}
</script>

<template>
  <div>
    <button type="button" @click="shuffle">shuffle</button>
    <transition-group tag="ul" name="list">
      <li v-for="(item, index) in items" :key="index">
        {{ item }}</li>
    </transition-group>
  </div>
</template>

<style scoped>
.list-enter-active, .list-leave-active {
  transition: all .5s;
  }
.list-enter, .list-leave-to {
    opacity: 0;
    transform: translateY(30px);
}

/* .fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
  }
.fade-enter-from,
.fade-leave-to {
    opacity: 0;
} */

</style>