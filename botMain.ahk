#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;***************************************Fonction***************************************************
#IfWinActive, League of Legends (TM) Client


#Include fonction.ahk
#Include fonctionEcran.ahk
#Include fonctionBoutique.ahk
#Include core.ahk
#Include fonctionSpells.ahk
#Include fonctionDeplacement.ahk
#Include fileReader.ahk
#Include fonctionVocal.ahk
#Include, animations.ahk

;***************************************Bot***************************************************
^o::
  ;Initialisation

  ;parametrage des variables globales
  screenResolution := getScreenResolutionFromConfigFile()
  setGlobalsVariable(screenResolution)

  ;recuperation du cote
    side := "blue"
  ;recuperation de l'input correspondant à l'allié
    alieInput := "F5"
    alieCursor := 2

  ;recuperation de la couleur du bot en vie
  	botAlive := getElementColor("botIcon")

  ;recuperation de la couleur de l'alié en vie
    colorCadreAlieAlive := getAlieIcon(alieInput)

  ;Definition de la mana
    isMana := getManaFromConfigFile()

  ;achat des items
    itemBuyer()

  ;recuperation du mode
    mode := getChampionFromConfigFile()

  ;timer pour un back toute les 10 mins au moins
    timer := 0
    
  ;*************Debut Loop************
  while(WinActive("League of Legends (TM) Client")){
    ;Partie action du bot
    SendInput, {%alieInput% down}
    Sleep, 50
    
    ;Amelioration des spells si necessaire
    spellDeamon()

    ;Si le bot est en vie
    if(getIconChampion() = botAlive){
      ;messagesChat("Je suis en vie !")

      ;Si l'allié est en vie
      if(alieIsAlive(alieInput,colorCadreAlieAlive)){
        ;messagesChat("L'alié est en vie !!")
        ;Va lancer les spells
        gestionnaireSpell(mode,alieInput,side)
        Sleep, 100
        if(mode != "yuumi"){
          placerLeBot(side)
        }
        ;Si low hp ----------------------------------
        if((getIconChampion() = botAlive) and isBotHpAtThisState(30) ){
          ;Pour Yuumi
            if(mode != "yuumi" or (getElementColor("Z") != getSpellColor("yuumiZZ"))){
            SendInput, {%alieInput% up}
            ;messagesChat("je suis low hp je me casse !")
            procedureBack(side,8000)
            timer := 0
            SendInput, {%alieInput% down}
          }
        }

        ;Si low mana -------------------------------------
        if((getIconChampion() = botAlive) and isBotManaAtThisState(30) and isMana){
          ;Pour Yuumi
          if(mode != "yuumi" or (getElementColor("Z") != getSpellColor("yuumiZZ"))){
            SendInput, {%alieInput% up}
            ;messagesChat("Je suis low mana, je me casse")
            procedureBack(side,4000)
            timer := 0
            SendInput, {%alieInput% down}
          }
        }
      }
      ;Si l'alié est mort -------------------------------------
      else{
        SendInput, {%alieInput% up}
        if(getElementColor("botIcon") = botAlive){
          walkToBase(side,50)
          placerLeBot(side)
          send, df
          walkToBase(side,4000)
          procedureBackMort(side,8000,alieInput,colorCadreAlieAlive)
          timer := 0
        }
        ;Attendre la résuréction de l alié
        while(!alieIsAlive(alieInput,colorCadreAlieAlive) or (getElementColor("botIcon") != botAlive)){
          Sleep, 100
          timer := timer + 100
          if(GetKeyState("Shift")) {
            Return
          }
        }
        
        SendInput, {%alieInput% down}
      }
    }
    ;Si le bot est mort----------------------------------
    else{
      SendInput, {%alieInput% up}
      while(! alieIsAlive(alieInput,colorCadreAlieAlive) and (getElementColor("botIcon") != botAlive)){
        Sleep, 100
        timer := timer + 100
        if (GetKeyState("Shift")) {
          Return
        }
      }
      SendInput, {%alieInput% down}
      timer := 0
    }
    
    ;Si le bot n'a pas back depuis trop longtemps
    if(timer > (1000*60*10)){
      SendInput, {%alieInput% up}
      messagesChat("J'ai pas back depuis 1000 ans !")
      messagesChat("Tchao les nazes !")
      procedureBack(side,4000)
      timer := 0
      SendInput, {%alieInput% down}
    }
    timer := timer + 50

    ;Changement de coté
    if (GetKeyState("S")){
      if(side = "red"){
        side := "blue"
      }
      else{
          side := "red"
      }
      playAnimation(2)
    }

    ;Changement d'alié
    if(GetKeyState("F2")){
      if(GetKeyState("Space")){
        if(mode = "yuumi"){
          placerLeBot(side)
          Send, z
        }
        SendInput, {%alieInput% up}
        alieInput := "F2"
        colorCadreAlieAlive := getAlieIcon(alieInput)
        SendInput, {%alieInput% down}
      }
    }
    if(GetKeyState("F3")){
      if(GetKeyState("Space")){
        if(mode = "yuumi"){
          placerLeBot(side)
          Send, z
        }
        SendInput, {%alieInput% up}
        alieInput := "F3"
        colorCadreAlieAlive := getAlieIcon(alieInput)
        SendInput, {%alieInput% down}
      }
    }
    if(GetKeyState("F4")){
      if(GetKeyState("Space")){
        if(mode = "yuumi"){
          placerLeBot(side)
          Send, z
        }
        SendInput, {%alieInput% up}
        alieInput := "F4"
        colorCadreAlieAlive := getAlieIcon(alieInput)
        SendInput, {%alieInput% down}
      }
    }
    if(GetKeyState("F5")){
      if(GetKeyState("Space")){
        if(mode = "yuumi"){
          placerLeBot(side)
          Send, z
        }
        SendInput, {%alieInput% up}
        alieInput := "F5"
        colorCadreAlieAlive := getAlieIcon(alieInput)
        SendInput, {%alieInput% down}
      }
    }
    
    ;Partie configuration/reset/arret du bot
    ;Arreter le bot
    if (GetKeyState("Shift")) {
    	SendInput, {%alieInput% up}
      Return
    }
  }
Return



