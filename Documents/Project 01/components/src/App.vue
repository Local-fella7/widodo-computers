<template>
  <p>
    hey
  </p>
  <Button :color="buttonColor" @change-color="changeColor"/>
  <Greeting/>
  <User :age="age" @age-change="updateAge" :ageChangeFn="updatedAgeCB"/>
  <!-- <h1>Binding Classes</h1>
        <label for="checkbox">Check box</label>
        <input type="checkbox" v-model="check" id="check"><br><br>
        <select v-model="selectedColor"  name="selectedColor" id="selectedColor">
            <option value="red">Red</option>
            <option value="pink">Pink</option>
            <option value="blue">Blue</option>
            <option value="white">White</option>
        </select>
        <div class="circle" :class="show">
            <h3 :style="geuza">Hello Yusuph!</h3>
            </div> -->
</template>

<script>
import Greeting from '@/components/Greeting.vue'
import User from '@/components/User.vue'
import Button from '@/components/Button.vue'
  export default{
    name: 'App',
    components: {
      Greeting,
      User,
      Button,
    },
    data(){
        return{
            check: false,
            selectedColor:"blue" ,
            age: 20,
            buttonColor: "blue",   
        }
    },
    methods: {
      updateAge(newAge){
        this.age += newAge
      },
      updatedAgeCB(num){
        this.age += num
      },
      changeColor() {
      if (this.buttonColor === "blue") {
        this.buttonColor = "red";
      } else {
        this.buttonColor = "blue";
      }
    },
    computed: {
        show(){
            return {
                changeColor: this.check
            }
        },
        geuza(){
            return {
                color:`${this.selectedColor}`
            }
        }       
    }
  }
}
</script>

<style>
.circle{
    background-color: green;
    color: white;
    width: 200px;
    height: 200px;
    border-radius: 100%;
    text-align: center;
    line-height: 200px;
}
.changeColor{
    background-color: purple;
    color: white;
}
[v-cloak]{
    display: none;
}
</style>
