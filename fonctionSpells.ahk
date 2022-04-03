#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive, League of Legends (TM) Client

;--------------------------------------------------------------------------------

#Include, core.ahk
#Include, fonctionEcran.ahk
#Include, filereader.ahk
#Include, fonction.ahk
#Include, jungleFeatures.ahk

  ; Up une compétence
  upSpell(spell){
    if(spell = "a"){
      Send {Ctrl Down}a{Ctrl Up}
    }
    else if(spell = "z"){
      Send {Ctrl Down}z{Ctrl Up}
    }
    else if(spell = "e"){
      Send {Ctrl Down}e{Ctrl Up}
    }
    else if(spell = "r"){
        Send {Ctrl Down}r{Ctrl Up}
    }
    Sleep, 20
    Return
  }

  ;Amélioration check la disponibilité des compétence, si disponibilité
  isThereASpellToUp(){
    spell1:= getElementColor("upSpell1") = getElementColor("upSpell1PixColor")
    spell2:= getElementColor("upSpell2") = getElementColor("upSpell2PixColor")
    spell3:= getElementColor("upSpell3") = getElementColor("upSpell3PixColor")
    spell4:= getElementColor("upSpell4") = getElementColor("upSpell4PixColor")
    Return (spell1 or spell2 or spell3 or spell4)
  }

  ;Test OK!
  ;Gestionnaire d'amélioration de compétence
  ;Le pixel de merde change de couleur on est donc obligé de maxer tous les spells pour être sur de maxer dans le bon ordre
  spellDeamon(){
    if(isThereASpellToUp()){ 
      spellOrder := getSpellOrderFromConfigFile()
      Loop, Parse, spellOrder
      {
        upSpell(A_LoopField)
      }
    }
    Return
  }

  ;Envoyer un spell
  sendSpell(spell){
    Send, %spell%
  }

 ;Lance le spell du champion si disponible
  sendChampSpellIfAvailable(spell,champion){
    spellName := champion spell
    if(getElementColor(spell) = getSpellColor(spellName)){
      if(spell = "Q"){
        Send, a
      }
      if(spell = "Z"){
        Send, z
      }
      if(spell = "E"){
        Send, e
      }
      if(spell = "R"){
        Send, r
      }
    }
    Sleep, 20
  }

  
  ;Regarde si le sum passé en parametre est dispo et le lance
  isSumAvailable(sum,sumColorName){
    if(getElementColor(sum) = getSpellColor(sumColorName)){
      if(sum = "D"){
        Send, d
      }
      if(sum = "F"){
        Send, f
      }
    }
    Sleep, 20
  }

  ;Gestionnaire d'envoit des summoners
  sendSumsIfAvailable(sum){
      if(sum = "D"){
        isSumAvailable("D","D_flash")
        isSumAvailable("D","D_exaust")
        isSumAvailable("D","D_heal")
      }
      else if(sum = "F"){
        isSumAvailable("F","F_flash")
        isSumAvailable("F","F_exaust")
        isSumAvailable("F","F_heal")
      }
      else{
          MsgBox, Error sendSumsIfAvailable : unknow summoners %sum%
      }
    Return
  }

  ;Gestionnaire d'envoit des spells
  gestionnaireSpell(mode,alieInput,side){
    if(mode = "lee"){
      gestionnaireLeeSin(alieInput)
    }
    else if(mode = "lulu"){
      gestionnaireLulu(alieInput)
    }
    else if(mode = "janna"){
      gestionnaireJanna(alieInput)
    }
    else if(mode = "yuumi"){
      gestionnaireYuumi(alieInput,side)
    }
    else if(mode = "janna"){
      gestionnaireNami(alieInput)
    }
    else if(mode = "ivern"){
      gestionnaireIvern(alieInput,side)
    }
    else{
      mouseOnAlie()
      Sleep, 50
      Send, e
      Sleep, 50
    }
  }

;--------------programmation des differents bot------------

gestionnaireLeeSin(alieInput){
  mouseOnAlie()
  Sleep, 20
  sendChampSpellIfAvailable("Z","lee")
  if(isAlieLowLife(alieInput)){
    sendSumsIfAvailable("D")
    sendSumsIfAvailable("F")
    sendChampSpellIfAvailable("E","lee")
    sendChampSpellIfAvailable("R","lee")
  }
  Return
}

gestionnaireLulu(alieInput){
  mouseOnAlie()
  Sleep, 20
  if(! isBotManaAtThisState(60)){
    sendChampSpellIfAvailable("E","lulu")
    sendChampSpellIfAvailable("Z","lulu")
  }
  if(isAlieMidLife(alieInput) and ! isBotManaAtThisState(40)){
      sendChampSpellIfAvailable("E","lulu")
  }
  if(isAlieLowLife(alieInput)){
      sendSumsIfAvailable("D")
      sendSumsIfAvailable("F")
      mouseOnAlie()
      sendChampSpellIfAvailable("R","lulu")
      sendChampSpellIfAvailable("E","lulu")
      sendChampSpellIfAvailable("Z","lulu")
      sendChampSpellIfAvailable("Q","lulu")
  }
  Return
}

gestionnaireJanna(alieInput){
  mouseOnAlie()
  Sleep, 20
  if(! isBotManaAtThisState(50)){
    sendChampSpellIfAvailable("E","janna")
  }
  if(isAlieLowLife(alieInput)){
      sendSumsIfAvailable("D")
      sendSumsIfAvailable("F")
      sendChampSpellIfAvailable("R","janna")
      Sleep, 3000
      mouseOnAlie()
      sendChampSpellIfAvailable("E","janna")
      sendChampSpellIfAvailable("Z","janna")
      sendChampSpellIfAvailable("Q","janna")
      sendChampSpellIfAvailable("Q","janna")
  }
  Return
}

gestionnaireNami(alieInput){
  mouseOnAlie()
  Sleep, 20
  if(! isBotManaAtThisState(60)){
    sendChampSpellIfAvailable("Z","nami")
    sendChampSpellIfAvailable("E","nami")
  }
  if(isAlieMidLife(alieInput) and ! isBotManaAtThisState(40)){
      sendChampSpellIfAvailable("Z","nami")
  }
  if(isAlieLowLife(alieInput)){
      sendSumsIfAvailable("D")
      sendSumsIfAvailable("F")
      mouseOnAlie()
      sendChampSpellIfAvailable("R","nami")
      sendChampSpellIfAvailable("Z","nami")
      sendChampSpellIfAvailable("E","nami")
      sendChampSpellIfAvailable("Q","nami")
  }
  Return
}

gestionnaireYuumi(alieInput,side){
  mouseOnAlie()
  Sleep, 20

  sendChampSpellIfAvailable("Z","yuumi")

  if(! isBotManaAtThisState(70) and !(isAlieFullLife(alieInput))){
    sendChampSpellIfAvailable("E","yuumi")
  }
  if(isAlieMidLife(alieInput)){
      sendChampSpellIfAvailable("E","yuumi")
  }
  if(isAlieLowLife(alieInput)){
      sendSumsIfAvailable("D")
      sendSumsIfAvailable("F")
      sendChampSpellIfAvailable("R","yuumi")
      sendChampSpellIfAvailable("E","yuumi")
      sendChampSpellIfAvailable("Q","yuumi")
  }
  if(isBotManaAtThisState(20)){
    Sleep, 5000
    if(isBotManaAtThisState(20)){
      placerLeBot(side)
      Send, z
      walkToBase(side,500)
    }
  }
  Return
}

gestionnaireIvern(alieInput,side){
  mouseOnAlie()
  Sleep, 20
  if(! isBotManaAtThisState(60)){
    sendChampSpellIfAvailable("Z","ivern")
    sendChampSpellIfAvailable("E","ivern")
    sendChampSpellIfAvailable("R","ivern")
  }
  if(isAlieMidLife(alieInput) and ! isBotManaAtThisState(40)){
      sendChampSpellIfAvailable("z","ivern")
  }
  if(isAlieLowLife(alieInput)){
      sendSumsIfAvailable("D")
      sendSumsIfAvailable("F")
      mouseOnAlie()
      sendChampSpellIfAvailable("R","ivern")
      sendChampSpellIfAvailable("Z","ivern")
      sendChampSpellIfAvailable("E","ivern")
      sendChampSpellIfAvailable("Q","ivern")
  }
  essayerDAllerSmiteUnCampCommeUneGrossePute(side,alieInput)
  Return
}


;^o::
  ;spellDeamon()
  ;Return