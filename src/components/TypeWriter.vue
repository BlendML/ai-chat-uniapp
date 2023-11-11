<template>
  <div class="flex items-center w-fit">
    <text>{{ state.text }}</text>
  </div>
</template>

<script setup lang="ts">
const props = defineProps<{
  data: string
}>()

const emit = defineEmits(['finish'])

const state = reactive({ text: '' })

addText()

function addText() {
  if (state.text.length < props.data.length) {
    state.text += props.data.charAt(state.text.length)
    setTimeout(addText, 30)
  } else {
   emit('finish')
 }
}
</script>

<style>
.wrap {
  white-space: pre-wrap;
}
</style>