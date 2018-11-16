; Declare Global
global OutputPath = "C:\AutoExport\PostTest\U900\"
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

; Select attribute for U900 DL
; R3 Expand DL Measurement
Send, {Right}{Down}{Down}{Down}{Right}{Down}{Down}{Down}
Sleep, %SpeedS%
send, {Right}{Down}{Down}{Down}{Down}{Right}{Down}{Down}{Right}
Sleep, %SpeedS%

; 1_Uu_ActiveSet_RSCP_0
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

;2_Uu_ActiveSet_EcNo_0
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

;3_Uu_ActiveSet_SC_0
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

;4_UE_TxPow
Send,  {Up}{Up}{Up}{Up}
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
;--- end back ----

;5_Uu_ActiveSet_Count
Send,  {Down}
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
;--- end back ----

;6_Pilot UE Version 3
Send, {Up}{Up}{Up}{Up}{Up}{Up}
Sleep, %SpeedS%
send, {Right}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}
Sleep, %SpeedS%
;---- select and back ----
Send, {Tab}
Sleep, %SpeedS%
Send, {Space}
Sleep, %SpeedS%

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
ExportName1 = %OutputPath%1_ActiveSet_RSCP.jpg
ExportName2 = %OutputPath%2_ActiveSet_EcNo.jpg
ExportName3 = %OutputPath%3_TX.jpg
ExportName4 = %OutputPath%4_TxPower.jpg
ExportName5 = %OutputPath%5_ActiveSet_Count.jpg
ExportName6 = %OutputPath%6_Pilot_V3.jpg

ExportLegendName1 = %OutputPath%1_Legend_ActiveSet_RSCP.wmf
ExportLegendName2 = %OutputPath%2_Legend_ActiveSet_EcNo.wmf
ExportLegendName3 = %OutputPath%3_Legend_ActiveSet_SC.wmf
ExportLegendName4 = %OutputPath%4_Legend_TxPower.wmf
ExportLegendName5 = %OutputPath%5_Legend_ActiveSet_Count.wmf
ExportLegendName6 = %OutputPath%6_Legend_Pilot_V3.wmf

;-----
x = 244
y:= 235 ; change to start layer
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName1)
ExportLegend(ExportLegendName1,228,236) 
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName2) 
ExportLegend(ExportLegendName2,228,253)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName3) 
ExportLegend(ExportLegendName3,228,268)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName4) 
ExportLegend(ExportLegendName4,228,285)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName5) 
ExportLegend(ExportLegendName5,228,300)
ClickLayer(x,y)

y:= y + 15
ClickLayer(x,y)
Sleep, 1000
ActiveMap()
ExportMap(ExportName6) 
ExportLegend(ExportLegendName6,228,315)
ClickLayer(x,y)

MsgBox "Finish Post U0900_VOL"
return