#Include, core.ahk
#Include, fonctionDeplacement.ahk
#Include, fonctionBoutique.ahk

  ;Procédure de back
  Back(){
  	  Send, {b Down}
      Sleep, 200
      Send, {b Up}
    	Sleep, 8500
      Sleep, 5000 ;pour recharger les hps
      Return
  }

;Si l'alié meurt en early cela évite que le bot perde 1000 ans à back
  BackMortAlie(alieInput,colorCadreAlieAlive){
      Send, {b Down}
      Sleep, 200
      Send, {b Up}
      i:=0
      while(i < 8500 and !alieIsAlive(alieInput,colorCadreAlieAlive)){
        i:=i+1000
        Sleep, 1000
      }
      Sleep, 4000 ;pour recharger les hps
      Return

  }

  procedureBack(side,duree){
    walkToBase(side,duree)
    Back()
    itemBuyer()
    Sleep,200
    Return
  }

  procedureBackMort(side,duree,alieInput,colorCadreAlieAlive){
    walkToBase(side,duree)
    BackMortAlie(alieInput,colorCadreAlieAlive)
    itemBuyer()
    Sleep,200
    Return
  }

  ;Placer la souris sur l'allié
  mouseOnAlie(){
    moveMouse(X_alie,Y_alie)
    Return
  }


  



