<script setup>
import { ref } from 'vue'
import GenerateButton from './generator/GenerateButton.vue'
import PrivateKeyField from './generator/PrivateKeyField.vue'
import PublicKeyField from './generator/PublicKeyField.vue'

import generate from './generator/generate.js'

const publicKey = ref('')
const privateKey = ref('')

const start = ref('')
const end = ref('')

function update({ start: st, end: en }) {
  start.value = st
  end.value = en
}

function generateKeys() {
  publicKey.value = ''
  privateKey.value = ''
  var array = new Uint32Array(10)

  do {
    self.crypto.getRandomValues(array)
    const { privateKey: pk, ethereumAddress: ethAddress } = generate(
      array.join(''),
    )
    publicKey.value = ethAddress
    privateKey.value = pk
  } while (!hasSameStartAndEnd())
}

function hasSameStartAndEnd() {
  const startLength = start.value.length
  const endLength = end.value.length
  const startPublicKey = publicKey.value.slice(2, 2 + startLength)
  const endPublicKey = publicKey.value.slice(-endLength)

  return (
    (!startLength || startPublicKey === start.value) &&
    (!endLength || endPublicKey === end.value)
  )
}

function invalid() {
  console.error('Invalid ethereum address')
}
</script>

<template>
  <form @submit.prevent="generateKeys">
    <div>
      <GenerateButton @update="update" @invalid="invalid" />
    </div>
    <div>
      <PrivateKeyField :value="privateKey" />
    </div>
    <div>
      <PublicKeyField :value="publicKey" />
    </div>
  </form>
</template>
