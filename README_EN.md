# DeepSeek Harness (DSH) Windows Auto Runner 🚀

[繁體中文 (Traditional Chinese)](./README.md) | **English**

---

## Overview
**DeepSeek Harness (DSH) Windows Auto Runner** is an ultra-lightweight daemon & instant-trigger utility tailored for DeepSeek Harness on Windows environments.

It eliminates common frustrations:
- ❌ Manually running `npx @deepseek-ai/dsh web` or `dsh web` inside PowerShell/CMD each time.
- ❌ Waiting through tedious cold-start delays every time you restart your machine.
- ❌ Needing to keep an unwanted command prompt window running in the background.

---

## Key Benefits

- ⚡ **Zero-Delay Desktop Trigger**: Launch the Web GUI in an isolated, borderless native application window (`--app` mode in Chrome/Edge) within 0 seconds.
- 🔕 **Silent Background Daemon**: Starts up completely invisibly at Windows boot (`shell:startup`) without flashing any black terminal window.
- 🛡️ **Environment & PATH Isolation**: Dynamically attaches Node.js / `%APPDATA%\npm` paths, eliminating missing-command errors caused by `System32` directory drift during Windows startup.
- 📉 **Ultra-Low Memory Footprint**: Idles at ~60MB RAM with 0% CPU consumption; GPU memory is released immediately once the browser window is closed.
- 🔄 **Auto-Wake & Single Instance Protection**: Smoothly wakes the background server if stopped and guarantees only a single browser window opens.

---

## Project Structure

```text
├── install.bat             # 1-Click installer (creates startup & desktop shortcuts)
├── uninstall.bat           # 1-Click uninstaller (removes shortcuts cleanly)
├── run_dsh.bat             # Core launcher with environment variable bindings
├── start_dsh_background.vbs# Silent launcher (hides console window)
├── open_dsh.vbs            # Desktop trigger (instant launch in app window)
├── stop_dsh.vbs            # Gracefully stops background DSH service
├── config.json             # Configuration file (default port: 3080)
├── fr031-ta292-001.ico     # Custom application icon
├── .gitignore              # Git ignore rules
├── README.md               # Traditional Chinese documentation
└── README_EN.md            # English documentation
```

---

## Prerequisites

1. **[Node.js](https://nodejs.org/)** (v18 or higher recommended).
2. **Google Chrome** or **Microsoft Edge** browser installed.
3. *(Optional but recommended)* Global install of DeepSeek Harness:
   ```bash
   npm install -g @deepseek-ai/dsh
   ```
   *If not installed globally, scripts automatically fall back to `npx`.*

---

## Quick Start

### 1. Installation (Takes ~3 seconds)
Double-click **`install.bat`** in the project folder.
It will automatically:
1. Register a silent background startup entry in Windows Startup (`shell:startup`).
2. Generate an instant-access **`DeepSeek Harness`** shortcut on your Desktop with a custom icon.

### 2. Daily Usage
- **Open DSH**: Double-click the **`DeepSeek Harness`** desktop shortcut — the Web GUI opens instantly.
- **After System Reboot**: The daemon initializes silently on boot; clicking the desktop shortcut is always instant.
- **Stop Daemon**: Double-click **`stop_dsh.vbs`** in the repository folder to terminate the background process.

### 3. Uninstallation
Double-click **`uninstall.bat`** to cleanly remove all generated shortcuts.

---

## Troubleshooting & FAQ

<details>
<summary><b>Why does my browser say "Site cannot be reached" after killing the server?</b></summary>
The trigger script automatically checks port 3080. If the server is offline, it wakes up the background daemon and waits for it to become ready before popping up the browser.
</details>

<details>
<summary><b>How much memory does it use?</b></summary>
During idle background daemon mode, it uses only ~60MB RAM. The heavy browser rendering memory is entirely freed when you close the browser window.
</details>

---

## License

[MIT License](LICENSE) © 2026
