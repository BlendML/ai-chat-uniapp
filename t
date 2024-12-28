[1mdiff --git a/src/components/SendBox.vue b/src/components/SendBox.vue[m
[1mindex 732dd00..d45e5a0 100644[m
[1m--- a/src/components/SendBox.vue[m
[1m+++ b/src/components/SendBox.vue[m
[36m@@ -2,8 +2,8 @@[m
   <div class="send-box">[m
     <nut-input[m
       v-model="message"[m
[31m-      :border="false"[m
[31m-      placeholder="请输入文本"[m
[32m+[m[32m      :border="true"[m
[32m+[m[32m      placeholder="输入@召唤智能体"[m
     />[m
 [m
     <div class="i-tabler-send send-button" @click="sendMessage"></div>[m
[36m@@ -49,7 +49,6 @@[m [masync function sendMessage() {[m
     }[m
   });[m
 [m
[31m-  console.log("====>response: ", response)[m
   const result = response.data as AnyObject[m
   let content = "我不懂您的问题，请换一个～"[m
 [m
[1mdiff --git a/src/manifest.json b/src/manifest.json[m
[1mindex 776691b..250d1c8 100644[m
[1m--- a/src/manifest.json[m
[1m+++ b/src/manifest.json[m
[36m@@ -1,6 +1,6 @@[m
 {[m
     "name" : "智灵AI",[m
[31m-    "appid" : "",[m
[32m+[m[32m    "appid" : "wxffc22167bcc74212",[m
     "description" : "",[m
     "versionName" : "1.0.0",[m
     "versionCode" : "100",[m
[36m@@ -42,7 +42,7 @@[m
     },[m
     "quickapp" : {},[m
     "mp-weixin" : {[m
[31m-        "appid" : "",[m
[32m+[m[32m        "appid" : "wxffc22167bcc74212",[m
         "setting" : {[m
             "urlCheck" : false[m
         },[m
[1mdiff --git a/src/pages.json b/src/pages.json[m
[1mindex 97ab05b..e51e222 100644[m
[1m--- a/src/pages.json[m
[1m+++ b/src/pages.json[m
[36m@@ -10,13 +10,13 @@[m
 		{[m
 			"path": "pages/index/index",[m
 			"style": {[m
[31m-				"navigationBarTitleText": "uni-app"[m
[32m+[m				[32m"navigationBarTitleText": "智灵AI"[m[41m[m
 			}[m
 		}[m
 	],[m
 	"globalStyle": {[m
 		"navigationBarTextStyle": "black",[m
[31m-		"navigationBarTitleText": "uni-app",[m
[32m+[m		[32m"navigationBarTitleText": "智灵AI",[m[41m[m
 		"navigationBarBackgroundColor": "#F8F8F8",[m
 		"backgroundColor": "#F8F8F8"[m
 	}[m
[1mdiff --git a/src/pages/index/index.vue b/src/pages/index/index.vue[m
[1mindex 1ae1e21..f7b1ba0 100644[m
[1m--- a/src/pages/index/index.vue[m
[1m+++ b/src/pages/index/index.vue[m
[36m@@ -1,5 +1,6 @@[m
 <template>[m
   <div class='h-full w-full flex flex-col'>[m
[32m+[m[32m  <!--[m[41m[m
     <div class="text-center my-2 w-full h-20">[m
       <image[m
         class="h-full"[m
[36m@@ -7,6 +8,7 @@[m
         src="/static/logo.jpg"[m
       />[m
     </div>[m
[32m+[m[32m  -->[m[41m[m
 [m
     <div class='h-full p-4'>[m
       <div class="app-box h-full w-full">[m
