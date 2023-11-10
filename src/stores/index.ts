import { defineStore } from 'pinia'

type Message = {
  role: string,
  name: string,
  typing: boolean,
  loading: boolean,
  messageId: string,
  content: string,
  createAt: string
}

export const useAIStore = defineStore('AIStore', () => {
  const serviceName = ref('小智')
  const temperature = ref(1)
  const filterWords = ref("")
  const messageList = ref<Message[]>([])

  return {
    serviceName,
    temperature,
    filterWords,
    messageList
  }
})