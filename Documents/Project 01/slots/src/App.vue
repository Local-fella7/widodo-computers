<template>
  <app-form>
    <template #help>
    <p>This is some help test</p>
  </template>
  <template #fields>
    <input type="text" placeholder="email">
    <input type="text" placeholder="username">
    <input type="password" placeholder="password">
  </template>
  <template #buttons>
    <button>Submit</button>
  </template>
  <p>
    Additional Details
  </p>
  </app-form>
  
  <br />
  <div>
    <app-form>
    <template #help>
    <p>This is some help test</p>
  </template>
  <template #fields>
    <input type="text" placeholder="name">
    <input type="text" placeholder="message">
    <input type="password" placeholder="password">
  </template>
  <template #buttons>
    <button>Submit</button>
  </template>
  </app-form>
  </div>
</template>

<script>
import AppForm from '@/components/Form.vue';
export default {
  name: 'App',
  components:{
    AppForm,
  }
}
</script>
