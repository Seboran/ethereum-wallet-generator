<script setup>
defineProps({
  value: {
    type: String,
    required: true,
  },
})
</script>

<template>
  Public key:
  <input
    placeholder="public key"
    readonly
    :value="value"
  />
</template>
