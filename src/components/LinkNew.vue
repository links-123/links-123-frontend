<template>
    <div class="card">
        <h5 class="card-title">
            Add a new link
        </h5>
        <div class="card-body">
            <form @submit.prevent="createLink">
                <div class="form-row">

                    <div class="col">
                        <input id="linkAddressField"
                               class="form-control"
                               type="text"
                               v-model="linkAddress"
                               name="address"
                               placeholder="Link">
                    </div>

                    <div class="col">
                        <input id="linkNameField"
                               class="form-control"
                               type="text"
                               v-model="linkName"
                               name="name"
                               placeholder="Description">
                    </div>

                    <div class="col">
                        <button type="submit"
                                value="Add"
                                class="form-control btn btn-success">
                            <i class="fa fa-magic"></i>&nbsp; Add
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    export default {
        name: "LinkNew",
        data() {
            return {
                linkAddress: '',
                linkName: ''
            }
        },
        methods: {
            createLink() {
                const newLink = {
                    address: this.address,
                    name: this.name
                };
                this.$emit('add-link', newLink);

                this.address = '';
                this.name = '';
            }
        }
    }
</script>

<style scoped>
</style>