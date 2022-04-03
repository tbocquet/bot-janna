#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive, League of Legends (TM) Client

#Include core.ahk
;--------------Fonctions pour recupérer les couleurs de pixels etc...----------------------

moveMouse(x, y) {
  MouseMove, %x%, %y%
  Return
}

;retourne la couleur à une position relative
getPixelOnSreen(x,y){
  cordX := A_screenWidth*x/100
  cordY := A_screenHeight*y/100
  PixelGetColor, res, %cordX%, %cordY%, RGB
  return res
}

getInfoAtCurrentPosition(){
  MouseGetPos, x, y
  moveMouse(x-300,y-300)
  Sleep, 300
  PixelGetColor, color, %x%, %y%, RGB
  Sleep, 1000
  MsgBox, color at position %x% %y% is %color%
  Return
}
^i::
  getInfoAtCurrentPosition()
Return



;-------------Fonctions plus specifiques---------------------------------------

getAllItemColor(){
  PixelGetColor, slot1, 1153, 966, RGB
  Sleep, 400
  moveMouse(1153,966)

  PixelGetColor, slot2, 1201, 966, RGB
  Sleep, 400
  moveMouse(1201,966)

  PixelGetColor, slot3, 1249, 966, RGB
  Sleep, 400
  moveMouse(1249,966)

  PixelGetColor, slot4, 1295, 970, RGB
  Sleep, 400
  moveMouse(1295,970)

  PixelGetColor, slot5, 1153, 1015, RGB
  Sleep, 400
  moveMouse(1153,1015)

  PixelGetColor, slot6, 1201, 1015, RGB
  Sleep, 400
  moveMouse(1201,1015)

  PixelGetColor, slot7, 1249, 1015, RGB
  Sleep, 400
  moveMouse(1249,1015)

  Sleep, 2000
  MsgBox, slot1: %slot1%slot2: %slot2% slot3: %slot3% slot4: %slot4% slot5: %slot5% slot6: %slot6% slot7: %slot7%
  Return
}
^b::
  getAllItemColor()
Return



getAllAlieIcon(){
  PixelGetColor, alie1, 1691, 756, RGB
  Sleep, 400
  moveMouse(1691,756)

  PixelGetColor, alie2, 1757, 756, RGB
  Sleep, 400
  moveMouse(1757,756)

  PixelGetColor, alie3, 1823, 756, RGB
  Sleep, 400
  moveMouse(1823,756)

  PixelGetColor, alie4, 1887, 756, RGB
  Sleep, 400
  moveMouse(1887,756)

  Sleep, 2000
  MsgBox, alie1: %alie1% alie2: %alie2% alie3: %alie3% alie4: %alie4%
  Return
}
^a::
  getAllAlieIcon()
Return


getAllAlieHpbare(){
  PixelGetColor, alie1, 1713, 783, 
  Sleep, 400
  moveMouse(1713,783)

  PixelGetColor, alie2, 1693, 783, RGB
  Sleep, 400
  moveMouse(1693,783)

  PixelGetColor, alie3, 1683, 783, RGB
  Sleep, 400
  moveMouse(1683,783)

  PixelGetColor, alie4, 1683, 783, RGB
  Sleep, 400
  moveMouse(1683,783)

  Sleep, 2000
  MsgBox, alie1HP: %alie1% `n alie2HP: %alie2% `n alie3HP: %alie3% `n alie4HP: %alie4%
  Return
}
^h::
  getAllAlieHpbare()
Return


getAllBotInfo(){
  PixelGetColor, cadreBot, 738, 1058, RGB
  Sleep, 400
  moveMouse(738,1058)

  PixelGetColor, hpfull, 738, 1038, RGB
  Sleep, 400
  moveMouse(738,1038)
  PixelGetColor, hpmid, 738, 1038, RGB
  Sleep, 400
  moveMouse(738,1038)
  PixelGetColor, hplow, 738, 1038, RGB
  Sleep, 400
  moveMouse(738,1038)

  PixelGetColor, manaFull, 738, 1058, RGB
  Sleep, 400
  moveMouse(738,1058)
  PixelGetColor, manaMid, 738, 1058, RGB
  Sleep, 400
  moveMouse(738,1058)
  PixelGetColor, manaLow, 738, 1058, RGB
  Sleep, 400
  moveMouse(738,1058)
  
  Sleep, 2000
  MsgBox, cadreBot: %cadreBot% HpFull:%hpfull% HPmid:%hpmid% hplow:%hplow% Manafull: %manaFull% manaMid:%manaMid% manaLow:%manaLow%
  Return
}


checkAllAlieHpBare(){
 
      moveMouse( 1571, 635)
    Sleep, 1000
    
      moveMouse( 1669, 635)
    Sleep, 1000
    
      moveMouse( 1766, 635)
    Sleep, 1000
    
      moveMouse( 1862, 635)
    Sleep, 1000

    ;testé OK!
    ;Bare hp allié mid
    
      moveMouse( 1588, 635)
    Sleep, 1000
    
      moveMouse( 1687, 635)
    Sleep, 1000
    
      moveMouse( 1783, 635)
    Sleep, 1000
    
      moveMouse( 1877, 635)
    Sleep, 1000

    ;testé OK!
    ;Bare hp allié full
    
      moveMouse( 1607, 635)
    Sleep, 1000
    
      moveMouse( 1704, 635)
    Sleep, 1000
    
      moveMouse( 1800, 635)
    Sleep, 1000
    
      moveMouse( 1896, 635)
    Sleep, 1000
}

;^y::
;  checkAllAlieHpBare()