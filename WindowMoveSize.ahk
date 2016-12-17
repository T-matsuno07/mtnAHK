; --------------------------------------------------
; Window Move
WinMoveStep(XD,YD) {
	WinGet,win_id,ID,A
	WinGetPos,x,y,,,ahk_id %win_id%
	Step := 24
	x := x + (XD * Step)
	y := y + (YD * Step)
	WinMove,ahk_id %win_id%,,%x%,%y%
	return
}


; --------------------------------------------------
; Window Size
WinSizeStep(XD,YD) {
	WinGet,win_id,ID,A
	WinGetPos,,,w,h,ahk_id %win_id%
	Step := 24
	w := w + (XD * Step)
	h := h + (YD * Step)
	WinMove,ahk_id %win_id%,,,,%w%,%h%
	return
}