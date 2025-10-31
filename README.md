# Windows Right‑Click Context Menu Enhancements

Add handy options to the File Explorer right‑click menu on Windows 10/11: open Command Prompt/Windows Terminal here, Control Panel shortcuts (incl. God Mode), Safe Mode reboot options, and quick task killers. Each feature is a portable .reg file import to enable, use the `Remove` folder to disable.

> Caution: These modify the Windows Registry. Review files before importing and create a restore point or registry backup. Admin rights are required for most entries.

## What’s inside

- `add_command_prompt_menu.reg` — Adds a "Command Prompt" submenu on background of folders with:
  - Open here (cmd in the current path)
  - Open here as administrator (elevated cmd in the path)
- `Add_Open_command_window_here.reg` — Adds classic "Open command window here" on directory, background, and drive.
- `Add_Open_command_window_here_as_administrator.reg` — Same as above but always elevated; also sets `EnableLinkedConnections=1` so mapped drives are visible in elevated cmd.
- `Add_Open_Terminal_window_here.reg` — Adds "Open in Windows Terminal". Requires Windows Terminal (`wt`) to be installed.
- `add_windows_terminal_admin.reg` — Adds "Open in Windows Terminal (Admin)" on directory/background/drive using elevation.
- `add_control_panel_menu.reg` — Adds a "Control Panel" submenu with:
  - Category view
  - All Control Panel Items (icons view)
  - All Tasks ("God Mode")
- `add_kill_tasks_menu.reg` — Adds "Kill Unresponsive Tasks" submenu:
  - Kill all running tasks (skips a protected list like explorer, winlogon, etc.)
  - Kill only unresponsive tasks (safer)
- `add_safe_mode_powershell.reg` — Adds "Safe Mode" submenu to reboot into:
  - Normal Mode (removes safeboot flags)
  - Safe Mode (minimal)
  - Safe Mode with Networking
  - Safe Mode with Command Prompt
- `add_powershell_menu.reg` — Adds "Open PowerShell here" on directory/background/drive.
- `add_powershell_admin_menu.reg` — Adds "Open PowerShell here as administrator" on directory/background/drive.
- `add_copy_folder_path_menu.reg` — Adds "Copy folder path" to copy the current folder path to clipboard.
- `add_restart_explorer_menu.reg` — Adds "Restart Explorer" to quickly restart Windows Explorer.
- `add_take_ownership_menu.reg` — Adds "Take Ownership" for files and folders (grants Administrators full control; uses UAC).
- `add_open_in_vscode_menu.reg` — Adds "Open in VS Code" on directory/background/drive (requires VS Code `code` in PATH).
- `add_git_bash_here_menu.reg` — Adds "Git Bash here" (requires Git for Windows; path assumed `C:\\Program Files\\Git\\git-bash.exe`).
- `add_copy_file_path_menu.reg` — Adds "Copy file path" (for files) and an extra folder variant.
- `add_open_with_notepad.reg` — Adds "Open with Notepad" for any file.
- `add_copy_sha256_menu.reg` — Adds "Copy SHA256 checksum" for a selected file (uses PowerShell Get-FileHash).
- `add_explorer_view_menu.reg` — Adds an "Explorer View" submenu with: Show/Hide hidden files, Show/Hide file extensions.
- `add_export_file_list_menu.reg` — Export current folder listing to filelist.txt or filelist.csv.
- `add_run_custom_scripts_menu.reg` — "Run Custom Script" submenu to invoke your own batch/PowerShell scripts (edit paths inside the .reg).
- `add_run_as_admin_anyfile.reg` — Adds "Run file as administrator" for any file type via elevation.
- `add_efs_encrypt_decrypt_menu.reg` — Encrypt/Decrypt files and folders using EFS (NTFS only, Pro/Enterprise).
- `add_check_signature_menu.reg` — Check Authenticode signature and show publisher.
- `add_set_as_wallpaper_menu.reg` — Set image as desktop background.
- `add_copy_file_size_menu.reg` — Copy file size (bytes and MB) to clipboard.
- `add_run_disk_cleanup_menu.reg` — Launch Disk Cleanup.
- `add_open_task_manager_menu.reg` — Open Task Manager from background menu.
- `add_power_controls_menu.reg` — Power submenu: Shutdown, Restart, Sleep, Hibernate, Lock.
- `add_ai_tools_menu.reg` — AI helpers: Ask Copilot about file, Summarize file (opens Copilot), OCR via Tesseract to clipboard.
- `add_wipe_free_space_menu.reg` — Securely wipe free space on the current drive using `cipher /w` (heavy and irreversible; Shift+Right‑Click to reveal).
- `add_defender_OFF_direct.reg` — **Simple one-click** to turn OFF Windows Defender completely (no submenu).
- `add_defender_ON_direct.reg` — **Simple one-click** to turn ON Windows Defender completely (no submenu).
- `Defender_OFF.ps1` — **PowerShell script** to disable Defender with progress display (right-click → Run with PowerShell as Admin).
- `Defender_ON.ps1` — **PowerShell script** to enable Defender with progress display.
- `add_advanced_batch_rename_menu.reg` — Advanced batch rename with multiple options: sequential numbering, prefix/suffix, find & replace, date/time stamps.
- `add_share_bluetooth_menu.reg` — Send files to Bluetooth devices using Windows Bluetooth File Transfer.
- `add_cloud_upload_menu.reg` — Upload files/folders to OneDrive or open Google Drive web uploader.
- `add_screenshot_menu.reg` — Screenshot tools: Snipping Tool, Snip & Sketch, Full screenshot to clipboard.
- `add_file_hash_menu.reg` — Complete file hash verification menu (MD5, SHA1, SHA256, SHA512, All hashes).
- `add_create_iso_menu.reg` — Create ISO image from folder (requires oscdimg.exe from Windows ADK or third-party tools).
- `add_file_monitor_menu.reg` — Monitor files/folders for changes in real-time using FileSystemWatcher.
- `add_advanced_permissions_menu.reg` — Advanced file permissions: toggle read-only, hidden, system attributes; view ACL.
- `Terminal Option.txt` — Extra menu variants (templates) for Command Prompt, PowerShell, Windows Terminal, and admin versions. Copy a block to a new `.reg` file and import if you want these alternatives.
- `Remove/` — Contains matching removal scripts for each feature (e.g., `Remove_Open_Terminal_window_here.reg`). Run to cleanly uninstall.

## Quick start

- Double‑click the desired `.reg` file and accept the UAC prompt.
- To remove, open the `Remove` folder and double‑click the corresponding `Remove_*.reg` file.
- If a menu item doesn’t appear immediately, restart File Explorer.

### Optional: Import from the terminal (PowerShell, as Administrator)

```powershell
# Import (enable)
reg import "add_command_prompt_menu.reg"
reg import "Add_Open_Terminal_window_here.reg"

# Remove (disable)
reg import "Remove\Remove_Open_Terminal_window_here.reg"
```

## Requirements & notes

- Windows 10 or Windows 11.
- Admin privileges required for HKLM writes and context menu registration.
- Windows Terminal entries require Windows Terminal (Microsoft Store) so the `wt` command is available. If `wt` isn’t recognized, install it or use the full path to `wt.exe`.
- VS Code entry requires Code CLI (`code`) available in PATH (VS Code → Command Palette → “Shell Command: Install 'code' command in PATH”).
- Git Bash entry assumes Git for Windows is installed to `C:\\Program Files\\Git`. If different, edit the `.reg` path accordingly.
- Defender toggle: May be blocked by Windows Security Tamper Protection; turn that off first if needed. Uses `Set-MpPreference -DisableRealtimeMonitoring` and related flags; admin required.
  - **IMPORTANT**: If not working, disable Tamper Protection:
    1. Open Windows Security → Virus & threat protection
    2. Manage settings → Turn OFF "Tamper Protection"
    3. Then run the toggle menu
  - **Alternative**: Use `add_defender_toggle_simple.reg` for better error messages and status checking
  - **RECOMMENDED**: Use direct versions for simplicity:
    - `add_defender_OFF_direct.reg` - One-click OFF (no submenu)
    - `add_defender_ON_direct.reg` - One-click ON (no submenu)
    - `Defender_OFF.ps1` / `Defender_ON.ps1` - PowerShell scripts with visual progress
- EFS: Works on NTFS volumes and editions that support EFS (Pro/Enterprise). Keep certificates backed up. See `cipher /?`.
- Secure wipe: Uses `cipher /w:<drive>` to overwrite free space. This is slow (can take hours) and cannot be undone. The menu is marked as Extended (hold Shift while right‑clicking) and shows a UAC prompt by design—use only when absolutely needed.
- Advanced Batch Rename: Powerful renaming options for organizing files in bulk. Works on all files in the current folder.
- Bluetooth File Transfer: Uses Windows built-in `fsquirt.exe`. Ensure Bluetooth is enabled and devices are paired.
- Cloud Upload: OneDrive option copies to your OneDrive folder (must be set up first). Google Drive opens the web uploader.
- Screenshot Tools: Full screenshot captures entire primary screen to clipboard. Snip & Sketch uses Windows 10/11 built-in tool.
- File Hash: Supports MD5, SHA1, SHA256, SHA512. Hash is copied to clipboard automatically.
- ISO Creation: Requires `oscdimg.exe` from Windows ADK or use third-party tools like ImgBurn, PowerISO.
- File Monitor: Real-time monitoring shows all file/folder changes, creates, deletes, and renames. Press Ctrl+C to stop.
- Advanced Permissions: Quick toggle for file attributes (read-only, hidden, system). View ACL shows detailed security permissions.
- OCR: Requires Tesseract at `C:\\Program Files\\Tesseract-OCR\\tesseract.exe` or edit the path.
- Safe Mode entries execute `bcdedit` and then reboot immediately. Save your work before clicking.
- "Kill tasks" entries may terminate apps without saving—use carefully. The "unresponsive only" option is safer.
- "Take Ownership" changes file/folder ACLs to grant the local Administrators group full control. Use only when needed and understand the security impact.
- Some entries are added under `HKEY_CLASSES_ROOT\Directory\Background\shell` (right‑click on folder background) and `HKEY_CLASSES_ROOT\Directory\shell` or `HKEY_CLASSES_ROOT\Drive\shell` as applicable.

## Troubleshooting

- Entry not showing up:
  - Ensure you imported the `.reg` with Admin rights.
  - Restart File Explorer (Task Manager → Windows Explorer → Restart) or sign out/in.
  - On Windows 11, built‑in "Open in Terminal" may be present; custom entry still works in the classic menu.
- Windows Terminal doesn’t launch:
  - Install Windows Terminal from Microsoft Store and ensure `wt` resolves in PATH.
  - Try `wt.exe -d "%V"` if `wt` alias is disabled.
- Elevated Cmd can't see mapped drives:
  - `Add_Open_command_window_here_as_administrator.reg` sets `EnableLinkedConnections=1`. Sign out/in (or reboot) after applying.
- Defender toggle not working:
  - **Most Common**: Tamper Protection is ON. Disable it:
    1. Open Windows Security (search in Start menu)
    2. Go to "Virus & threat protection"
    3. Click "Manage settings"
    4. Turn OFF "Tamper Protection" (requires admin)
  - Try the alternative version: `add_defender_toggle_simple.reg` (shows detailed error messages)
  - Check status with PowerShell: `Get-MpPreference | Select-Object Disable*`
- Stuck in Safe Mode:
  - Use the "Restart in Normal Mode" item (from the same Safe Mode submenu) or run:
    ```cmd
    bcdedit /deletevalue {default} safeboot
    bcdedit /deletevalue {default} safebootalternateshell
    shutdown /r /t 0
    ```

## Uninstall

Use the matching files in `Remove/`:

- `Remove_Open_command_window_here.reg`
- `Remove_Open_command_window_here_as_Administrator.reg`
- `Remove_Open_Terminal_window_here.reg`
- `remove_windows_terminal_admin.reg`
- `remove_control_panel_menu.reg`
- `remove_kill_tasks_menu.reg`
- `remove_safe_mode_menu.reg`
- `remove_cmd_submenu.reg` (if applicable to your setup)
- `remove_powershell_menu.reg`
- `remove_powershell_admin_menu.reg`
- `remove_copy_folder_path_menu.reg`
- `remove_restart_explorer_menu.reg`
- `remove_take_ownership_menu.reg`
- `remove_open_in_vscode_menu.reg`
- `remove_git_bash_here_menu.reg`
- `remove_copy_file_path_menu.reg`
- `remove_open_with_notepad.reg`
- `remove_copy_sha256_menu.reg`
- `remove_explorer_view_menu.reg`
- `remove_export_file_list_menu.reg`
- `remove_run_custom_scripts_menu.reg`
- `remove_run_as_admin_anyfile.reg`
- `remove_efs_encrypt_decrypt_menu.reg`
- `remove_check_signature_menu.reg`
- `remove_set_as_wallpaper_menu.reg`
- `remove_copy_file_size_menu.reg`
- `remove_run_disk_cleanup_menu.reg`
- `remove_open_task_manager_menu.reg`
- `remove_power_controls_menu.reg`
- `remove_ai_tools_menu.reg`
- `remove_wipe_free_space_menu.reg`
- `remove_batch_rename_menu.reg`
- `remove_count_items_menu.reg`
- `remove_create_shortcut_here_menu.reg`
- `remove_folder_size_menu.reg`
- `remove_symlink_junction_menu.reg`
- `remove_run_python_menu.reg`
- `remove_advanced_batch_rename_menu.reg`
- `remove_share_bluetooth_menu.reg`
- `remove_cloud_upload_menu.reg`
- `remove_screenshot_menu.reg`
- `remove_file_hash_menu.reg`
- `remove_create_iso_menu.reg`
- `remove_file_monitor_menu.reg`
- `remove_advanced_permissions_menu.reg`

## Safety first

- Read the `.reg` contents before importing.
- Make a System Restore point or export affected registry keys.
- Proceed only if you’re comfortable editing the Windows Registry.

---

## Short Hindi guide (छोटा मार्गदर्शन)

- जो फ़ीचर चाहिए, उसका `.reg` फाइल डबल‑क्लिक करें → Yes/OK।
- हटाने के लिए `Remove` फ़ोल्डर में उसी का `Remove_*.reg` चलाएं।
- Windows Terminal चाहिए तो पहले Microsoft Store से इंस्टॉल करें (तभी `wt` काम करेगा)।
- Safe Mode वाले विकल्प तुरंत रीबूट कराते हैं—पहले काम सेव कर लें।

---

If you want a combined installer/uninstaller or screenshots, open an issue and I can add them. Happy tweaking! 🎯

