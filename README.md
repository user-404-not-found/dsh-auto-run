# DeepSeek Harness (DSH) Windows Auto Runner 

[English](#english) | [繁體中文](#繁體中文)

---

<a name="繁體中文"></a>
## 繁體中文

### 簡介
**DeepSeek Harness (DSH) Windows Auto Runner** 是一個專為 Windows 使用者設計的輕量常駐與快速啟動套件。

解決以往使用 DeepSeek Harness 時的痛點：
- 每次開機都要手動開啟 PowerShell / CMD 輸入 `npx @deepseek-ai/dsh web`。
- 每次重新啟動都要忍受漫長的伺服器冷啟動等待。
- 黑色終端視窗必須一直開著，一旦誤關服務就會斷線。

**本方案帶來的體驗：**
- **開機無感背景常駐**：開機自動在背景靜默預熱 DSH，完全無 CMD 黑視窗、無通知打擾。
- **極低資源佔用**：背景常駐僅 ~60MB RAM，待機 CPU 佔用 0%。
- **桌面圖示 0 秒秒開**：雙擊桌面「DeepSeek Harness」圖示，直接以獨立視窗模式秒開 Web GUI。
- **智慧喚醒與防重複**：若服務被意外關閉，點擊圖示會自動在後台喚醒並開啟視窗，絕不彈出多餘視窗或報錯。
- **環境變數與 PATH 隔離**：自動掛載 Node.js 與 npm 路徑，徹底杜絕 Windows 開機啟動時因 `System32` 預設路徑造成的找不到指令問題。

---

### 專案結構

```text
├── install.bat             # 一鍵安裝腳本（建立開機自啟與桌面捷徑）
├── uninstall.bat           # 一鍵解除安裝腳本（移除捷徑）
├── run_dsh.bat             # 核心環境變數配置與 DSH 啟動器
├── start_dsh_background.vbs# 靜默無黑視窗啟動腳本
├── open_dsh.vbs            # 桌面觸發器（秒開獨立瀏覽器視窗）
├── stop_dsh.vbs            # 一鍵優雅關閉背景服務
├── config.json             # 預設參數設定檔（Port: 3080）
├── fr031-ta292-001.ico     # 專屬精美桌面圖示
├── .gitignore              # Git 忽略設定
├── README.md               # 繁體中文說明文件
└── README_EN.md            # 英文說明文件 (English Docs)
```

---

### 前置需求
> **適用版本為v0.1.5之前** ，在之後的更新已經被官方給取代
1. 已安裝 [Node.js](https://nodejs.org/) (建議 v18 以上)。
2. 已安裝 Google Chrome 或 Microsoft Edge 瀏覽器。
3. （選用，推薦）全域安裝 DeepSeek Harness：
   ```bash
   npm install -g @deepseek-ai/dsh
   ```
   *若未全域安裝，腳本亦會自動透過 `npx` 執行。*

---

### 安裝與使用教學

#### 1. 一鍵安裝 (3 秒完成)
直接在專案資料夾中雙擊執行 **`install.bat`**。
腳本會自動完成：
1. 在 Windows 開機「啟動 (Startup)」資料夾建立靜默自啟捷徑。
2. 在「桌面」建立帶有專屬圖示的 **`DeepSeek Harness`** 捷徑。

#### 2. 日常使用
- **想使用時**：直接雙擊桌面上的 **`DeepSeek Harness`** 圖示，立即秒開 Web GUI！
- **重開機後**：系統會在背景自動就緒，任何時候雙擊桌面圖示都是「0 秒冷啟動」。
- **想徹底關閉**：雙擊專案目錄下的 **`stop_dsh.vbs`** 即可完全終止背景服務。

#### 3. 解除安裝
雙擊執行 **`uninstall.bat`**，即可乾淨移除開機啟動項與桌面捷徑。

---

<a name="english"></a>
## English

### Overview
**DeepSeek Harness (DSH) Windows Auto Runner** is a lightweight daemon and trigger utility tailored for DeepSeek Harness on Windows.

It solves common pain points:
- Manually running `npx @deepseek-ai/dsh web` in PowerShell/CMD every time.
- Enduring lengthy cold-start delays on every restart.
- Keeping an annoying black console window open 24/7.

**Key Features:**
- **Silent Boot Background Daemon**: Automatically launches DSH in the background on Windows startup without popping up any command-prompt windows.
- **Ultra-low Resource Footprint**: Consumes only ~60MB RAM with 0% CPU usage in standby mode.
- **Instant Desktop App Experience**: Double-click the desktop shortcut to launch the Web GUI in standalone app window mode instantly.
- **Smart Wake & Single Instance**: If the service was stopped, clicking the shortcut smoothly wakes it up without opening redundant windows.
- **Robust PATH & CWD Handling**: Eliminates PATH missing or `System32` directory drift issues during Windows startup.

---

### Project Structure

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

### Prerequisites
1. [Node.js](https://nodejs.org/) installed (v18 or higher recommended).
2. Google Chrome or Microsoft Edge browser.
3. (Optional but recommended) Install DeepSeek Harness globally:
   ```bash
   npm install -g @deepseek-ai/dsh
   ```
   *If not installed globally, it will automatically fallback to `npx`.*

---

### Quick Start

#### 1. One-Click Installation
Simply double-click **`install.bat`** in the project directory.
It will automatically:
1. Add a silent launcher shortcut into the Windows Startup folder.
2. Create a desktop shortcut named **`DeepSeek Harness`** with a custom icon.

#### 2. Daily Usage
- **Whenever you need it**: Double-click the **`DeepSeek Harness`** desktop shortcut — the Web GUI opens instantly with zero wait.
- **After rebooting Windows**: DSH daemon starts silently in the background; clicking the shortcut is always instant.
- **To stop the service**: Double-click **`stop_dsh.vbs`** in the project directory to terminate the background process.

#### 3. Uninstallation
Double-click **`uninstall.bat`** to cleanly remove all generated shortcuts.

---

### License
MIT License. Feel free to use and contribute!
