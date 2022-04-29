<script setup>
import { ref, computed } from 'vue'

const emit = defineEmits(['submit', 'update', 'invalid'])

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
const keysAllowed = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
]
function isHex(event) {
  const keyPressed = event.key

  if (!keysAllowed.includes(keyPressed)) {
    event.preventDefault()
    emit('invalid')
  }
}
</script>

<template>
  <input
    type="text"
    placeholder="start"
    v-model="start"
    @keypress="isHex($event)"
    @input="update"
  />
  <input
    type="text"
    placeholder="end"
    v-model="end"
    @keypress="isHex($event)"
    @input="update"
  />
  <button @click="submit">GENERATE</button>
</template>
