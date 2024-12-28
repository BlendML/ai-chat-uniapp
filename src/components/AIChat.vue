<template>
  <div class='flex flex-col h-full'>
    <div class='navbar'>
      <div class='flex items-center'>
        <div>
          <image class='h-10 w-10 mr-2' src="/static/ai.png" mode='scaleToFill' />
        </div>

        <div>
          <div class='text-sm font-bold'>
           智能助手
          </div>
          <div class='text-xs'>
          AI问答专家
          </div>
        </div>
      </div>

      <div>
        <div class="i-tabler-settings" @click="() => emit('trigger', true)"></div>
      </div>
    </div>

    <div class="grow" >
      <slot />
    </div>
  </div>
</template>

<script setup lang="ts">
const emit = defineEmits(['trigger'])
</script>

<style lang="scss">
.navbar {
  background-color: #f5f5f5;
  border-bottom: 1px solid #ddd;

  @apply p-5 flex items-center justify-between;
}
</style>
