<template>
    <div class="row">
        <div v-if="links.found === 0">
            <div class="card">
                <div class="card-body">
                    There are no links yet, let's add some!
                </div>
            </div>
        </div>
        <div class="col-md-4"
             v-bind:key="link.id"
             v-for="link in links.items">

                <LinkCard
                        v-bind:link="link"
                        v-on:del-link="$emit('del-link', link.id)"/>
        </div>
    </div>
</template>

<script>
    import LinkCard from './LinkCard.vue';

    export default {
        name: "LinkPlato",
        components: {
            LinkCard
        },
        props: ["links"]
    }
</script>

<style scoped>
</style>