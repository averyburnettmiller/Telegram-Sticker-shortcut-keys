#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include Gdip.ahk ; http://www.autohotkey.net/~Rseding91/Gdip%20All/Gdip_All.ahk

GetKeyState, shiftstate, Shift
If (shiftstate = "D") {

SendInput t.me/addstickers/stickerpackurlhere ; Sticker pack source without https
SendInput {Enter}

} else {
ClipSaved := ClipboardAll   ; Save the entire clipboard to a variable of your choice.

CopyImage("sticker.png")

CopyImage(ImageFile) {
	pToken := Gdip_Startup()
	Gdip_SetBitmapToClipboard(pBitmap := Gdip_CreateBitmapFromFile(ImageFile))
	Gdip_DisposeImage(pBitmap)
	Gdip_Shutdown(pToken)
}

SendInput ^v
Sleep, 300 ; If you're having trouble, it's probably because this isn't big enough. It's in milliseconds.
SendInput {Enter}

Clipboard := ClipSaved   ; Restore the original clipboard.
ClipSaved := ""   ; Free the memory in case the clipboard was very large.
}
Return
