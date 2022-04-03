#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive, League of Legends (TM) Client  
  
  
#Include, core.ahk

  clicGauche(x, y) {
    SendInput, {Click %x%, %y%, left}
    Return
  }

  clicDroit(x, y) {
    SendInput, {Click %x%, %y%, right}
    Return
  }

  moveMouse(x, y) {
    MouseMove, %x%, %y%
    Return
  }

  ;Permet de placer le bot derrière l'alié
  placerLeBot(side){
    if(side = "red"){
        Random, rng,0,blueDistanceVariation
        clicDroit(X_redDistanceFromBot-(2*rng),Y_redDistanceFromBot+rng)
    }
    else{
      Random, rng,0,redDistanceVariation
      clicDroit(X_blueDistanceFromBot+(2*rng),Y_blueDistanceFromBot-rng)
    }
    Return
  }

  
  ;Fait marcher le bot vers la base en spammant le click pendant un temps "dodo"
  walkToBase(side,time){
    if(side = "blue"){
      clicDroit(X_blueBaseOnMinimap,Y_blueBaseOnMinimap)
    }
    else{
      clicDroit(X_redBaseOnMinimap,Y_redBaseOnMinimap)
    }
    i := 0
    while(i < time){
      rng := 0
      Random, rng,40,100
      if(side = "blue"){
          clicDroit(X_blueBaseOnMinimap,Y_blueBaseOnMinimap)
      }
      else{
        clicDroit(X_redBaseOnMinimap,Y_redBaseOnMinimap)
      }
      i := i + rng
      Sleep, rng
    }
    Return
  }


; ^o::
;   walkToBase("blue",3000) ;test OK !