# Windows Right‑Click Context Menu Enhancements

Add handy options to the File Explorer right‑click menu on Windows 10/11: open Command Prompt/Windows Terminal here, Control Panel shortcuts (incl. God Mode), Safe Mode reboot options, and quick task killers. Each feature is a portable .reg file—import to enable, use the `Remove` folder to disable.

> Caution: These modify the Windows Registry. Review files before importing and create a restore point or registry backup. Admin rights are required for most entries.

## What’s inside

- `add_command_prompt_menu.reg` — Adds a "Command Prompt" submenu on background of folders with:
  - Open here (cmd in the current path)
  - Open here as administrator (elevated cmd in the path)
- `Add_Open_command_window_here.reg` — Adds classic "Open command window here" on directory, background, and drive.
- `Add_Open_command_window_here_as_administrator.reg` — Same as above but always elevated; also sets `EnableLinkedConnections=1` so mapped drives are visible in elevated cmd.
- `Add_Open_Terminal_window_here.reg` — Adds "Open in Windows Terminal". Requires Windows Terminal (`wt`) to be installed.
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
- Safe Mode entries execute `bcdedit` and then reboot immediately. Save your work before clicking.
- "Kill tasks" entries may terminate apps without saving—use carefully. The "unresponsive only" option is safer.
- Some entries are added under `HKEY_CLASSES_ROOT\Directory\Background\shell` (right‑click on folder background) and `HKEY_CLASSES_ROOT\Directory\shell` or `HKEY_CLASSES_ROOT\Drive\shell` as applicable.

## Troubleshooting

- Entry not showing up:
  - Ensure you imported the `.reg` with Admin rights.
  - Restart File Explorer (Task Manager → Windows Explorer → Restart) or sign out/in.
  - On Windows 11, built‑in "Open in Terminal" may be present; custom entry still works in the classic menu.
- Windows Terminal doesn’t launch:
  - Install Windows Terminal from Microsoft Store and ensure `wt` resolves in PATH.
  - Try `wt.exe -d "%V"` if `wt` alias is disabled.
- Elevated Cmd can’t see mapped drives:
  - `Add_Open_command_window_here_as_administrator.reg` sets `EnableLinkedConnections=1`. Sign out/in (or reboot) after applying.
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
- `remove_control_panel_menu.reg`
- `remove_kill_tasks_menu.reg`
- `remove_safe_mode_menu.reg`
- `remove_cmd_submenu.reg` (if applicable to your setup)

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
