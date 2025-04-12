<template>
    <div class="result">
      <div class="title">{{ quizResult.title }}</div>
      <div class="desc">{{ quizResult.desc }}</div>
    </div>
  </template>
  
  <script>
  export default {
    props: ["quizResult"]
  };
  </script>
  
  <style>
 
  </style>