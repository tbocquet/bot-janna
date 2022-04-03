#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive, League of Legends (TM) Client


;***************************************Fonctions***************************************************
  #Include, core.ahk  
  
  getIconChampion(){
    color := getElementColor("botIcon")
    Return color
  }

  
  getAlieIcon(alieInput){
   	if(alieInput = "F2"){
  		color := getElementColor("alie1")
  	}
  	if(alieInput = "F3"){
  		color := getElementColor("alie2")
    }
  	if(alieInput = "F4"){
  		color := getElementColor("alie3")
  	}
  	if(alieInput = "F5"){
  		color := getElementColor("alie4")
  	}
  	Return color
  }

  alieIsAlive(alieInput,colorCadreAlieAlive){
    color1 := getAlieIcon(alieInput)
    Return (color1 = colorCadreAlieAlive)
  }

  isAlieLowLife(alieInput){
    if(alieInput = "F2"){
      color := getElementColor("alieHp1Low")
    }
    if(alieInput = "F3"){
      color := getElementColor("alieHp2Low")
    }
    if(alieInput = "F4"){
      color := getElementColor("alieHp3Low")
    }
    if(alieInput = "F5"){
      color := getElementColor("alieHp4Low")
    }
    color2 := getElementColor("alieHpEmptyPixColor")
    ;MsgBox, %color% %color2%
    Return (color = color2)
  }

  isAlieMidLife(alieInput){
    if(alieInput = "F2"){
      color := getElementColor("alieHp1Mid")
    }
    if(alieInput = "F3"){
      color := getElementColor("alieHp2Mid")
    }
    if(alieInput = "F4"){
      color := getElementColor("alieHp3Mid")
    }
    if(alieInput = "F5"){
      color := getElementColor("alieHp4Mid")
    }
    color2 := getElementColor("alieHpEmptyPixColor")
    ;MsgBox, %color% %color2%
    Return (color = color2)
  }

  isAlieFullLife(alieInput){
    if(alieInput = "F2"){
      color := getElementColor("alieHp1Full")
    }
    if(alieInput = "F3"){
      color := getElementColor("alieHp2Full")
    }
    if(alieInput = "F4"){
      color := getElementColor("alieHp3Full")
    }
    if(alieInput = "F5"){
      color := getElementColor("alieHp4Full")
    }
    color2 := getElementColor("alieHpEmptyPixColor")
    ;MsgBox, %color% %color2%
    Return (color != color2)
  }


  ;Testé OK!
  ;regarde si les hp du bot sont inferieur au pourcentage d'entré
  isBotHpAtThisState(hpPercentage){
    value := "botHp" hpPercentage
    color := getElementColor(value)
    color2 := getElementColor("botHpEmptyPixColor")
    ;MsgBox, %value% %color% %color2%
    Return (color = color2)
  }

  ;testé OK!
  ;regarde si la mana du bot est inferieur au pourcentage d'entré
  isBotManaAtThisState(manaPercentage){
    value := "botMana" manaPercentage
    color := getElementColor(value)
    color2 := getElementColor("botManaEmptyPixColor")
    ;MsgBox, %value% %color% %color2%
    Return (color = color2)
  }


  botIsLowLife(){
    Return isBotHpAtThisState(30)
  }

  botIsLowMana(){
    Return  isBotManaAtThisState(30)
  }

  botIsMidMana(){
    Return  isBotManaAtThisState(70)
  }

  botIsFullMana(){
    Return  !isBotManaAtThisState(80)
  }

;^o::
;  while(true){
;    if(isAlieMidLife("F2")){
;      MsgBox, Il l'est !
;    }
;    Sleep, 50
;}

;^j::
  ;isBotManaAtThisState(90)
;  isBotHpAtThisState(20)
;  Return