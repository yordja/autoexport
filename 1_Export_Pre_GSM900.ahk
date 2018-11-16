; Declare Global
global OutputPath = "C:\AutoExport\PreTest\GSM\"

Goto, StartProcess

;---Define Function ---
ScreenSetup(){
MouseClickDrag, left, 11,  319, 200, 336 ,20	
Sleep, 1000
MouseClickDrag, left, 1439,  326, 412, 326 ,20	
Sleep, 1000
}

ClearAllAtribute(){
MouseClick, left,  382,  68  ; click Attribute button
Sleep, 1000

MouseClick, left, 548,239
Sleep, 100
Send, {Home}
Sleep, 100
Send, {LShift Down}
Sleep, 100
Send, {End}
Sleep, 100
Send, {LShift Up}
Sleep, 1000

Click, 371, 220 Left, Down
Sleep, 125
Click, 371, 220 Left, Up
Sleep, 359

Click, 597, 380 Left, Down
Sleep, 125
Click, 597, 380 Left, Up
Sleep, 1000
}

AddAttribute(){
MouseClick, left, 311, 854
Sleep,100
Send, {Home}

MouseClick, left,  382,  68  ; click Attribute menu
Sleep, 1000

; Select attribute for GSM
MouseClick, left,  168,  221 ; attribute windows
Sleep, 1000

Send, {Right}{Down}{Right}{Down}{Down}{Down}{Down}{Down}{Down}{Right}{Down}{Down}{Down}{Down}{Down}{Down}{Right}{Down}{Right}{Down}{Down}{Right}
Sleep, 1000

; Drag attribute to right
MouseClick , left , 192, 325
sleep, 500

Send, {Control down}
MouseClick, left, 196, 344
Send, {Control up}
sleep, 500

Send, {Control down}
MouseClick, left, 196, 290
Send, {Control up}
sleep, 1000

MouseClick, left,  365,  180
Sleep, 1000

Send, {Tab}
Sleep, 100
Send, {Tab}
Sleep, 100
Send, {Enter}
Sleep, 5000
}

UnSelectAndCollapAll(){
; unselect & Collap all

MouseClick, left, 225, 855 , 3
Sleep, 100
MouseClick, left, 324, 800
Sleep, 1000
send, {Home}
MouseClick, right, 299,126
Sleep, 2000
Send, {Down}{Down}{Down}{Down}{Down}{Enter}
Sleep, 200
MouseClick, right, 297,158
Sleep, 2000
Send, {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
Sleep, 200
}

SelectCellRef(x,y){
MouseClick, left , x ,y
Sleep, 200
}

ExportMap(ExportName){
;- click to on layer --	

; - click on map -	
MouseClick, right,  924,  446
Sleep, 1000
Send, {Down}{Down}{Down}{Down}{Down}{Down}{Right}{Down}
Send, {Enter}

WinWait, Export Map as Image, 
IfWinNotActive, Export Map as Image, , WinActivate, Export Map as Image, 
WinWaitActive, Export Map as Image, 
Sleep, 1000

Send, %ExportName% ; file name
Sleep, 1000
Send, {Enter}
Sleep, 1000

IfWinExist, Confirm Save As
	{
		Send, !y
		Sleep, 1000
	}
Sleep, 1000	
}

ExportLegend(ExportLegendName,x,y){
; --export legend --
;MouseClick, left , 228, 236
MouseClick, left , %x%,  %y%
Sleep, 1000

lx := x+90
ly := y +30
MouseClick, right ,  %lx%, %ly%
sleep,1000
send, {Down}{Down}{Down}{Down}{Right}{Down}
send, {Enter}
sleep, 1000

WinWait, Export Legend as Image, 
IfWinNotActive, Export Legend as Image, , WinActivate, Export Legend as Image, 
WinWaitActive, Export Legend as Image, 
Sleep, 1000

Send, %ExportLegendName% ; file name
Sleep, 1000
Send, {Enter}
Sleep, 1000

IfWinExist, Confirm Save As
	{
		Send, !y
		Sleep, 1000
	}
Sleep, 1000

MouseClick, left , %x%,  %y%  ; close legend
Sleep, 1000
}

ActiveMap(){
WinWait, Actix Software - [Map1], 
IfWinNotActive, Actix Software - [Map1], , WinActivate, Actix Software - [Map1], 
WinWaitActive, Actix Software - [Map1], 
MouseClick, left,  916,  470
Sleep, 2000
}

ClickLayer(x,y){
	MouseClick, left, %x% , %y%
	Sleep,1000
}

;----- end defined function ---
StartProcess:
; Check Actix is active
WinWait, Actix Software - [Map1], 
IfWinNotActive, Actix Software - [Map1], , WinActivate, Actix Software - [Map1], 
WinWaitActive, Actix Software - [Map1], 

;ScreenSetup()
ClearAllAtribute()
AddAttribute()
UnSelectAndCollapAll()
SelectCellRef(243,170) ; GSM
sleep, 5000


; --- prepare export file name -----
ExportName1 = %OutputPath%1_RxLev.jpg
ExportName2 = %OutputPath%2_RxQual.jpg
ExportName3 = %OutputPath%3_BCCH.jpg
ExportLegendName1 = %OutputPath%1_Legend_RxLev.wmf
ExportLegendName2 = %OutputPath%2_Legend_RxQual.wmf
ExportLegendName3 = %OutputPath%3_Legend_BCCH.wmf

x = 243
;--- Export 3 layer ---
y= 235
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
;zoom to layer
MouseClick, right,  322,  236
send, {Down}{Enter}
Sleep, 1000

; start export
ExportMap(ExportName1)
ExportLegend(ExportLegendName1,228,236)  ; location collape legend
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName2) 
ExportLegend(ExportLegendName2,228,253)  ; location collape legend
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName3) 
ExportLegend(ExportLegendName3,228,268)  ; location collape legend
ClickLayer(x,y)

MsgBox "Finish"
return