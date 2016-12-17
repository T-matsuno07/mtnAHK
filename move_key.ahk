/*
date: 2011/11/29
Author: Tsukasa Matsuno

アルファベットキーでカーソルを移動させる関数.
スペースキーを押すと終了する.
左手と右手の両方に対応

__←:aj
__→:dk
__↑:wi
__↓:sm
行頭:qh
行末:el
文頭: u
文末: n

Ctrlキーを押しながら上記のキーを押すと, 文字列を選択しながらカーソル移動が可能.
Ctrl + xcv のコピペコマンドも実行可能

注意点
あまりに速く連打しすぎたり, キーを押しっぱなしにすると, そのキーの文字列が入力されてしまう
バグが発生するので, 押しっぱなしにしたり, あまりに速い連打はしないこと.
カーソルを大幅に移動させたい場合は素直に十字キーを押すことをオススメします.

*/
move_key(){
	Loop
	{
		Input, inputStr,M L1,
		Transform code, Asc, %inputStr%
		if inputStr=j
		{
			Send, {Left}
			continue
		}else
		if inputStr=k
		{
			Send, {Right}
			continue
		}else
		if inputStr=h
		{
			Send, {Home}
			continue
		}else
		if inputStr=l
		{
			Send, {End}
			continue
		}else
		if inputStr=i
		{
			Send, {Up}
			continue
		}else
		if inputStr=u
		{
			Send, ^{Home}
			continue
		}else
		if inputStr=m
		{
			Send, {Down}
			continue
		}else
		if inputStr=n
		{
			Send, ^{End}
			continue
		}else
		if inputStr=a
		{
			Send, {Left}
			continue
		}else
		if inputStr=d
		{
			Send, {Right}
			continue
		}else
		if inputStr=s
		{
			Send, {Down}
			continue
		}else
		if inputStr=w
		{
			Send, {Up}
			continue
		}else
		if inputStr=q
		{
			Send, {Home}
			continue
		}else
		if inputStr=e
		{
			Send, {End}
			continue
		}else
		if code = 1 ; Ctrl + a
		{
			Send, +{Left}
			continue
		}else
		if code = 3 ; Ctrl + c
		{
		    Send, ^c
		    continue
		}else
		if code = 4 ; Ctrl + d
		{
		   	Send, +{Right}
			continue
		}else
		if code = 5 ; Ctrl + e
		{
		    Send, +{End}
		    continue
		}else
		if code = 8 ; Ctrl + h
		{
			Send, +{Home}
			continue
	
		}else
		if  code = 9 ; Ctrl + i
		{
			Send, +{Up}
			continue
	
		}else
		if  code = 10 ; Ctrl + j
		{
			Send, +{Left}
			continue
		}else
		if  code = 11 ; Ctrl + k
		{
			Send, +{Right}
			continue
	
		}else
		if  code = 12 ; Ctrl + l
		{
			Send, +{End}
			continue
	
		}else
		if  code = 13 ; Ctrl + m
		{
			Send, +{Down}
			continue
	
		}else
		if  code = 14 ; Ctrl + n
		{
			Send, ^+{End}
			continue
	
		}else
		if  code = 21 ; Ctrl + u
		{
			Send, ^+{Hom}
			continue
	
		}else
		if  code = 22 ; Ctrl + v
		{
			Send, ^v
			continue
		}else
		if  code = 24 ; Ctrl + x
		{
			Send, ^x
			continue
		}else{
			break
		}
	}
}
