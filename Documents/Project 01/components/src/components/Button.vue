<template>
    <button :style="{ backgroundColor: color }" @click="change">
      Click Here
    </button>
  </template>
  
  <script>
  export default {
    props: {
      // Accepts a string color with default "blue"
      color: {
        type: String,
        default: "blue",
        validator: function (value) {
           typeof value === "string";
        },
      },
    },
    methods: {
      // Emits an event when the button is clicked
      change() {
        this.$emit("change-color");
      },
    },
  };
  </script>
  
  <style lang="scss" scoped>
  button {
    padding: 10px 20px;
    border: none;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  </style>
  