# Dictation Buddy / 听写小助手

**Version:** 0.3 &nbsp;·&nbsp; **Date:** 2026-07-07

A web-based dictation (听写) practice tool for children using **iPad + Apple Pencil** in Safari — no native app, no build step, no dependencies. The whole app is a single self-contained `index.html`.

一个基于网页的儿童**听写练习**工具，专为 **iPad + Apple Pencil**（Safari）设计——无需安装 App、无需构建、无任何依赖。整个应用就是一个自包含的 `index.html`。

---

## Features / 功能

**English:**
- Two modes: Chinese dictation (中文听写) and English spelling.
- Word-bank management: create / edit / delete banks; backup & restore to a JSON file.
- Handwriting on a pressure-sensitive canvas with田字格 (Chinese) or four-line (English) guides.
- **Pinyin practice row** (optional): a 四线三格 pinyin grid above each Chinese character so the child writes the pinyin from listening too.
- **Pinyin hint**: the reveal (eye) button and the review cards show the 汉语拼音 with tone marks (generated offline via bundled `pinyin-pro`).
- Speech synthesis reads each word aloud; slow-speed option for younger kids.
- Palm rejection so a resting hand doesn't draw once the Pencil is used.
- Parent review screen: mark each answer correct / needs-work, then print or save.
- **Installable PWA**: add to the Home Screen and use fully offline (no network needed).

**中文：**
- 两种模式：中文听写、英文拼写。
- 词库管理：新建 / 编辑 / 删除词库；可备份、还原为 JSON 文件。
- 在压感画布上手写，中文显示田字格、英文显示四线格。
- **拼音练习行**（可选）：在每个中文田字格上方加四线三格，让孩子听音把拼音也写出来一起练。
- **拼音提示**：点「眼睛」按钮的提示和批改卡片都会显示带声调的汉语拼音（离线内置 `pinyin-pro` 生成）。
- 语音合成朗读每个词，支持慢速朗读（适合较小的孩子）。
- 防误触：使用 Apple Pencil 后，手掌触摸不会画上去。
- 家长批改页：逐题标记正确 / 待加强，可打印或保存记录。
- **可安装为 PWA**：可「添加到主屏幕」，完全离线使用（无需联网）。

---

## How to Run Locally / 如何本地运行

**English:**
Double-click `start.bat` to serve the app at `http://localhost:8080/`. To test on an iPad on the same Wi-Fi, open `http://<this-PC-IP>:8080/` in Safari. You can also just open `index.html` directly in a browser.

**中文：**
双击 `start.bat`，应用会在 `http://localhost:8080/` 启动。若要在同一 Wi-Fi 下的 iPad 上测试，请在 Safari 打开 `http://<本机IP>:8080/`。也可以直接在浏览器中打开 `index.html`。

---

## Deployment / 部署

**English:**
Hosted on **GitHub Pages** — the `index.html` at the repo root is served automatically. To update: commit and push, then hard-refresh Safari on the iPad after Pages rebuilds (1–2 min).

**中文：**
部署在 **GitHub Pages** 上——仓库根目录的 `index.html` 会被自动发布。更新方法：提交并推送，等待 Pages 重新构建（约 1–2 分钟）后在 iPad 的 Safari 强制刷新。

> **Updating an installed PWA / 更新已安装的应用：** after deploying, bump `CACHE` in `sw.js` (e.g. `dictation-v0.2` → `v0.3`) so the service worker refreshes the cached files. 部署后请在 `sw.js` 中修改 `CACHE` 版本号（如 `dictation-v0.2` → `v0.3`），Service Worker 才会更新缓存的文件。

---

## Install & Offline / 安装与离线

**English:**
On the iPad in Safari, open the page, tap the Share button, then **Add to Home Screen**. It launches full-screen with its own icon and works offline (a service worker caches the app). Speech uses the system voices, which also work offline.

**中文：**
在 iPad 的 Safari 打开页面，点「分享」按钮，选择**添加到主屏幕**。之后会以独立图标全屏启动，并可离线使用（Service Worker 会缓存应用）。语音使用系统内置声音，同样支持离线。

---

## Data & Storage / 数据与存储

**English:**
Word banks are stored in the browser's `localStorage` (key `dictation_wordbanks_v1`) on the device. iOS Safari may clear it after ~7 days of inactivity, so use **Backup** regularly to save a JSON copy. Safari tabs and "Add to Home Screen" apps have separate storage — use backup/restore to move data between them.

**中文：**
词库保存在设备浏览器的 `localStorage`（键名 `dictation_wordbanks_v1`）。iOS Safari 可能在约 7 天不使用后清除数据，请定期使用**备份**功能导出 JSON。Safari 标签页与「添加到主屏幕」的应用存储相互独立——可用备份/还原在两者间迁移数据。

---

## Project Structure / 项目结构

```
Dictation Practice/
├── index.html              <- the app UI + logic
├── pinyin-pro.min.js       <- bundled pinyin library (offline, vendored)
├── manifest.webmanifest    <- PWA metadata (name, icons, colors)
├── sw.js                   <- service worker (offline caching)
├── icons/                  <- app icons (192 / 512 / maskable / apple-touch)
├── start.bat               <- local preview launcher
├── version.txt             <- current version
├── README.md
├── .gitignore
└── proj_ref/               <- original handoff doc & archived prototype
```

See `proj_ref/PROJECT_HANDOFF.md` for detailed technical notes and candidate next steps.
详细技术说明与后续方向见 `proj_ref/PROJECT_HANDOFF.md`。
