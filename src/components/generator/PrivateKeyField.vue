<script setup>
import { ref, computed } from 'vue'
import useClipboard from 'vue-clipboard3'

const LENGTH_PRIVATE_KEY = 64

const { toClipboard } = useClipboard()

const props = defineProps({
  value: {
    type: String,
    required: true,
  },
})

const paddedValue = computed(() =>
  props.value ? props.value.padStart(LENGTH_PRIVATE_KEY, '0') : '',
)

async function copy() {
  try {
    await toClipboard(paddedValue.value)
    console.log('Copied to clipboard')
  } catch (e) {
    console.error('Failed to copy, see error:', e)
  }
}

// Switch between clear and hidden private key value
// Uses a boolean to switch between 0 and 1, between "password" and "text"
// See reveal function
const inputTypeValues = ['password', 'text']
const inputTypeIndex = ref(0)
const inputType = computed(() => inputTypeValues[inputTypeIndex.value])

function reveal() {
  // Unary operator + to cast boolean into Number
  // Note : the "!" unary operator implictly casts into a boolean
  inputTypeIndex.value = +!inputTypeIndex.value
}
</script>

<template>
  Private key:
  <input
    :type="inputType"
    readonly
    :value="paddedValue"
    placeholder="private key"
    autocomplete="new-password"
  />
  <button @click.prevent="copy">COPY</button>
  <button @click.prevent="reveal">REVEAL</button>
</template>
