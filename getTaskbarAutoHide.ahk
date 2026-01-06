#Requires AutoHotkey v1.1.0+
;==============================================================
; getTaskbarAutoHide — Gets whether the Windows taskbar auto-hide setting is enabled
;
; GitHub: https://github.com/SevenKeyboard/get-taskbar-auto-hide
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;==============================================================
class VersionManager_getTaskbarAutoHide
{
    static _ := VersionManager_getTaskbarAutoHide._init()
    _init()    {
        global
        GETTASKBARAUTOHIDE_VERSION := "1.0.0"
    }
}
getTaskbarAutoHide()    {
    static ABM_GETSTATE:=0x4, ABS_ALWAYSONTOP:=0x2, ABS_AUTOHIDE:=0x1
    varSetCapacity(APPBARDATA,A_PtrSize==8?48:36,0)
    abmState:=dllCall("shell32\SHAppBarMessage", "UInt",ABM_GETSTATE, "Ptr",&APPBARDATA, "UPtr")
    return !!(abmState&ABS_AUTOHIDE)
}