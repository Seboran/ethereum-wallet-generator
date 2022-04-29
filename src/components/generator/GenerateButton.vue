<script setup>
import { ref, computed } from 'vue'

const emit = defineEmits(['submit', 'update'])

const start = ref('')
const end = ref('')

function submit() {
  emit('submit')
}

function update() {
  emit('update', {
    start: start.value,
    end: end.value,
  })
}
</script>

<template>
  <input
    type="text"
    placeholder="start"
    v-model="start"
    @input="update"
  />
  <input type="text" placeholder="end" v-model="end" @input="update" />
  <button @click="submit">GENERATE</button>
</template>
