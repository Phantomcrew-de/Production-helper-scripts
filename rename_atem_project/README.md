# 🧾 Rename DaVinci Resolve Projects 
These scripts help you rename a DaVinci Resolve .drp project file from ATEM Recordings and all associated folders and files that contain the original project name.

## ✅ Features:
-Detects the original .drp file name automatically

- Prompts for a new project name````

- Renames:

   - .drp file

   - Any folders and files that include the old name (recursively)
 
   - Optionally replaces the name inside the .drp file (Linux only)

## 📂 Example Before:
````
MyProject/
├── MyProject.drp
├── MyProject_Footage/
└── MyProject_Notes.txt

````
## 🔄 After running the script and renaming to NewProject:
````
NewProject/
├── NewProject.drp
├── NewProject_Footage/
└── NewProject_Notes.txt
````
## 💡 Notes:
On Linux, the .drp file content will also be updated via sed.

On Windows, only file and folder names are changed, not the .drp.

Make sure you have a backup before running, especially if you're renaming important project files.

