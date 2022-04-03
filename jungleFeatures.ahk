#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive, League of Legends (TM) Client
;-----------------------------------------------------------------------------------------
#Include, core.ahk
#Include, fonctionEcran.ahk
#include, fonction.ahk
#Include, fonctionSpells.ahk

;Fonctionne seulement du red side
  goToRedGromp(){
    compteur:=0 ;Pour le cadre blanc de merde qui peut recouvrir l'icone du mob

    ;Si le bot a plus d'hp il annule la mission
    SendInput, {Space down}
    While((compteur < 4) or (!GetKeyState("Shift") and !isBotHpAtThisState(70) and isCampAvailable("redGromp"))){
        clicDroit(1842, 895)
        Sleep, 200
        moveMouse(900, 500)
        Sleep, 200
        
        if(isBotHpAtThisState(70) or GetKeyState("Shift")){
          compteur := 4
        }
        if(!isCampAvailable("redGromp")){
          compteur := compteur + 1
        }
    }
    Sleep, 1000
    if(!isBotHpAtThisState(70)){
      Sleep, 200
      clicDroit(1247, 428)
      Sleep, 40
      clicDroit(1247, 428)
      Sleep, 3000
      sendSmiteIfAvailable("D")
      sendSmiteIfAvailable("f")
    }
    SendInput, {Space up}
    Return
  }

  ;Fonctionne seulement du blue side
  goToBlueKrugs(){
    compteur:=0 ;Pour le cadre blanc de merde qui peut recouvrir l'icone du mob

    ;Si le bot a plus d'hp il annule la mission
    SendInput, {Space down}
    While((compteur < 4) or (!GetKeyState("Shift") and !isBotHpAtThisState(70) and isCampAvailable("blueKrugs"))){
        clicDroit(1738, 1000)
        Sleep, 200
        moveMouse(900, 500)
        Sleep, 200

        if(isBotHpAtThisState(70) or GetKeyState("Shift")){
          compteur := 4
        }
        if(!isCampAvailable("blueKrugs")){
          compteur := compteur + 1
        }
    }
    Sleep, 1000
    if(!isBotHpAtThisState(70)){
      Sleep, 200
      clicDroit(944, 353)
      Sleep, 40
      clicDroit(944, 353)
      Sleep, 3000
      sendSmiteIfAvailable("D")
      sendSmiteIfAvailable("f")
    }
    SendInput, {Space up}
    Return
  }

  isCampAvailable(campName){
    pixColorName := campName "UpPixColor"
    return (getElementColor(campName) = getElementColor(pixColorName))
  }

  isSmiteAvailable(){
    return ((getElementColor("D") = getSpellColor("D_smite")) or (getElementColor("F") = getSpellColor("F_smite")))
  }

  sendSmiteIfAvailable(sum){
    if(sum = "D"){
        isSumAvailable("D","D_smite")
      }
      else if(sum = "F"){
        isSumAvailable("F","F_smite")
      }
      else{
          MsgBox, Error isSmiteAvailable : unknow summoners %sum%
      }
    Return
  }

essayerDAllerSmiteUnCampCommeUneGrossePute(side,alieInput){
  if(isSmiteAvailable() and !isAlieLowLife(alieInput) and !isBotHpAtThisState(70)){
    if(side = "red"){
      if(isCampAvailable("redGromp")){
        SendInput, {%alieInput% up}
        goToRedGromp()
      }
    }
    else if (side = "blue"){
      if(isCampAvailable("blueKrugs")){
        SendInput, {%alieInput% up}
        goToBlueKrugs()
      }
    }
    else{
      MsgBox, Error essayerDAllerSmiteUnCampCommeUneGrossePute : unknow side %side%
    }
  }
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

;^j::
;  getInfoAtCurrentPosition()
;Return

;^i::
; goToRedGromp()
;Return
;^k::
;  goToBlueKrugs()
;  Return