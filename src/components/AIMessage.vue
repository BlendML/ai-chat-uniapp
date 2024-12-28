<template>
  <div class='flex flex-col h-full grow'>
    <scroll-view
      class="message-wrapper"
      :scroll-y="true"
      :scroll-with-animation="true"
      :scroll-into-view="focusRef"
    >
      <div class="message-container">
        <template v-for="(item, index) in store.messageList" :key="item.messageId">
          <div :id=" 'id-' + index " >
            <div v-if="item.role == 'AI'" class='flex items-center mb-8'>
              <div class='avator'>
                <nut-avatar>
                  <image class='h-10 w-10' src="/static/avator.png" mode='scaleToFill' />
                </nut-avatar>
              </div>
              <div class='message-content p-4 ml-2'>
                <div v-if="item.loading">
                  <image class="w-10 h-10" src='/static/message-loading.svg' fit="scaleToFill" />
                </div>
                <div v-else>
                  <type-writer :data="item.content" @finish="handleSend" />
                </div>
              </div>
            </div>

            <div v-else class='flex items-center mb-8 justify-end'>
              <div class='message-content my-message-content p-4 ml-2'>
                <div>
                {{ item.content }}
                </div>
              </div>
              <div class='avator'>
                <nut-avatar>
                  <image class='h-10 w-10' src="/static/avator.png" mode='scaleToFill' />
                </nut-avatar>
              </div>
            </div>
          </div>
        </template>
      </div>
    </scroll-view>

    <div>
      <SendBox />
    </div>
  </div>
</template>

<script setup lang="ts">
const store = useAIStore()

const focusRef = ref('')

function handleSend() {
  const len = store.messageList.length
  focusRef.value = 'id-' + (len - 1)
}
</script>

<style lang="scss">
.message-wrapper {
  background-color: #ebf3f8;
  width: 100%;
  height: 600px;
}

.message-container {
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
