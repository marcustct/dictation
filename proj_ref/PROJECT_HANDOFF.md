# Dictation Practice Tool — Project Handoff / 听写小助手项目交接

**Date:** 2026-07-07
**Status:** Working prototype deployed on GitHub Pages, tested on iPad mini + Apple Pencil
**Current file:** `dictation-practice-local.html` (single self-contained HTML, no build step, no dependencies)

---

## 1. What this project is / 项目简介

A web-based dictation (听写) practice tool for a child using **iPad mini + Apple Pencil** in Safari. No native app required. Parent manages word banks; child listens to spoken words and handwrites answers on canvas; parent reviews and marks results afterward.

---

## 2. Features implemented / 已实现功能

### Setup screen (首页)
- Two modes via tabs: **中文听写** (Chinese) / **English Spelling**
- Word bank CRUD: create / edit / delete banks; words entered one-per-line or comma-separated (supports `,`, `，`, `、`)
- Options: 随机顺序出题 (shuffle), 慢速朗读 (slow speech rate 0.55 vs 0.85)
- **Backup/Restore**: export all banks to JSON file (`dictation-wordbanks-YYYYMMDD.json`), import with validation + overwrite confirmation
- One sample bank per language seeded on first run

### Practice screen (听写页)
- **Canvas handwriting** via Pointer Events API, pressure-sensitive line width: `1.5 + pressure * 3.5`, ink color `#1F3A5F`
- **Grid rendering** (redrawn per question on canvas):
  - Chinese: 田字格 (character boxes with dashed cross guides), box size auto-scales to word length, clamp 56–150px
  - English: four-line writing guides (solid/dashed alternating) + red left margin line
- **Speech**: `speechSynthesis` with voice picking (`zh-CN` / `en-US`, exact match then prefix match), auto-speaks on question load, 🔊 replay button
- Controls: ↩️ undo last stroke, 🗑️ clear, 👁️ toggle answer reveal (hidden by default), progress dots (tappable to jump between questions), 🏠 exit with confirm
- Last question button changes to ✅ 完成听写

### Review screen (批改页)
- Grid of cards: question number, correct word, child's handwriting captured as PNG (`canvas.toDataURL`)
- Parent marks each ✓ 正确 / ✗ 待加强 (toggleable), stamp overlay shown on card
- Live summary counter (X/Y marked, correct count)
- Actions: 🔄 打乱重来 (reshuffle & restart same bank), 🖨️ print/save (print CSS shows review screen only, hides mark buttons), 🏠 home

### Palm rejection (防误触) — latest iteration, IMPORTANT
Four layers, added after real iPad testing showed palm touches triggering text selection highlight:
1. Global CSS: `body { -webkit-user-select:none; user-select:none; -webkit-touch-callout:none; touch-action:manipulation }` (inputs/textareas re-enabled with `user-select:text`)
2. **Pen-priority logic**: once `pointerType === 'pen'` is ever detected, all `touch` pointers on canvas are rejected (`penDetected` flag). Pen can also interrupt/steal an in-progress palm stroke. Side effect: after Pencil is used once, finger writing is disabled until page refresh — this is intentional.
3. `touchstart`/`touchmove` on document `preventDefault()`-ed while practice screen active (except targets inside `<button>`), `{ passive:false }`
4. `.paper-wrap { touch-action:none }` + canvas `touch-action:none`

---

## 3. Storage / 存储

- **`localStorage`**, key: `dictation_wordbanks_v1`
- Structure: `{ cn: [{id, name, words:[...]}], en: [...] }` — single key, whole object serialized
- History: originally used Claude Artifacts `window.storage` API; converted to localStorage for standalone deployment (verify no `window.storage` references remain if merging old versions)
- Known risk: iOS Safari may purge localStorage after ~7 days of inactivity → mitigated by JSON backup/restore feature
- Note: Safari tab vs "Add to Home Screen" PWA have **separate** localStorage — use backup/restore to migrate

## 4. Deployment / 部署

- Currently on **GitHub Pages**: repo under `marcustct`, page at `marcustct.github.io/...`
- Deploy = overwrite the HTML file in repo, wait 1–2 min for Pages rebuild, hard-refresh Safari on iPad
- Alternative considered: serve as static file via existing Nginx on 192.168.1.150 (`specialhost1.duckdns.org`) under `/dictation/` location block

## 5. Tech notes for future work / 技术备注

- Single file: all CSS/JS inline. Canvas sized with `devicePixelRatio` scaling (`ctx.setTransform(dpr,0,0,dpr,0,0)`), fixed CSS height 260px, width fluid
- Strokes stored as arrays of `{x, y, p}` points → enables undo (pop stroke + full redraw) — note: strokes are NOT persisted, only final PNG per question
- Resize handler re-inits canvas (debounced 250ms) but **clears strokes** — acceptable for now, could preserve via redraw
- `viewport-fit=cover`, `apple-mobile-web-app-capable` meta tags present for Home Screen PWA mode
- All UI text Simplified Chinese; design theme: mint-green paper notebook style, rounded playful buttons, Chalkboard SE display font

## 6. Candidate next steps / 可能的后续方向

(Not yet requested — confirm with user before building)
- Pinyin row for Chinese grids / 拼音行
- Practice history & wrong-word auto-collection (错题本) — would need storage schema v2
- Multiple children profiles
- Replay strokes as animation
- PWA manifest + service worker for true offline & icon
- Migrate to Flask backend (user's standard stack: Flask 3.1 + SQLAlchemy + SQLite + Bootstrap 5.3) if multi-device sync wanted

## 7. User's global Claude Code conventions / 用户 Claude Code 全局规范

Per `C:\Users\marcus\.claude\CLAUDE.md`: respond in Chinese; English-only file names; dual-language (EN+CN) docs; `version.txt` starting 0.1; `start.bat` per project; self-contained HTML documents; distinctive fonts + CSS variable themes.
