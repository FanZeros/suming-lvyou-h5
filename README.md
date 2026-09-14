# 宿命旅途·单机版（H5 自部署）

UrhoX H5 产物：页面资源自包含，引擎运行时（约 70MB）按 index.html 内置地址从官方 CDN 加载。

- 已剔除：Maker 预览调试桥、TapTap 水印、运行时凭证（mac-token/user_info）
- 已注入：sw-coop.js（GitHub Pages 隔离头）、WebSocket 免登录 shim（打开即玩）、eruda 移除
- 游戏存档保存在浏览器（本地回环单机架构，无需服务器）

## 本地运行

```bash
npx serve -l 8080 .      # serve.json 已带 COOP/COEP 头
```

打开 http://localhost:8080 （首次加载需联网拉取引擎运行时；必须 localhost 或 HTTPS）。

## GitHub Pages

https://fanzeros.github.io/suming-lvyou-h5/
