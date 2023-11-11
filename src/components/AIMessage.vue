<template>
  <div class='flex flex-col h-full grow'>
    <div class='grow message-container'>
      <template v-for="item in store.messageList" :key="item.messageId">
        <div v-if="item.role == 'AI'" class='flex items-center mb-8'>
          <div class='avator'>
            <nut-avatar>
              <image class='h-10 w-10' src="/static/avator.png" mode='scaleToFill' />
            </nut-avatar>
          </div>
          <div class='message-content p-4 ml-2'>
            <div class='mb-2'>
              <span class='font-bold mr-2'>{{ store.serviceName }}</span>
              <span class='opacity-80 text-xs'>{{ item.createAt }}</span>
            </div>
            <div v-if="item.loading">
              <image class="w-10 h-10" src='/static/message-loading.svg' fit="scaleToFill" />
            </div>
            <div v-else>
              <type-writer :data="[item.content]" />
            </div>
          </div>
        </div>

        <div v-else class='flex items-center mb-8 justify-end'>
          <div class='message-content my-message-content p-4 ml-2'>
            <div class='mb-2'>
              <span class='opacity-80 text-xs'>{{ item.createAt }}</span>
            </div>
            <div>
              {{ item.content }}
            </div>
          </div>
        </div>
      </template>
    </div>

    <div>
      <SendBox />
    </div>
  </div>
</template>

<script setup lang="ts">
const store = useAIStore()
</script>

<style lang="scss">
.message-container {
  background-color: #ebf3f8;
  padding: 30px;
}

.message-content {
  box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
  border-radius: 10px;
  line-height: 1.6rem;
  background-color: #fff;
}

.my-message-content {
  background-color: #c7e0f4;
}
</style>