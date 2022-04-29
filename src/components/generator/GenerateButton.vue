<script setup>
const emit = defineEmits(['submit']);

function submit() {
  emit('submit');
}
</script>

<template>
  <button @click="submit">GENERATE</button>
</template>
