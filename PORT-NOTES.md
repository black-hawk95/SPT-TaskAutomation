# TaskAutomation SPT 4.1.6 port

Port of TaskAutomation 1.3.1 to SPT 4.1.6 / EFT 0.16.9.5.

## Main changes

- Retargeted the client project to `netstandard2.1`.
- Updated renamed EFT/SPT client types used by quest, trader, inventory, armor and notification code.
- Updated `Quest` access from the old raw quest member to the current `Template` API.
- Updated `ConditionCollection` usage for the current enumerable API.
- Updated dialog result handling for the current `WindowResult` task.
- Updated trading/session types used by task handover logic.
- Fixed the inventory-screen integration: EFT 0.16.9.5 no longer has `InventoryScreen.iSession`, so the current session is taken directly from the `InventoryScreen.Show(...)` arguments.
- Added a PowerShell build script for a local SPT install.

## Build

```powershell
.\build.ps1 -SPTPath "C:\Path\To\SPT"
```

## Tested

Tested successfully on SPT 4.1.6 with Fika.

Confirmed:
- client compiles and loads
- F12 configuration is available
- automatic quest acceptance works
