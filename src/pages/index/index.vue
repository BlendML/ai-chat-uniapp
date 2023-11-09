<template>
  <div class="app-box h-full">
    <AIChat @trigger="triggerSettings" >
      <AIMessage />
    </AIChat>

    <Settings :show="showSettings" @trigger="triggerSettings" />
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
