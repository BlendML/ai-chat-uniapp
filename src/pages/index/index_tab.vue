<template>
  <nut-tabs v-model="state.tab1value" swipeable>
    <nut-tab-pane title="对话">
      <div class="h-full p-4">
        <div class="app-box h-full w-full">
          <AIChat @trigger="triggerSettings">
            <AIMessage />
          </AIChat>
          <Settings :show="showSettings" @trigger="triggerSettings" />
        </div>
      </div>
    </nut-tab-pane>
    <nut-tab-pane title="智能体">
      <div>Tab 2</div>
    </nut-tab-pane>
    <nut-tab-pane title="广场">
      <div>Tab 3</div>
    </nut-tab-pane>
  </nut-tabs>
</template>

<script setup lang="ts">
import { reactive } from "vue";

import AIChat from "@/components/AIChat.vue";
import AIMessage from "@/components/AIMessage.vue";

const state = reactive({
  show1: false,
  width: "80%",
  height: "100%",
  tab1value: "0"
});

const handleClick1 = () => {
  state.show1 = true;
};

const showSettings = ref(false);

function triggerSettings(val: boolean) {
  showSettings.value = val;
}
</script>
