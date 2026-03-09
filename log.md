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

## 2026-03-05T12:15 Dify Workflow: Apple Notes to Notion

**Problem:** Needed to migrate 267+ Apple Notes to Notion while preserving metadata (creation dates), handling attachments, and maintaining organization.

**Solution:**
1. Created hybrid local + Dify workflow for automated migration
2. Built Python scripts for Dropbox attachment upload and JSON preparation
3. Implemented AI-powered categorization using DeepSeek-V3 via Dify
4. Added rate-limited Notion API integration for bulk imports
5. Configured proper .gitignore to exclude sensitive credentials and personal data

**Files created:**
- `content/project/dify-apple-notes-to-notion/index.md` - Project documentation

**Result:** Complete migration workflow documented at `/content/project/dify-apple-notes-to-notion/index.md` with GitHub repository linked.

## 2026-03-05T12:30 Keyboard Project Image Path Fix

**Problem:** Images displayed as "?" because paths were missing `/images/` prefix.

**Solution:**
1. Copied `project_blog_images` folder to `assets/images/project_blog_images/`
2. Updated all keyboard markdown files with correct paths: `images/project_blog_images/DIY_keyboard/...`

**Files changed:**
- All 5 keyboard project markdown files (front matter cover/gallery + inline images)

**Result:** Images now resolve correctly through Hugo's `resources.Get` function.

## 2026-03-05T13:20 Keyboard Projects - Page Bundle Restructure

**Problem:** Inline markdown images didn't display because Hugo doesn't auto-process them from `assets/` folder.

**Solution:**
1. Converted all keyboard projects to Hugo page bundles
2. Created folder structure: `content/project/[keyboard-name]/index.md`
3. Copied relevant images into each bundle folder
4. Removed gallery metadata, using only `cover` + inline images
5. Inline images now use relative paths (e.g., `![img](image.jpg)`)
6. Deleted old flat `.md` files

**Files changed:**
- Created: `content/project/{le-chiffre,alice,corne,hummingbird,sweep}-keyboard/index.md`
- Created: `content/project/{le-chiffre,alice,corne,hummingbird,sweep}-keyboard/*.jpg`
- Deleted: `content/project/{le-chiffre,alice,corne,hummingbird,sweep}-keyboard.md`

**Result:** All images now display correctly using Hugo page bundle resources.

## 2026-03-05T13:45 Final Page Bundle Setup

**Problem:** Previous restructuring left images mixed up across folders.

**Solution:**
1. Cleaned all bundle folders
2. Recreated all `index.md` files with correct relative image paths
3. Copied correct images to each bundle from public folder
4. Removed `.webp` cache files and `.html` build artifacts

**Final structure:**
```
content/project/
├── le-chiffre-keyboard/
│   ├── index.md
│   └── Le-chiffre-DIY-keyboard-4.JPEG
├── alice-keyboard/
│   ├── index.md
│   └── alice-DIY-keyboard-*.JPG/jpg (7 images)
├── corne-keyboard/
│   ├── index.md
│   └── corne-DIY-keyboard-*.jpg (3 images)
├── hummingbird-keyboard/
│   ├── index.md
│   └── hummingbird-DIY-keyboard-*.jpg (3 images)
└── sweep-keyboard/
    ├── index.md
    └── sweep-DIY-keyboard-*.jpg (5 images)
```

**Result:** Page bundles properly configured with inline images using relative paths.
