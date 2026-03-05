# Project Log

## 2026-02-25T17:30 Image Loading Optimization & Cloudflare Migration

**Problem:** Gallery with 155 photos loaded slowly on iPhone - images appeared one by one with empty spaces, poor user experience.

**Solution:**
1. Added blur placeholders (LQIP) - 20px tiny images that load instantly
2. Implemented above-fold prioritization - first 8 images load immediately
3. Added Intersection Observer for lazy loading remaining images
4. Added shimmer animation while loading
5. Migrated deployment from GitHub Pages to Cloudflare Pages for faster global CDN

**Files changed:**
- `layouts/gallery/list.html` - Template with blur/lazy loading logic
- `layouts/_default/baseof.html` - CSS for blur/shimmer effects

**Result:** Site now at https://wjzhu.pages.dev/ with instant visual feedback on gallery load.

## 2026-02-25T09:30 Cloudflare Pages Setup

**Problem:** Needed faster hosting with better China connectivity than GitHub Pages.

**Solution:**
- Created Cloudflare Pages project via Git integration
- Connected GitHub repo `weijie-zhu/weijie-zhu.github.io`
- Build command: `hugo`, Output: `public`
- Auto-deploys on push to main

**Note:** Use Pages (not Workers) for static sites. Workers for dynamic functions.

## 2026-03-05T12:12 DIY Keyboard Project Documentation

**Problem:** Five DIY keyboard builds (Le Chiffre, Alice, Corne, Hummingbird, Sweep) had photos but no structured documentation with technical details.

**Solution:**
1. Researched each keyboard type using web search (QMK/ZMK firmware, ergonomic features, keymap info)
2. Analyzed images to identify hardware features (PCB design, controllers, case construction)
3. Created individual markdown files for each keyboard following existing project format
4. Included all relevant images with proper relative paths to assets folder
5. Documented ergonomic benefits, technical specifications, and external references

**Files created:**
- `content/project/le-chiffre-keyboard.md` - 30% ortholinear keyboard
- `content/project/alice-keyboard.md` - Ergonomic Alice-layout keyboard
- `content/project/corne-keyboard.md` - 42-key split columnar keyboard
- `content/project/hummingbird-keyboard.md` - 30-key ultra-compact wireless keyboard
- `content/project/sweep-keyboard.md` - 34-key curved split keyboard

**Result:** All five keyboard projects now documented at `/content/project/` with complete image galleries and technical documentation.