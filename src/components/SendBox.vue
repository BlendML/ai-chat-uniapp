<template>
  <div class="send-box">
    <nut-input v-model="message" :border="true" placeholder="输入@召唤智能体" />

    <div class="i-tabler-send send-button" @click="sendMessage"></div>
  </div>
</template>

<script setup lang="ts">

const store = useAIStore();
const message = ref("");

async function sendMessage() {
  const tempMsgId = Math.random().toString();
  const question = message.value;
  const temperature = store.temperature / 100;

  store.messageList.push({
    role: "Me",
    typing: false,
    loading: false,
    messageId: Math.random().toString(),
    content: message.value,
  });

  store.messageList.push({
    role: "AI",
    typing: false,
    loading: true,
    messageId: tempMsgId,
    content: "",
  });

  message.value = "";

  const response = await uni.request({
    url: `http://192.168.7.19:20000/v1/chat/completions`,
    method: "POST",
    data: {
      model: "Qwen2.5-14B-Instruct-GPTQ-Int8",
      messages: [{ role: "user", content: question }],
    },
  });

  const result = response.data as AnyObject
  let content = "我不懂您的问题，请换一个～"

  if (response.statusCode == 200) {
    content = result.choices[0].message.content.replace(/^\"|\"$/g, '').replace(/\\n/g, '\n').replace(/\\\"/g, '"')
  }

  store.messageList = store.messageList.map(item => {
    if (item.messageId == tempMsgId) {
      return {
        role: 'AI',
        typing: true,
        loading: false,
        messageId: Math.random().toString(),
        content: content,
      }
    } else {
      return item
    }
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
