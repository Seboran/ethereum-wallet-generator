<script setup>
import { ref } from 'vue'
import GenerateButton from './generator/GenerateButton.vue'
import PrivateKeyField from './generator/PrivateKeyField.vue'
import PublicKeyField from './generator/PublicKeyField.vue'

import generate from './generator/generate.js'

const publicKey = ref('')
const privateKey = ref('')

function generateKeys() {
  const { privateKey: pk, ethereumAddress: ethAddress } = generate('1')
  publicKey.value = ethAddress
  privateKey.value = pk
}
</script>

<template>
  <form @submit.prevent="generateKeys">
    <div>
      <GenerateButton />
    </div>
    <div>
      <PrivateKeyField :value="privateKey" />
    </div>
    <div>
      <PublicKeyField :value="publicKey" />
    </div>
  </form>
</template>
