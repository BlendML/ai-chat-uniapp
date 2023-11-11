import { defineConfig } from "vite";
import uni from "@dcloudio/vite-plugin-uni";
import UnoCSS from 'unocss/vite'
import AutoImport from 'unplugin-auto-import/vite'
import path from 'path'
import Components from '@uni-helper/vite-plugin-uni-components'
import { NutResolver } from 'nutui-uniapp'

// https://vitejs.dev/config/
export default defineConfig({
  resolve: {
    alias: {
       '@': path.resolve(__dirname, '..', 'src')
    }
  },
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: '@import \'@/theme.scss\'; @import \'nutui-uniapp/styles/variables.scss\';',
      },
    },
  },
  plugins: [
    Components({
      resolvers: [NutResolver()],
    }),

    uni(),

    AutoImport({
      imports: ['vue', 'pinia', 'uni-app'],
      dts: 'src/auto-imports.d.ts',
      dirs: ['src/composables', 'src/stores', 'src/components'],
      vueTemplate: true,
    }),

    UnoCSS()
  ]
});
