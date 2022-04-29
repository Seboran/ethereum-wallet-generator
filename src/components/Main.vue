<script setup>
import { ref } from 'vue'
import GenerateButton from './generator/GenerateButton.vue'
import PrivateKeyField from './generator/PrivateKeyField.vue'
import PublicKeyField from './generator/PublicKeyField.vue'

const publicKey = ref('123public')
const privateKey = ref('1234privé')

function generateKeys() {
  console.log('Generate keys')
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
