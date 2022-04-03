;Fichier centralisant toute les valeurs récupérées des pixels sur l'ecran ainsi que les constantes liées

  #Include fileReader.ahk
  #Include botPixelColor1920_1080.ahk
  #Include botPixelColor1366_768.ahk
  

  ;Constantes (avec valeur par default pour un ecran 1920-1080)
  Global screenResolution := "1920_1080"
  
  ;Position de la base sur la minimap
  Global X_blueBaseOnMinimap := 1535
  Global Y_blueBaseOnMinimap := 1051

  Global X_redBaseOnMinimap := 1889
  Global Y_redBaseOnMinimap := 692

;Placement du bot à la distance | (x,y)+ random | du champion choisi
  Global X_blueDistanceFromBot := 563
  Global Y_blueDistanceFromBot := 718
  Global blueDistanceVariation := 100

  Global X_redDistanceFromBot := 1052
  Global Y_redDistanceFromBot := 280
  Global redDistanceVariation := 100

;Position de l'alié sur l'écran
  Global X_alie := 955
  Global Y_alie := 531


;Fonction à appeler au lancement du bot pour parametrer les variables globales selon l'écran
setGlobalsVariable(screenResolution){
    if(screenResolution = "1920_1080"){
      setGlobalsVariable1920_1080()
    }
    else if(screenResolution = "1366_768"){
      setGlobalsVariable1366_768()
    }
    else{
      MsgBox, Error setGlobalVariable unknow resolution : %screenResolution%
    }
    Return
}

;Renvoit la couleur de l'élément passé en paramètre
getElementColor(elementName){
    color:=0
    if(screenResolution = "1366_768"){
      color := getElementColor1366_768(elementName)
    }
    else if(screenResolution = "1920_1080"){
      color := getElementColor1920_1080(elementName)
    }
    else{
      MsgBox, Error unknow resolution getElementColor : %screenResolution%
    }
    Return color
}

;Renvoit la couleur des spells passés en parametre
getSpellColor(spell){
    color:=0
    if(screenResolution = "1366_768"){
      color := getSpellColor1366_768(spell)
    }
    else if(screenResolution = "1920_1080"){
      color := getSpellColor1920_1080(spell)
    }
    else{
      MsgBox, getSpellColor Error unknow resolution : %screenResolution%
    }
    Return color
}