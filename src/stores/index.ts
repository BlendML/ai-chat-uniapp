import { defineStore } from 'pinia'
import dayjs from 'dayjs'

type Message = {
  role: string,
  typing: boolean,
  loading: boolean,
  messageId: string,
  content: string,
}

export const useAIStore = defineStore('AIStore', () => {
  const serviceName = ref('小智')
  const temperature = ref(1)
  const messageList = ref<Message[]>([
    {
      role: 'AI',
      typing: true,
      loading: false,
      messageId: Math.random().toString(),
      content: '您好，我是智能对话系统，能帮您解答任何问题~',
    }
  ])

  return {
    serviceName,
    temperature,
    messageList
  }
})
