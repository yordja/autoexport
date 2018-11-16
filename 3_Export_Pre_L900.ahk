; Declare Global
global OutputPath = "C:\AutoExport\PreTest\LTE900\"

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

; Select attribute for L900
; R1 Expand DL Measurement
Send, {Right}{Down}{Right}{Down}{Right}{Down}{Down}{Down}{Down}{Down}{Right}{Down}{Down}{Down}{Right}
Sleep, 1000

;-- R1 ---
;1 RSRP
MouseClick, left, 198, 272, 2
Sleep, 1000

;2 SINR
MouseClick, left, 198, 308, 2
Sleep, 1000

;3 PCI
MouseClick, left, 198, 218, 2
Sleep, 1000


;4 App TP _AL
send, {Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up}
Sleep,1000
send, {Right}{Down}{Right}{Down}
Sleep,1000
MouseClick, left, 210, 109, 2
Sleep, 1000

;5 EARFCN_DL
send, {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down} {Down}
Sleep,100
send, {Right}{Down}
Sleep,100
MouseClick, left, 210, 326, 2
Sleep,100

;-- R2 ----
;6  APP_TP_UL  
send, {Home}
sleep,1000
send, {Down}{Left}{Down}
Sleep,100
send, {Right}{Down}{Right}
Sleep,100
send, {Down}{Down}{Down}{Right}{Down}{Right}{Down}{Down}
Sleep,100

Send, {tab}{Space}
sleep,100
Send, {LShift Down}
Sleep, 100
Send, {Tab}
Sleep, 100
Send, {LShift Up}
Sleep, 100

; enter to finish select
Send, {Enter}
Sleep, 10000  ; delay for display all layer
}

UnSelectAndCollapAll(){
; unselect & Collap all
MouseClick, left, 225, 855 , 3
Sleep, 100
MouseClick, left, 324, 800
Sleep, 1000
send, {Home}
Sleep, 1000
MouseClick, right, 297,158
Sleep, 1000
Send, {Down}{Down}{Down}{Down}{Down}{Enter}
Sleep, 1000
MouseClick, right, 297,158
Sleep, 1000
Send, {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
Sleep, 1000
MsgBox "clear done"
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
SelectCellRef(243,123) ;  L900 cellref

; --- prepare export file name -----
ExportName1 = %OutputPath%1_RSRP.jpg
ExportName2 = %OutputPath%2_SINR.jpg
ExportName3 = %OutputPath%3_PCI.jpg
ExportName4 = %OutputPath%4_Throughput_DL.jpg
ExportName5 = %OutputPath%5_EARFCN_DL.jpg
ExportName6 = %OutputPath%6_Throughput_UL.jpg

ExportLegendName1 = %OutputPath%1_Legend_RSRP.wmf
ExportLegendName2 = %OutputPath%2_Legend_SINR.wmf
ExportLegendName3 = %OutputPath%3_Legend_PCI.wmf
ExportLegendName4 = %OutputPath%4_Legend_Throughput_DL.wmf
ExportLegendName5 = %OutputPath%5_Legend_EARFCN_DL.wmf
ExportLegendName6 = %OutputPath%6_Legend_Throughput_UL.wmf

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

MsgBox "Finish"
return