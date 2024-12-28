<template>
  <nut-tabs v-model="state.tab1value" swipeable>
      <template #titles>
        <div class="title-list">
          <view
            v-for="item in state.list6" :key="item.paneKey" class="title-item"
            :class="{ 'tabs-active': state.tab7value === item.paneKey }" @click="state.tab1value = item.paneKey"
          >
            <nut-icon name="dongdong" />
            <view class="nut-tabs__titles-item__text">
              {{ item.title }}
            </view>
            <view class="item__line" />
          </view>
        </div>
      </template>

  <!-- <nut-popup position="left" :custom-style="{ width: '20%', height: '100%' }" v-model:visible="showLeft"></nut-popup> -->
    <nut-tab-pane title="对话" pane-key="c1">
      <div class="h-full p-4">
        <div class="app-box h-full w-full">
          <AIChat @trigger="triggerSettings">
            <AIMessage />
          </AIChat>
          <Settings :show="showSettings" @trigger="triggerSettings" />
        </div>
      </div>
    </nut-tab-pane>
    <nut-tab-pane title="智能体" pane-key="c2">
      <div>Tab 2</div>
    </nut-tab-pane>
    <nut-tab-pane title="广场" pane-key="c3">
      <div>Tab 3</div>
    </nut-tab-pane>
  </nut-tabs>
</template>

<script setup lang="ts">
import { reactive } from "vue";

import AIChat from "@/components/AIChat.vue";
import AIMessage from "@/components/AIMessage.vue";

const state = reactive({
  showLeft: false,
  tab1value: "0",
  tab7value: 'c1',
  list6: [
  {
    title: '自定义 1',
    paneKey: 'c1'
  },
  {
    title: '自定义 2',
    paneKey: 'c2'
  },
  {
    title: '自定义 3',
    paneKey: 'c3'
  }
]
});

const showLeft = ref(false);

const handleClick1 = () => {
  showLeft.value = true;
};

const showSettings = ref(false);

function triggerSettings(val: boolean) {
  showSettings.value = val;
}
</script>

<style lang="scss" scoped>
.title-list {
  display: flex;
  justify-content: space-around;
  align-items: center;
  width: 100%;

  .title-item {
    display: flex;
    justify-content: space-around;
    align-items: center;
    position: relative;
  }

  .tabs-active {
    font-weight: bold;
    color: $tabs-titles-item-active-color;
    opacity: $tabs-titles-item-line-opacity;
    transition: width 0.3s ease;

    .item__line {
      position: absolute;
      bottom: -10%;
      left: 50%;
      overflow: hidden;
      content: ' ';
      border-radius: $tabs-titles-item-line-border-radius;
      opacity: $tabs-titles-item-line-opacity;
      transition: width 0.3s ease;
      transform: translate(-50%, 0);
      width: $tabs-horizontal-titles-item-active-line-width;
      height: 3px;
      content: ' ';
      background: $tabs-horizontal-tab-line-color;
    }
  }
}
</style>
