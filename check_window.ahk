/*
     指定されてたプログラムがアクティブウィンドウが否かをチェックする関数
     if_***()          ***には各種プログラム名を全て小文字で指定
     if_firefox();     MozillaWindowClass
     if_terapad();     TTeraPadMainForm
     if_teraterm();     VTWin32
     if_chrome();     Chrome_WidgetWin_False
     if_eclipse();     SWT_Window0


     呼び出し側仕様例
     ret:=if_firefox()
     if(ret){}
     else{}

*/

if_firefox(){
     IfWinActive, ahk_class MozillaWindowClass
     {
          return True
     }else{
          return False
     }
     return
}



if_terapad(){
     IfWinActive, ahk_class TTeraPadMainForm
     {
          return True
     }else{
          return False
     }
     return
}


if_teraterm(){
     IfWinActive, ahk_class VTWin32
     {
          return True
     }else{
          return False
     }
     return
}



if_chrome(){
     IfWinActive, ahk_class Chrome_WidgetWin_False
     {
          return True
     }else{
          return False
     }
     return
}


if_eclipse(){
     IfWinActive, ahk_class SWT_Window0
     {
          return True
     }else{
          return False
     }
     return
}
