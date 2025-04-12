<template>
    <div>
        <button @click="onClickAge">Update Age Event</button>
        <button @click="ageChangeFn(3)">Update Age CB</button>
        <p>Age: {{ age }}</p>
        <p>User is {{ ageDubled }} Years Old</p>
    </div>
</template>

<script>
export default {
    name: 'User',
    //props validation
    props: {
        age:{
            type: Number,
            required: true,
            //default: 20,
            validator: function (value){
                 value < 130
                 }
        },
        ageChangeFn:Function
    },
    emits: ['age-change'],
    computed: {
        ageDubled(){
            return this.age * 2;
        }
    },
    methods:{
        onClickAge(){
            this.$emit('age-change', 3);
        }
    }
}
</script>

<style lang="scss" scoped>

</style>