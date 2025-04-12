<template>
    <button class="reset-btn" @click="$emit('click')">{{ label }}</button>
  </template>
  
  <script>
  export default {
    props: ["label"]
  };
  </script>
  
  <style>
  
   </style>