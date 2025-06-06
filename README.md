# Useful Production Scripts

This repository contains a collection of practical scripts for organizing and managing media production workflows. The scripts are designed for use in video, audio, and postproduction environments across Linux, macOS, and Windows systems.

## 📁 Overview

| Script Name                         | OS        | Description                                                                 |
|------------------------------------|-----------|-----------------------------------------------------------------------------|
| `create_project_folders_linux.sh`  | Linux     | Creates a structured folder hierarchy for new video projects.              |
| `create_project_folders_mac.sh`    | macOS     | Same as above, adapted for macOS with BSD-compatible `date`.               |
| `create_project_folder_win.bat`    | Windows   | Batch file to generate standard project folders on Windows.                |
| `create_directories_on_videodrive.sh` | Linux/macOS | Creates shared folders on a mounted video drive.                        |
| `create_directories_on_videodrive_win.bat` | Windows | Same as above for Windows environments.                                |
| `rename_atem_project_linux.sh`     | Linux     | Renames DaVinci Resolve `.drp` project files and all related folders.      |
| `rename_atem_project_win.bat`      | Windows   | Batch version of the script for renaming ATEM/DaVinci project folders.     |

---

## 🛠 Installation

No installation required. Just clone this repository and run the appropriate script for your operating system.

```bash
git clone https://github.com/Phantomcrew-de/production-helper-scripts.git
```
cd useful-production-scripts
Make sure .sh scripts have execution rights:

```
chmod +x *.sh
```
🚀 Usage
## Linux / macOS (example)
```
./create_project_folders_linux.sh
```
You'll be prompted to enter:

- A date (YYYYMMDD) – leave empty for today

- A client name

- A project name

- A folder structure like this will be created:
````
20250606_ACME_ProductVideo/
├── 00_Final/
├── 01_Footage/
│   ├── Cam_01/
│   ├── Cam_02/
│   ├── Cam_03/
│   ├── Cam_04/
│   ├── Liverecording/
│   ├── SFX/
│   ├── VFX/
│   ├── Graphics/
│   └── Music/
└── 02_Dokumente/
````
## Windows (example)
Double-click the .bat file or run from cmd:
````create_project_folder_win.bat````
## 🧠 Motivation
These scripts were developed to speed up repetitive setup tasks in video production, reduce human error, and bring consistency across team workflows – especially in studio environments with shared storage and multi-user editing setups.

## 🧾 License
MIT License. Feel free to use, modify, and contribute.

## 🙌 Contributions
Pull requests are welcome! If you have your own scripts or improvements, feel free to submit them or open an issue.

## 🤝 Author

Made with ❤️ by Julius – [phantomcrew.de](https://phantomcrew.de/)
