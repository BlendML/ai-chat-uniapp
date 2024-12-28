<template>
  <Settings :show="showSettings" @trigger="triggerSettings" />
  <nut-tabs v-model="state.tab1value" swipeable>
      <template #titles>
        <div class="title-list">
          <view
            v-for="item in state.list6" :key="item.paneKey" class="title-item"
            :class="{ 'tabs-active': state.tab1value === item.paneKey }" @click="handleClick(item.paneKey)"
          >
            <nut-icon name="dongdong" />
            <view class="nut-tabs__titles-item__text">
              {{ item.title }}
            </view>
          </view>
        </div>
      </template>
    <nut-tab-pane title="对话" pane-key="c1">
      <div class="h-full p-4">
        <div class="app-box h-full w-full">
          <AIMessage />
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
    title: '设置',
    paneKey: 'c0'
  },
  {
    title: '对话',
    paneKey: 'c1'
  },
  {
    title: '智能体',
    paneKey: 'c2'
  },
  {
    title: '广场',
    paneKey: 'c3'
  }
]
});

const showSettings = ref(false);

const handleClick = (paneKey: string) => {
  state.tab1value = paneKey;

  if (paneKey === 'c0') {
    showSettings.value = true;
  } else {
    showSettings.value = false;
  }
};

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
