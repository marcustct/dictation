# Dictation Buddy / 听写小助手

**Version:** 0.1 &nbsp;·&nbsp; **Date:** 2026-07-07

A web-based dictation (听写) practice tool for children using **iPad + Apple Pencil** in Safari — no native app, no build step, no dependencies. The whole app is a single self-contained `index.html`.

一个基于网页的儿童**听写练习**工具，专为 **iPad + Apple Pencil**（Safari）设计——无需安装 App、无需构建、无任何依赖。整个应用就是一个自包含的 `index.html`。

---

## Features / 功能

**English:**
- Two modes: Chinese dictation (中文听写) and English spelling.
- Word-bank management: create / edit / delete banks; backup & restore to a JSON file.
- Handwriting on a pressure-sensitive canvas with田字格 (Chinese) or four-line (English) guides.
- Speech synthesis reads each word aloud; slow-speed option for younger kids.
- Palm rejection so a resting hand doesn't draw once the Pencil is used.
- Parent review screen: mark each answer correct / needs-work, then print or save.

**中文：**
- 两种模式：中文听写、英文拼写。
- 词库管理：新建 / 编辑 / 删除词库；可备份、还原为 JSON 文件。
- 在压感画布上手写，中文显示田字格、英文显示四线格。
- 语音合成朗读每个词，支持慢速朗读（适合较小的孩子）。
- 防误触：使用 Apple Pencil 后，手掌触摸不会画上去。
- 家长批改页：逐题标记正确 / 待加强，可打印或保存记录。

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
├── index.html        <- the entire app (self-contained)
├── start.bat         <- local preview launcher
├── version.txt       <- current version
├── README.md
├── .gitignore
└── proj_ref/         <- original handoff doc & archived prototype
```

See `proj_ref/PROJECT_HANDOFF.md` for detailed technical notes and candidate next steps.
详细技术说明与后续方向见 `proj_ref/PROJECT_HANDOFF.md`。
