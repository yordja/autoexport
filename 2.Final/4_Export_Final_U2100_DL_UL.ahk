; Declare Global
global OutputPath = "C:\AutoExport\Final\U2100\"
global SpeedS = 200
global SpeedM = 1000
global SpeedL = 10000

Goto, StartProcess

;---Define Function ---
ScreenSetup(){
MouseClickDrag, left, 11,  319, 200, 336 ,20	
Sleep, 1000
MouseClickDrag, left, 1439,  326, 412, 326 ,20	
Sleep, 1000
}

ClearAllAtribute(){
MouseClick, left, 225, 855 , 3
Sleep, 100
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
Sleep, 100

Click, 371, 220 Left, Down
Sleep, 125
Click, 371, 220 Left, Up
Sleep, 359

Click, 597, 380 Left, Down
Sleep, 125
Click, 597, 380 Left, Up
Sleep, 100
}

AddAttribute(){
MouseClick, left, 311, 838
Sleep,100
Send, {Home} ; set to home prepare for select
Sleep,100

MouseClick, left,  382,  68
Sleep, 1000

MouseClick, left, 148 , 233
Sleep, 1000 

; Select attribute for U21 DL
; R1 Expand DL Measurement
Send, {Right}{Down}{Right}{Down}{Down}{Down}{Right}{Down}{Down}{Down}{Down}{Right}{Down}{Down}{Right}
Sleep, 1000

;1 RSCP
Send, {Down}{Down}{Down}{Down}{Right}{Down}
Sleep, 1000
Send, {Tab}
Sleep, %SpeedS%
Send, {Space}
Sleep, %SpeedS%

;---- back ----
Send, {LShift Down}
Sleep, %SpeedS%
Send, {Tab}
Sleep, %SpeedS%
Send, {LShift Up}
Sleep, %SpeedS%
Send , {Up}{Left}
Sleep, %SpeedS%
;--- end back ----

;2 EcNo
Send, {Up}{Right}{Down}
Sleep, %SpeedS%
;---- select and back ----
Send, {Tab}
Sleep, %SpeedS%
Send, {Space}
Sleep, %SpeedS%
Send, {LShift Down}
Sleep, %SpeedS%
Send, {Tab}
Sleep, %SpeedS%
Send, {LShift Up}
Sleep, %SpeedS%
Send , {Up}{Left}
Sleep, %SpeedS%
;--- end back ----

;3 SC
Send, {Down}{Down}{Right}{Down}
Sleep, %SpeedS%
;---- select and back ----
Send, {Tab}
Sleep, %SpeedS%
Send, {Space}
Sleep, %SpeedS%
Send, {LShift Down}
Sleep, %SpeedS%
Send, {Tab}
Sleep, %SpeedS%
Send, {LShift Up}
Sleep, %SpeedS%
Send , {Up}{Left}
Sleep, %SpeedS%
;--- end back ----

; 4 APP_TP_DL ;;;;Sleepy 
Send,  {Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up}
Sleep, %SpeedS%
Send, {Right}{Down}{Right}{Down}
Sleep, %SpeedS%
;---- select and back ----
Send, {Tab}
Sleep, %SpeedS%
Send, {Space}
Sleep, %SpeedS%
Send, {LShift Down}
Sleep, %SpeedS%
Send, {Tab}
Sleep, %SpeedS%
Send, {LShift Up}
Sleep, %SpeedS%
Send , {Up}{Left}
Sleep, %SpeedS%
;--- end back ----


;5_HSDPA
Send, {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Right}{Down}
Sleep, %SpeedS%
;---- select and back ----
Send, {Tab}
Sleep, %SpeedS%
Send, {Space}
Sleep, %SpeedS%
Send, {LShift Down}
Sleep, %SpeedS%
Send, {Tab}
Sleep, %SpeedS%
Send, {LShift Up}
Sleep, %SpeedS%
Send , {Up}{Left}
Sleep, %SpeedS%
;--- end back ----

;6_DL UARFCN
Send, {Down}{Down}{Right}{Down}
Sleep, %SpeedS%
;---- select and back ----
Send, {Tab}
Sleep, %SpeedS%
Send, {Space}
Sleep, %SpeedS%
Send, {LShift Down}
Sleep, %SpeedS%
Send, {Tab}
Sleep, %SpeedS%
Send, {LShift Up}
Sleep, %SpeedS%
Send , {Up}{Left}
Sleep, %SpeedS%
;--- end back ----

; R2 UL 
Send, {Home}{Down}{Left}{Down}{Right}
sleep, %SpeedS%
Send, {Down}{Down}{Down}
sleep, %SpeedS%
Send, {Right}{Down}{Down}{Down}{Right}{Down}{Right}{Down}{Down}
sleep, %SpeedS%
Send, {Tab}
sleep, %SpeedS%
Send, {Space}
sleep, %SpeedS%

; enter to finish select
Send, {Tab}{Tab}{Enter}
Sleep, 20000  ; delay for display all layer
}

UnSelectAndCollapAll(){
; unselect & Collap all
MouseClick, left, 324, 800
Sleep, 1000
send, {Home}
Sleep, 1000
MouseClick, right, 297,158
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
;- click to uncheck layer

}

ExportLegend(ExportLegendName,x,y){
;MouseClick, left , 228, 236
MouseClick, left , %x%,  %y%
Sleep, 1000

lx := x+90
ly := y+15
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

ClearAllAtribute()
AddAttribute()
UnSelectAndCollapAll()
SelectCellRef(243,107) ;  U2100 cellref

; --- prepare export file name -----
;---- DL UL ----
ExportName7 = %OutputPath%7_ActiveSet_RSCP.jpg
ExportName8 = %OutputPath%8_ActiveSet_EcNo.jpg
ExportName9 = %OutputPath%9_ActiveSet_SC.jpg
ExportName10 = %OutputPath%10_HSDPA_CQI.jpg
ExportName11 = %OutputPath%11_App_TP_DL.jpg
ExportName12 = %OutputPath%12_DL_UARFCN.jpg
ExportName13 = %OutputPath%13_App_TP_UL.jpg

ExportLegendName7 = %OutputPath%7_Legend_ActiveSet_RSCP.wmf
ExportLegendName8 = %OutputPath%8_Legend_ActiveSet_EcNo.wmf
ExportLegendName9 = %OutputPath%9_Legend_ActiveSet_SC.wmf
ExportLegendName10 = %OutputPath%10_Legend_HSDPA_CQI.wmf
ExportLegendName11 = %OutputPath%11_Legend_App_TP_DL.wmf
ExportLegendName12 = %OutputPath%12_Legend_DL_UARFCN.wmf
ExportLegendName13 = %OutputPath%13_Legend_App_TP_UL.wmf

;-----
x = 244
y:= 235 ; change to start layer
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName7)
ExportLegend(ExportLegendName7,228,236) 
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName8) 
ExportLegend(ExportLegendName8,228,253)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName9) 
ExportLegend(ExportLegendName9,228,268)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName10) 
ExportLegend(ExportLegendName10,228,285)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName11) 
ExportLegend(ExportLegendName11,228,300)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName12) 
ExportLegend(ExportLegendName12,228,315)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName13) 
ExportLegend(ExportLegendName13,228,331)
ClickLayer(x,y)

MsgBox "Finish Post U2100 DL-UL"
return