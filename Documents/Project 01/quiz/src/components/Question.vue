<template>
    <div class="single-question">
      <div class="question">{{ question.q }}</div>
      <div class="answers">
        <div 
          v-for="(answer, index) in question.answers" 
          :key="index" 
          class="answer" 
          @click="$emit('answer-selected', answer.is_correct)">
          {{ answer.text }}
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: ["question"]
  };
  </script>
  
  <style>
  
  </style>
  