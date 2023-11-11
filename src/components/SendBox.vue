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

async function sendMessage() {
  const tempMsgId = Math.random().toString()

  store.messageList.push({
    role: 'Me',
    typing: false,
    loading: false,
    messageId: Math.random().toString(),
    content: message.value,
    createAt: dayjs().format('HH:mm')
  })

  store.messageList.push({
    role: 'AI',
    typing: false,
    loading: true,
    messageId: tempMsgId
  })

  const response = await uni.request({
      url: 'https://api.ai-chat.run/ask?question=' + message.value,
      method: "POST"
  });

  const result = response.data as AnyObject
  let content = '"我不懂您的问题，请换一个～"'

  if (result.code == 200) {
    content = result.data.choices[0].content
    content = content.replace(/(^\\")|(\\"$)/g, "").replace(/^\"|\"$/g, '').replace(/\\n/g, '\n')
  }

  store.messageList = store.messageList.map(item => {
    if (item.messageId == tempMsgId) {
      return {
        role: 'AI',
        typing: true,
        loading: false,
        messageId: Math.random().toString(),
        content: content,
        createAt: dayjs().format('HH:mm')
      }
    } else {
      return item
    }
  })

  message.value = ''
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