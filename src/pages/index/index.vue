<template>
  <div class='h-full w-full flex flex-col'>
    <div class="text-center my-2 w-full h-20">
      <image
        class="h-full"
        mode="aspectFit"
        src="/static/logo.jpg"
      />
    </div>

    <div class='h-full p-4'>
      <div class="app-box h-full w-full">
        <AIChat @trigger="triggerSettings" >
          <AIMessage  />
        </AIChat>

        <Settings :show="showSettings" @trigger="triggerSettings" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import AIChat from '@/components/AIChat.vue'
import AIMessage from '@/components/AIMessage.vue';
import Settings from '@/components/Settings.vue';


const showSettings = ref(false)

function triggerSettings(val: boolean) {
  showSettings.value = val
}
</script>

<style lang="scss">
.app-box {
  box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
}
</style>
