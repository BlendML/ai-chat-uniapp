<template>
  <div class="send-box">
    <nut-input
      v-model="message"
      :border="true"
      placeholder="输入@召唤智能体"
    />

    <div class="i-tabler-send send-button" @click="sendMessage"></div>
  </div>
</template>

<script setup lang="ts">
import { Marked } from "marked";
import { markedHighlight } from "marked-highlight";
import hljs from "highlight.js";
import "highlight.js/styles/night-owl.css";

const marked = new Marked(
  markedHighlight({
    langPrefix: "hljs language-",
    highlight(code, lang, info) {
      const language = hljs.getLanguage(lang) ? lang : "plaintext";
      return hljs.highlight(code, { language }).value;
    },
  }),
);

marked.use({
  gfm: true,
  breaks: false
});

const store = useAIStore()
const message = ref('')

const StreamRequest = (question) => {
  return new Promise((resolve, reject) => {
      const response = uni.request({
      url: `http://192.168.7.19:20000/v1/chat/completions`,
      method: "POST",
      data: {
        model: "Qwen2.5-14B-Instruct-GPTQ-Int8",
        messages: [{ role: "user", content: question }],
        stream: true
      },
      enableChunked: true,
      success: (res) => {
        resolve(res)
      },
      fail: (res) => {
        reject(err)
      },
    })

    resolve(response)
  })
}

async function sendMessage() {
  const tempMsgId = Math.random().toString()
  const question = message.value
  const temperature = store.temperature / 100

  store.messageList.push({
    role: 'Me',
    typing: false,
    loading: false,
    messageId: Math.random().toString(),
    content: message.value,
  })

  store.messageList.push({
    role: 'AI',
    typing: false,
    loading: true,
    messageId: tempMsgId,
    content: ""
  })

  message.value = ''

  const response = await uni.request({
    url: `http://192.168.7.19:20000/v1/chat/completions`,
    method: "POST",
    data: {
      model: "Qwen2.5-14B-Instruct-GPTQ-Int8",
      messages: [{ role: "user", content: question }],
      stream: true
    },
    enableChunked: true,
    success: (res) => {
      console.log("====>res: ", res)
    },
    fail: (err) => {
      console.log("====>err: ", err)
    },
  })

  response.onChunkReceived((chunk) => {
    const uint8Array = new Uint8Array(chunk.data);
    let text = String.fromCharCode.apply(null, uint8Array);
    text = decodeURIComponent(escape(text));

    // 删除event stream的data:
    text = text.replace(/^data: /, '');
    console.log(text);

    // 将text转换为json，并提取content
    const json = JSON.parse(text)
    const content = json.choices[0].delta.content
    console.log(content)

    // 将content转换为markdown
    const markdown = marked(content)

    // 存入store
    store.messageList = store.messageList.map(item => {
      if (item.messageId == tempMsgId) {
        return {
          role: 'AI',
          typing: true,
          loading: false,
          messageId: Math.random().toString(),
          content: markdown,
        }
      } else {
        return item
      }
    })
  })

  // const result = response.data as AnyObject
  // let content = "我不懂您的问题，请换一个～"

  // if (response.statusCode == 200) {
  //   content = result.choices[0].message.content.replace(/^\"|\"$/g, '').replace(/\\n/g, '\n').replace(/\\\"/g, '"')
  // }

  // store.messageList = store.messageList.map(item => {
  //   if (item.messageId == tempMsgId) {
  //     return {
  //       role: 'AI',
  //       typing: true,
  //       loading: false,
  //       messageId: Math.random().toString(),
  //       content: md.render(content),
  //       createAt: dayjs().format('HH:mm')
  //     }
  //   } else {
  //     return item
  //   }
  // })
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
