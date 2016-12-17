;マルチバイト文字送信関数
mb_send(str)
{
    ;--- IME の状態を保存した後一時的にOFFにする ---
    imeState =% IME_GET()
    IME_Set(0)

    ;--- 文字コード変換 ---
    fsave := A_FormatInteger
    SetFormat, integer, D       ;全角用 {ASC xxxx} は10進書出し

    p := &str
    Loop
    {
        if(*p = 0)
            break

        if (0x81 <= *p && *p <= 0x9F) || (0xE0 <= *p && *p <= 0xFC)
        {    ;--- 全角 ---
            res := res . "{ASC " . (*p << 8) + *(p+1) . "}"
            p++
        }
        else ;--- 半角 ---
        {
            char := chr(*p)
            if (0x80 < *p)
                res := res . "{ASC " . *p . "}"
            else if char in   !,#,+,^,{,}
                res := res . "{" . char . "}"
            else if (char = "`n")
                res := res . "{Enter}"
            else if (char != "`r")
                res := res . char
        }
        p++
    }
    SetFormat, integer, %fsave%
    
    ;--- 文字送信 ---
    Send, % res
    
    ;--- IME の状態を元に戻す ---
    IME_Set(imeState)

    return true
}

;IMEの値を取得する関数
IME_Get()
{
    ; WM_IME_CONTROL    = 0x0283
    ; IMC_GETOPENSTATUS = 0x0005
    WinGet,hWindow,ID,A
    bufCurrentDetectMode := A_DetectHiddenWindows
    DetectHiddenWindows, On
    buf := DllCall("user32.dll\SendMessageA", "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint",hWindow), "UInt", 0x0283, "Int", 0x0005, "Int", 0)
    DetectHiddenWindows, %bufCurrentDetectMode%
    Return buf
}

;IMEの値を変更する関数
IME_Set(imeState)
{
    ; WM_IME_CONTROL    = 0x0283
    ; IMC_SETOPENSTATUS = 0x0006
    WinGet,hWindow,ID,A
    bufCurrentDetectMode := A_DetectHiddenWindows
    DetectHiddenWindows, On
    buf := DllCall("user32.dll\SendMessageA", "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint",hWindow), "UInt", 0x0283, "Int", 0x0006, "Int", imeState)
    DetectHiddenWindows, %bufCurrentDetectMode%
    Return buf
}