<template>
  <nut-popup
    :visible="props.show"
    position="right"
    closeable
    @click-close-icon="() => emit('trigger', false)"
    pop-class="h-full p-4"
  >
    <div class="py-10">
      <div class="mb-10">
        <div size="sm" class="mb-2">修改智能助手名称</div>
        <nut-input v-model='store.serviceName'></nut-input>
      </div>

      <div class='mb-10'>
        <div size="sm" class="mb-2">过滤关键词</div>
        <nut-textarea v-model="store.filterWords" :autosize="{ maxHeight: 100, minHeight: 50 }" />
      </div>

      <div class='mb-10'>
        <div size="sm" class="mb-10">回答多样性 (数值越大，多样性越高)</div>
        <nut-range v-model="store.temperature" :min="1" :max="100" >
          <template #button>
            <div class="custom-button">{{ store.temperature }}</div>
          </template>
        </nut-range>
      </div>
    </div>
  </nut-popup>
</template>

<script setup lang="ts">
import { useAIStore } from '@/stores'

const props = defineProps<{
  show: boolean
}>()

const emit = defineEmits(['trigger'])

const store = useAIStore()
</script>

<style>
.custom-button {
  width: 26px;
  color: #fff;
  font-size: 10px;
  line-height: 18px;
  text-align: center;
  background-color: #1877ff;
  border-radius: 100px;
}
</style>