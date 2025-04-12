<template>
  <div class="ctr">
    <Progress :progress="progress" />
    <Questions 
      v-if="!quizCompleted" 
      :question="questions[questionIndex]" 
      @answer-selected="selectAnswer" 
    />
    <Results v-if="quizCompleted" :quizResult="quizResult" />
    <Button label="Reset" @click="resetQuiz" />
  </div>
</template>

<script>
import Questions from "@/components/Question.vue";
import Results from "@/components/Result.vue";
import Button from "@/components/Button.vue";
import Progress from "@/components/Progress.vue";

export default {
  components: { 
    Questions, 
    Results, 
    Button, 
    Progress 
  },
  data() {
    return {
      questionIndex: 0,
      selectedAnswers: [],
      quizCompleted: false,
      questions: [
        { q: 'What is 2 + 2?', answers: [ { text: '4', is_correct: true }, { text: '3', is_correct: false }, { text: 'Fish', is_correct: false }, { text: '5', is_correct: false } ] },
        { q: 'How many letters are in the word "Banana"?', answers: [ { text: '5', is_correct: false }, { text: '7', is_correct: false }, { text: '6', is_correct: true }, { text: '12', is_correct: false } ] },
        { q: 'Find the missing letter: C_ke', answers: [ { text: 'e', is_correct: false }, { text: 'a', is_correct: true }, { text: 'i', is_correct: false } ] }
      ],
      results: [
        { min: 0, max: 2, title: "Try again!", desc: "Do a little more studying and you may succeed!" },
        { min: 3, max: 3, title: "Wow, you're a genius!", desc: "Studying has definitely paid off for you!" }
      ]
    };
  },
  computed: {
    progress() {
      return `${this.questionIndex + 1} out of ${this.questions.length} questions answered`;
    },
    score() {
      return this.selectedAnswers.filter(ans => ans).length;
    },
    quizResult() {
      return this.results.find(result => this.score >= result.min && this.score <= result.max);
    }
  },
  methods: {
    selectAnswer(is_correct) {
      this.selectedAnswers.push(is_correct);
      if (this.questionIndex < this.questions.length - 1) {
        this.questionIndex++;
      } else {
        this.quizCompleted = true;
      }
    },
    resetQuiz() {
      this.questionIndex = 0;
      this.selectedAnswers = [];
      this.quizCompleted = false;
    }
  }
};
</script>

<style>

</style>
