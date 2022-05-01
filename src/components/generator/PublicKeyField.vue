<script setup>
import CopyButton from './CopyButton.vue'

defineProps({
  value: {
    type: String,
    required: true,
  },
})
</script>

<template>
  <div class="row">
    <div class="col-sm-10">
      <label for="publicKeyField">Public key</label>
      <input
        id="publicKeyField"
        class="form-control"
        placeholder="public key"
        readonly
        :value="value"
      />
    </div>
    <div class="col-sm-2 align-self-end">
      <CopyButton :value="value" text="Copy public key"></CopyButton>
    </div>
  </div>
</template>
