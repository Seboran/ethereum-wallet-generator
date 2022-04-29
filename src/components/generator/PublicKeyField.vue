<script setup>
import { useCopy } from './useCopy.js'

defineProps({
  value: {
    type: String,
    required: true,
  },
})
</script>

<template>
  Public key:
  <input placeholder="public key" readonly :value="value" />
  <button @click.prevent="useCopy(value)">COPY</button>
</template>
