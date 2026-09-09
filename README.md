<div align="center">

# 🤖 Hermes Stack

### **Hermes Agent + 9Router + OmniRouter — یک Space رایگان، چند کلیک**

**One free Hugging Face Space running the whole stack — deployed through a beautiful web wizard.**

[![Deploy with Web Wizard](https://img.shields.io/badge/⚡_Deploy-Web_Wizard-8b7cff?style=for-the-badge&labelColor=0a1026)](https://godde3s.github.io/hermes-stack/deploy.html)
[![Landing Page](https://img.shields.io/badge/🌐_Landing-godde3s.github.io-3ee0ff?style=for-the-badge&labelColor=0a1026)](https://godde3s.github.io/hermes-stack/)
[![Hugging Face Space](https://img.shields.io/badge/🤗_Runs_on-HF_Spaces(docker)-ffc35c?style=for-the-badge&labelColor=0a1026)](https://huggingface.co/spaces)
[![License: MIT](https://img.shields.io/badge/📜_License-MIT-43f0c8?style=for-the-badge&labelColor=0a1026)](LICENSE)

[English](#-english) · [فارسی](#-فارسی)

</div>

---

## 🇬🇧 English

**Hermes Stack** turns a *free* [Hugging Face Space](https://huggingface.co/spaces) into a full self-hosted AI platform — no credit card, no KYC, no server:

| Component | What you get | Where |
|---|---|---|
| 🧠 **Hermes Agent** (NousResearch) | Telegram bot control + **Web Dashboard** + web search | `/hermes/` |
| 🔌 **Web-to-API** | OpenAI-compatible endpoint for the agent | `/hermes-api/v1` |
| 🌐 **9Router** (decolua) | Dashboard + free/paid models + own API key management | `/` |
| 🔑 **OmniRouter** (Godde3s) | Keyless models (Qwen/Gemini/OpenCode guest) as Hermes provider | internal |
| 💾 **Hourly backups** | Full state → private HF dataset, auto-restore on boot | dataset |
| ⏰ **Keep-alive** | 5-min cron ping prevents the Space from sleeping | optional |

### ⚡ Quick start (3 clicks)

1. **Get 2 tokens** — GitHub PAT (`repo` + `workflow`) and a Hugging Face **write** token.
2. **Open the [Web Wizard](https://godde3s.github.io/hermes-stack/deploy.html)** — paste tokens, Telegram bot token, auto-generated passwords → click **Deploy**. The wizard creates this repo, sets all secrets, triggers GitHub Actions and waits until your Space is 🟢 RUNNING.
3. **Talk to your agent** — Telegram `/start`, dashboard at `https://<user>-<space>.hf.space/hermes/`, API at `/hermes-api/v1`.

> 🔒 Everything runs **100% in your browser** — tokens are sent only to the official GitHub / Hugging Face / Telegram APIs and stored as encrypted repo/space secrets. No third-party server, no logging.

Manual path (no wizard): see [docs/manual-deploy.md](docs/manual-deploy.md) or fork this repo, add the secrets listed in the workflow, then **Run workflow** in the Actions tab.

### 🏗️ Architecture

```text
                       ┌────────────────────────────────────────────┐
 Telegram ◄─(polling)──┤  Hugging Face Space (free · 2vCPU · 16GB)  │
                       │                                            │
 Browser ──► :7860 ───►│  Caddy (front proxy)                       │
   ├── /               │    ├─ /            → 9Router :20128        │
   ├── /hermes/        │    ├─ /hermes/     → Hermes dashboard :9119│
   └── /hermes-api/    │    └─ /hermes-api/ → Hermes API :8642      │
                       │                                            │
                       │  Hermes gateway ──► 9Router + OmniRouter   │
                       │  backup.py (hourly) ──► private dataset    │
                       └────────────────────────────────────────────┘
```

### 🔧 Required GitHub secrets (wizard sets them automatically)

`HF_TOKEN`, `HF_USERNAME`, `HF_SPACE_NAME`, `TELEGRAM_BOT_TOKEN`, `TELEGRAM_ALLOWED_USERS`, `HERMES_API_KEY`, `NINEROUTER_API_KEY`, `OMNI_ROUTER_KEY`, `OMNI_ADMIN_PASSWORD`, `ROUTER_INITIAL_PASSWORD`, `DASHBOARD_USERNAME`, `DASHBOARD_PASSWORD` — optional: `BACKUP_REPO`, `HERMES_MODEL`, `HERMES_TIMEZONE`, `OMNI_ENABLED`, `HERMES_WEB_BACKEND`.

---

## 🇮🇷 فارسی

**Hermes Stack** یک Space *رایگان* Hugging Face را به یک پلتفرم کامل هوش مصنوعی تبدیل می‌کند — بدون کارت بانکی، بدون احراز هویت، بدون سرور:

| بخش | چه می‌دهد | مسیر |
|---|---|---|
| 🧠 **Hermes Agent** | ربات تلگرام + **داشبورد وب** + جستجوی وب | `/hermes/` |
| 🔌 **Web-to-API** | اندپوینت سازگار با OpenAI برای خودِ عامل | `/hermes-api/v1` |
| 🌐 **9Router** | داشبورد + مدل‌های رایگان/پولی + مدیریت کلید API | `/` |
| 🔑 **OmniRouter** | مدل‌های بدون‌کلید (Qwen/Gemini) به‌عنوان provider هرمس | داخلی |
| 💾 **بکاپ ساعتی** | کل وضعیت → دیتاست خصوصی، ریستور خودکار موقع بوت | dataset |
| ⏰ **Keep-alive** | پینگ ۵ دقیقه‌ای جلوی خوابیدن Space را می‌گیرد | اختیاری |

### ⚡ شروع سریع (۳ کلیک)

1. **دو توکن بگیر** — GitHub PAT (با دسترسی `repo` + `workflow`) و توکن **write** در Hugging Face.
2. **[ویزارد وب](https://godde3s.github.io/hermes-stack/deploy.html) را باز کن** — توکن‌ها و توکن ربات تلگرام را بچسبان، رمزها خودکار ساخته می‌شوند → دکمه **استقرار**. ویزارد خودش ریپو را می‌سازد، همه‌ی Secret ها را ست می‌کند، GitHub Actions را اجرا می‌کند و تا سبز شدن Space صبر می‌کند.
3. **با عامل حرف بزن** — تلگرام `/start`، داشبورد روی `https://<user>-<space>.hf.space/hermes/`، API روی `/hermes-api/v1`.

> 🔒 همه‌چیز **۱۰۰٪ داخل مرورگر خودت** اجرا می‌شود — توکن‌ها فقط به APIهای رسمی گیت‌هاب / هاگینگ‌فیس / تلگرام می‌روند و به‌صورت Secret رمزنگاری‌شده ذخیره می‌شوند. هیچ سرور واسطی در کار نیست.

راه دستی (بدون ویزارد): [docs/manual-deploy.md](docs/manual-deploy.md) — یا این ریپو را fork کن، Secret ها را طبق ورک‌فلو بساز و در تب Actions روی **Run workflow** بزن.

### 📄 License

MIT — free forever. ساخته‌شده توسط [Godde3s](https://github.com/Godde3s) · [OmniRouter](https://godde3s.github.io/omnirouter/)
