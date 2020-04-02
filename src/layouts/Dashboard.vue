<template>
    <div>
        <div class="row">
            <div class="col-md-4 col-sm-12">
                <LinkNew v-on:add-link="createLink">
                </LinkNew>
            </div>
            <div class="col-md-4 col-sm-12">
                <LinkPlato v-bind:links="links"
                           v-on:del-link="deleteLink"></LinkPlato>
            </div>
            <div class="col-md-4 col-sm-12"></div>
        </div>
    </div>
</template>

<script>
    import LinkNew from '../components/LinkNew.vue';
    import LinkPlato from '../components/LinkPlato.vue';
    import axios from 'axios';

    const linksAPIAddress = 'http://127.0.0.1/api/v1';

    export default {
        components: {
            LinkNew,
            LinkPlato,
        },
        data() {
            return {
                links: []
            }
        },
        methods: {
            createLink(newLink) {
                const {
                    name,
                    address
                } = newLink;

                axios.post(linksAPIAddress + '/links', {
                    data: {
                        name: name,
                        address: address
                    }
                })
                    .then(res => {
                            this.links.items = [...this.links.items, res.data];
                            this.$toasted.show("Link created!", {
                                theme: "outline",
                                position: "top-center",
                                duration: 1000
                            });
                        }
                    )
                    .catch(err => {
                        this.$toasted.show("Something went wrong :(", {
                            theme: "outline",
                            position: "top-center",
                            duration: 1000
                        });
                        console.log(err)
                    });
            },
            deleteLink(id) {
                axios.delete(linksAPIAddress + '/links', {
                    data: {
                        id: id
                    }
                })
                    .then(res => {
                        this.links.items = this.links.items.filter(link => link.id !== id);
                        this.$toasted.show("Link removed!", {
                            theme: "outline",
                            position: "top-center",
                            duration: 1000
                        });
                    })
                    .catch(err => {
                        this.$toasted.show("Something went wrong :(", {
                            theme: "outline",
                            position: "top-center",
                            duration: 1000
                        });
                        console.log(err)
                    });
            }
        },
        created() {
            axios.get(linksAPIAddress + '/links')
                .then(res => this.links = res.data)
                .catch(err => console.log(err));
        },
    }
</script>

<style>
</style>