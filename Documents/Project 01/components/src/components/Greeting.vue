<template>
    <div>
        <h1>{{ msg }}</h1>
        <p>
            On your second day in Zanzibar, continue enjoying the island’s beauty. 
            Take a guided tour of Jozani Forest, home to the rare red colobus monkeys, or visit Prison Island, 
            known for its giant tortoises and historical ruins. For a more relaxed day, spend time at the beach, 
            try paddleboarding, or savor fresh seafood at local beachside restaurants. 
            unAs the day ends, unwind at Villa Kiva with dinner and enjoy your final evening by the ocean.
        </p>
    </div>
</template>

<script>
export default{
    name: 'Greeting',
    data(){
        return{
            msg: 'Hello Yusuph'
        }
    }
}
</script>

<style lang="scss" scoped>
p{
    color: red;
}
</style>