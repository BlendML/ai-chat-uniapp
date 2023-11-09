import { defineStore } from 'pinia'

export const useAIStore = defineStore('AIStore', () => {
  const serviceName = ref('小智')
  const temperature = ref(1)
  const filterWords = ref("")

  return {
    serviceName,
    temperature,
    filterWords
  }
})