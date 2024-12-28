<template>
  <AIMessage />
</template>

<script setup lang="ts">
import AIMessage from "@/components/AIMessage.vue";

onNavigationBarButtonTap((obj) => {
  // 监听导航栏按钮点击
  console.log('onNavigationBarButtonTap', obj)
})
</script>
