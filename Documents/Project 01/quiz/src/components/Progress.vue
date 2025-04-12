<template>
    <div class="progress">
      <div class="bar"></div>
      <div class="status">{{ progress }}</div>
    </div>
  </template>
  
  <script>
  export default {
    props: ["progress"]
  };
  </script>
  
  <style>
  
  </style>