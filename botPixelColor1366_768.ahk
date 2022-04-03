#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive, League of Legends (TM) Client
;-----------------------------------------------------------------------------------------


setGlobalsVariable1366_768(){
    screenResolution := "1366_768"
    ;Constantes
    X_blueBaseOnMinimap := 1091
    Y_blueBaseOnMinimap := 747

    X_redBaseOnMinimap := 1345
    Y_redBaseOnMinimap := 491

    ;Placement du bot à la distance | (x,y)+ random | du champion choisi
    X_blueDistanceFromBot := 460
    Y_blueDistanceFromBot := 550
    blueDistanceVariation := 100

    X_redDistanceFromBot := 888
    Y_redDistanceFromBot := 162
    redDistanceVariation := 50

    ;position de l'alié sur l'écran
    X_alie := 677
    Y_alie := 374
}

;Renvoit la couleur de l'élément passé en paramètre
getElementColor1366_768(elementName){
    color:=0
    ;Cadres alié (vie ou mort)
    if(elementName = "alie1"){
      PixelGetColor, color, 1125, 424, RGB
    }
    else if(elementName = "alie2"){
      PixelGetColor, color, 1193, 424, RGB
    }
    else if(elementName = "alie3"){
      PixelGetColor, color, 1263, 424, RGB
    }
    else if(elementName = "alie4"){
      PixelGetColor, color, 1330, 424, RGB
    }

    ;Bare hp Allié low
    else if(elementName = "alieHp1Low"){
      PixelGetColor, color, 1117, 452, RGB
    }
    else if(elementName = "alieHp2Low"){
      PixelGetColor, color, 1188, 452, RGB
    }
    else if(elementName = "alieHp3Low"){
      PixelGetColor, color, 1256, 452, RGB
    }
    else if(elementName = "alieHp4Low"){
      PixelGetColor, color, 1325, 452, RGB
    }

    ;Bare hp allié mid
    else if(elementName = "alieHp1Mid"){
      PixelGetColor, color, 1127, 450, RGB
    }
    else if(elementName = "alieHp2Mid"){
      PixelGetColor, color, 1200, 450, RGB
    }
    else if(elementName = "alieHp3Mid"){
      PixelGetColor, color, 1265, 450, RGB
    }
    else if(elementName = "alieHp4Mid"){
      PixelGetColor, color, 1336, 450, RGB
    }

    ;Bare hp alié full
    else if(elementName = "alieHp1Full"){
      PixelGetColor, color, 1146, 450, RGB
    }
    else if(elementName = "alieHp2Full"){
      PixelGetColor, color, 1214, 450, RGB
    }
    else if(elementName = "alieHp3Full"){
      PixelGetColor, color, 1283, 450, RGB
    }
    else if(elementName = "alieHp4Full"){
      PixelGetColor, color, 1351, 450, RGB
    }
    ;Couleur de font de la bare d'Hp des aliés
    else if(elementName = "alieHpEmptyPixColor"){
      color := 0x131313
    }

    ;Icone du champion
    else if(elementName = "botIcon"){
      PixelGetColor, color, 424, 709, RGB
    }

    ;Hp du bot
    else if(elementName = "botHp90"){
      PixelGetColor, color, 748, 733, RGB 
    }
    else if(elementName = "botHp80"){
      PixelGetColor, color, 719, 738, RGB 
    }
    else if(elementName = "botHp70"){
      PixelGetColor, color, 690, 738, RGB 
    }
    else if(elementName = "botHp60"){
      PixelGetColor, color, 670, 738, RGB 
    }
    else if(elementName = "botHp50"){
      PixelGetColor, color, 637, 738, RGB 
    }
    else if(elementName = "botHp40"){
      PixelGetColor, color, 598, 738, RGB 
    }
    else if(elementName = "botHp30"){
      PixelGetColor, color, 574, 738, RGB 
    }
    else if(elementName = "botHp20"){
      PixelGetColor, color, 545, 738, RGB 
    }
    else if(elementName = "botHp10"){
      PixelGetColor, color, 516, 738, RGB 
    }
    else if(elementName = "botHpEmptyPixColor"){
      color := 0x010D07
    }

    ;Bot mana
    else if(elementName = "botMana90"){
      PixelGetColor, color, 748, 748, RGB 
    }
    else if(elementName = "botMana80"){
      PixelGetColor, color, 719, 751, RGB 
    }
    else if(elementName = "botMana70"){
      PixelGetColor, color, 690, 751, RGB 
    }
    else if(elementName = "botMana60"){
      PixelGetColor, color, 670, 751, RGB 
    }
    else if(elementName = "botMana50"){
      PixelGetColor, color, 637, 751, RGB 
    }
    else if(elementName = "botMana40"){
      PixelGetColor, color, 598, 751, RGB 
    }
    else if(elementName = "botMana30"){
      PixelGetColor, color, 574, 751, RGB 
    }
    else if(elementName = "botMana20"){
      PixelGetColor, color, 545, 751, RGB 
    }
    else if(elementName = "botMana10"){
      PixelGetColor, color, 516, 751, RGB 
    }
    else if(elementName = "botManaEmptyPixColor"){
      color := 0x010304
    }

    ;Upspell 
    else if(elementName = "upSpell1"){
      PixelGetColor, color, 539, 650, RGB
    }
    else if(elementName = "upSpell1PixColor"){
      color := 0xFFF35F
    }
    else if(elementName = "upSpell2"){
      PixelGetColor, color, 587, 650, RGB
    }
    else if(elementName = "upSpell2PixColor"){
      color := 0xFEF26A
    }
    else if(elementName = "upSpell3"){
      PixelGetColor, color, 634, 650, RGB
    }
    else if(elementName = "upSpell3PixColor"){
      color := 0xFEF26A
    }
    else if(elementName = "upSpell4"){
      PixelGetColor, color, 680, 650, RGB
    }
    else if(elementName = "upSpell4PixColor"){
      color := 0xFFF35F
    }

    ;Spells
    else if(elementName = "Q"){
      PixelGetColor, color, 537, 694, RGB
    }
    else if(elementName = "Z"){
      PixelGetColor, color, 587, 696, RGB
    }
    else if(elementName = "E"){
      PixelGetColor, color, 636, 695, RGB
    }
    else if(elementName = "R"){
      PixelGetColor, color, 680, 698, RGB
    }

    ;Summoners
    else if(elementName = "D"){
      PixelGetColor, color, 732, 689, RGB
    }
    else if(elementName = "F"){
      PixelGetColor, color, 766, 690, RGB
    }

    ;Items 
    else if(elementName = "item1"){
      PixelGetColor, color ,818 ,688 ,RGB
    }
    else if(elementName = "item2"){
      PixelGetColor, color ,854 ,688 ,RGB
    }
    else if(elementName = "item3"){
      PixelGetColor, color ,890 ,688 ,RGB
    }
    else if(elementName = "item4"){
      PixelGetColor, color ,818 ,725 ,RGB
    }
    else if(elementName = "item5"){
      PixelGetColor, color ,854 ,725 ,RGB
    }
    else if(elementName = "item6"){
      PixelGetColor, color ,890 ,725 ,RGB
    }
    else if(elementName = "ward"){
      PixelGetColor, color ,920 ,688 ,RGB
    }
    else if(elementName = "emptyItemSlotPixColor"){
      color := 0x050D0B
    }
    else {
      MsgBox, Error getElementColor1366_768 : elementName :%elementName%: doesn't exist
    }

    Return color
}


getSpellColor1366_768(spell){
    ; Janna
    if(spell = "jannaQ"){
        color := 0x2D2D2D
    }
    else if(spell = "jannaZ"){
        color := 0x77786B
    }
    else if(spell = "jannaE"){
        color := 0x1B1F21
    }
    else if(spell = "jannaR"){
        color := 0x131617
    }

    ; Lee
    else if(spell = "leeQ"){
        color := 0x2384AC
    }
    else if(spell = "leeZ"){
        color := 0x13130D
    }
    else if(spell = "leeE"){
        color := 0x8B5742
    }
    else if(spell = "leeR"){
        color := 0x7B1900
    }

    ; Lulu
    else if(spell = "luluQ"){
        color := 0xDA4DFB
    }
    else if(spell = "luluZ"){
        color := 0xB0F5A3
    }
    else if(spell = "luluE"){
        color := 0x522F6E
    }
    else if(spell = "luluR"){
        color := 0xACDAB6
    }

    ; Yuumi
    else if(spell = "yuumiQ"){
        color := 0xFFFB7B
    }
    else if(spell = "yuumiZ"){
        color := 0x6B52AD
    }
    else if(spell = "yuumiZZ"){
        color := 0x4F709C
    }
    else if(spell = "yuumiE"){
        color := 0xF5FE8B
    }
    else if(spell = "yuumiR"){
        color := 0x8A38B5
    }

    ; Nami
    else if(spell = "namiQ"){
        color := 0x000ADA
    }
    else if(spell = "namiZ"){
        color := 0x52C9F3
    }
    else if(spell = "namiE"){
        color := 0x0579F0
    }
    else if(spell = "namiR"){
        color := 0x080C8C
    }

    ; Summoners
    else if(spell = "D_flash"){
        color := 0x1F2E16
    }
    else if(spell = "F_flash"){
        color := 0x2E451E
    }
    else if(spell = "D_heal"){
        color := 0x89E65E
    }
    else if(spell = "F_heal"){
        color := 0x3E4E2D
    }
    else if(spell = "D_exaust"){
        color := 0xE5CF80
    }
    else if(spell = "F_exaust"){
        color := 0xEFD784
    }
    else{
        MsgBox, Error getSpellColor1366_768 : unknow spell %spell%
    }
Return color
}


getSkillColorInfo1366_768(){
  spell1 := getElementColor1366_768("Q")
  spell2 := getElementColor1366_768("Z")
  spell3 := getElementColor1366_768("E")
  spell4 := getElementColor1366_768("R")
  MsgBox, Q : %spell1% `n Z : %spell2% `n E : %spell3% `n R : %spell4%
}

getSumsColorInfo1366_768(){
  spell1 := getElementColor1366_768("D")
  spell2 := getElementColor1366_768("F")
  MsgBox, D : %spell1% `n F : %spell2%
}

;^y::
;    getSumsColorInfo1366_768()

;^i::
;    getSkillColorInfo1366_768()