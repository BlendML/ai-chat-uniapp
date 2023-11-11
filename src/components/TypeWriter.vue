<template>
  <div class="animate-blink flex items-center w-fit">
    {{ state.text }}
  </div>
</template>

<script setup lang="ts">
const props = withDefaults(
  defineProps<{
    data: Array<string>;
    start?: number;
    enter?: number;
    end?: number;
    leave?: number;
  }>(),
  {
    data: () => [],
    start: 1000,
    enter: 60,
    end: 1500,
    leave: 30,
  },
)

const state = reactive({ text: '', complete: false, index: 0 });

addText();

function addText() {
  if (state.text.length < props.data[state.index].length && !state.complete) {
    state.text += props.data[state.index].charAt(state.text.length);
    setTimeout(addText, props.enter);
  }
}
</script>

<style lang="scss">
// @keyframes blink {
//   0% {
//     color: transparent,
//   }
//   45% {
//     color: transparent,
//   }
//   50% {
//     color: #6f6f6f,
//   }
//   100% {
//     color: #6f6f6f,
//   }
// }

// .animate-blink::after {
//   content: '|';
//   font-size: 0.6rem;
//   margin-left: 4px;
//   animation-name: blink;
//   animation-duration: 1s;
//   animation-iteration-count: infinite;
// }
</style>
