<template>
  <div class="send-box">
    <nut-input
      v-model="message"
      :border="false"
      placeholder="请输入文本"
    />

    <div class="i-tabler-send send-button" @click="sendMessage"></div>
  </div>
</template>

<script setup lang="ts">
import dayjs from 'dayjs'

const store = useAIStore()
const message = ref('')

function sendMessage() {
  store.messageList.push({
    role: 'Me',
    name: 'me',
    typing: false,
    loading: false,
    messageId: Math.random().toString(),
    content: message.value,
    createAt: dayjs().format('HH:mm')
  })
}
</script>

<style lang="scss">
.send-box {
  background-color: #fff;
  @apply flex items-center;
}

.send-button {
  color: #9f9f9f;

  @apply p-1 mr-2 cursor-pointer;
}
</style>