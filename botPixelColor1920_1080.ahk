#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive, League of Legends (TM) Client
;-----------------------------------------------------------------------------------------

setGlobalsVariable1920_1080(){
    screenResolution := "1920_1080"
    ;Constantes
    X_blueBaseOnMinimap := 1535
    Y_blueBaseOnMinimap := 1051

    X_redBaseOnMinimap := 1889
    Y_redBaseOnMinimap := 692

    ;Placement du bot à la distance | (x,y)+ random | du champion choisi
    X_blueDistanceFromBot := 563
    Y_blueDistanceFromBot := 718
    blueDistanceVariation := 100

    X_redDistanceFromBot := 1052
    Y_redDistanceFromBot := 280
    redDistanceVariation := 100

    ;Position de l'alié sur l'écran
    X_alie := 955
    Y_alie := 531
}

getElementColor1920_1080(elementName){
    color:= 0
    ;Cadres alié (vie ou mort);
    if(elementName = "alie1"){
      PixelGetColor, color, 1579, 594, RGB
    }
    else if(elementName = "alie2"){
      PixelGetColor, color, 1676, 594, RGB
    }
    else if(elementName = "alie3"){
      PixelGetColor, color, 1772, 594, RGB
    }
    else if(elementName = "alie4"){
      PixelGetColor, color, 1869, 594, RGB
    }

    ;Bare hp Alié low
    else if(elementName = "alieHp1Low"){
      PixelGetColor, color, 1571, 635, RGB
    }
    else if(elementName = "alieHp2Low"){
      PixelGetColor, color, 1669, 635, RGB
    }
    else if(elementName = "alieHp3Low"){
      PixelGetColor, color, 1766, 635, RGB
    }
    else if(elementName = "alieHp4Low"){
      PixelGetColor, color, 1862, 635, RGB
    }

    ;Bare hp allié mid
    else if(elementName = "alieHp1Mid"){
      PixelGetColor, color, 1588, 635, RGB
    }
    else if(elementName = "alieHp2Mid"){
      PixelGetColor, color, 1687, 635, RGB
    }
    else if(elementName = "alieHp3Mid"){
      PixelGetColor, color, 1783, 635, RGB
    }
    else if(elementName = "alieHp4Mid"){
      PixelGetColor, color, 1877, 635, RGB
    }

    ;Bare hp allié full
    else if(elementName = "alieHp1Full"){
      PixelGetColor, color, 1607, 635, RGB
    }
    else if(elementName = "alieHp2Full"){
      PixelGetColor, color, 1704, 635, RGB
    }
    else if(elementName = "alieHp3Full"){
      PixelGetColor, color, 1800, 635, RGB
    }
    else if(elementName = "alieHp4Full"){
      PixelGetColor, color, 1896, 635, RGB
    }

    ;Couleur de font de la bare d'Hp des aliés
    else if(elementName = "alieHpEmptyPixColor"){
      color := 0x131313
    }

    ;Icone du champion
    else if(elementName = "botIcon"){
      PixelGetColor, color, 593, 999, RGB
    }

    ;Hp du bot
    else if(elementName = "botHp90"){
      PixelGetColor, color, 1056, 1030, RGB 
    }
    else if(elementName = "botHp80"){
      PixelGetColor, color, 1014, 1038, RGB 
    }
    else if(elementName = "botHp70"){
      PixelGetColor, color, 973, 1038, RGB 
    }
    else if(elementName = "botHp60"){
      PixelGetColor, color, 944, 1038, RGB 
    }
    else if(elementName = "botHp50"){
      PixelGetColor, color, 897, 1038, RGB 
    }
    else if(elementName = "botHp40"){
      PixelGetColor, color, 841, 1038, RGB 
    }
    else if(elementName = "botHp30"){
      PixelGetColor, color, 808, 1038, RGB 
    }
    else if(elementName = "botHp20"){
      PixelGetColor, color, 766, 1038, RGB 
    }
    else if(elementName = "botHp10"){
      PixelGetColor, color, 725, 1038, RGB 
    }
    else if(elementName = "botHpEmptyPixColor"){
      color := 0x010D07
    }

    ;Mana du bot
    else if(elementName = "botMana90"){
      PixelGetColor, color, 1056, 1050, RGB 
    }
    else if(elementName = "botMana80"){
      PixelGetColor, color, 1014, 1056, RGB
    }
    else if(elementName = "botMana70"){
      PixelGetColor, color, 973, 1056, RGB 
    }
    else if(elementName = "botMana60"){
      PixelGetColor, color, 944, 1056, RGB 
    }
    else if(elementName = "botMana50"){
      PixelGetColor, color, 897, 1056, RGB 
    }
    else if(elementName = "botMana40"){
      PixelGetColor, color, 841, 1056, RGB 
    }
    else if(elementName = "botMana30"){
      PixelGetColor, color, 808, 1056, RGB 
    }
    else if(elementName = "botMana20"){
      PixelGetColor, color, 766, 1056, RGB 
    }
    else if(elementName = "botMana10"){
      PixelGetColor, color, 725, 1056, RGB 
    }
    else if(elementName = "botManaEmptyPixColor"){
      color := 0x010304
    }

    ;Icone d'augmentation des spells du bot
    else if(elementName = "upSpell1"){
      PixelGetColor, color, 758, 916, RGB
    }
    else if(elementName = "upSpell1PixColor"){
      color := 0xB9AB40
    }
    else if(elementName = "upSpell2"){
      PixelGetColor, color, 825, 914, RGB
    }
    else if(elementName = "upSpell2PixColor"){
      color := 0xFFF46A
    }
    else if(elementName = "upSpell3"){
      PixelGetColor, color, 891, 917, RGB
    }
    else if(elementName = "upSpell3PixColor"){
      color := 0x584D27
    }
    else if(elementName = "upSpell4"){
      PixelGetColor, color, 959, 916, RGB
    }
    else if(elementName = "upSpell4PixColor"){
      color := 0xEFDF52
    }

    ;Spells du bot
    else if(elementName = "Q"){
      PixelGetColor, color, 756, 975, RGB
    }
    else if(elementName = "Z"){
      PixelGetColor, color, 825, 975, RGB
    }
    else if(elementName = "E"){
      PixelGetColor, color, 892, 978, RGB
    }
    else if(elementName = "R"){
      PixelGetColor, color, 959, 978, RGB
    }

    ;Summoners
    else if(elementName = "D"){
      PixelGetColor, color, 1025, 974, RGB
    }
    else if(elementName = "F"){
      PixelGetColor, color, 1075, 971, RGB
    }

    ;Items
    else if(elementName = "item1"){
      PixelGetColor, color ,1153 ,966 ,RGB
    }
    else if(elementName = "item2"){
      PixelGetColor, color ,1201 ,966 ,RGB
    }
    else if(elementName = "item3"){
      PixelGetColor, color ,1249 ,966 ,RGB
    }
    else if(elementName = "item4"){
      PixelGetColor, color ,1153 ,1015 ,RGB
    }
    else if(elementName = "item5"){
      PixelGetColor, color ,1201 ,1015 ,RGB
    }
    else if(elementName = "item6"){
      PixelGetColor, color ,1249 ,1015 ,RGB
    }
    else if(elementName = "ward"){
      PixelGetColor, color ,1295 ,970 ,RGB
    }
    else if(elementName = "emptyItemSlotPixColor"){
      color := 0x050D0B
    }


    ;Camp de la jungle
    else if(elementName = "blueKrugs"){
      PixelGetColor, color ,1738 ,997 ,RGB
    }
    else if(elementName = "blueKrugsUpPixColor"){
      color := 0xD1902D
    }
    else if(elementName = "redGromp"){
      PixelGetColor, color ,1848 ,897 ,RGB
    }
    else if(elementName = "redGrompUpPixColor"){
      color := 0xE49D31
    }




    else {
      MsgBox, Error getElementColor1920_1080 : elementName :%elementName%: doesn't exist
    }
    Return color
}


getSpellColor1920_1080(spell){

    ; Janna
    if(spell = "jannaQ"){
        color := 0xB4B5B4
    }
    else if(spell = "jannaZ"){
        color := 0xDCDFAE
    }
    else if(spell = "jannaE"){
        color := 0x4292BD
    }
    else if(spell = "jannaR"){
        color := 0x15111B
    }

    ; Lee
    else if(spell = "leeQ"){
        color := 0x2A8CB2
    }
    else if(spell = "leeZ"){
        color := 0xDDD776
    }
    else if(spell = "leeE"){
        color := 0x583A2C
    }
    else if(spell = "leeR"){
        color := 0x5D1205
    }
    
    ; Lulu
    else if(spell = "luluQ"){
        color := 0xF792FF
    }
    else if(spell = "luluZ"){
        color := 0xACF3D5
    }
    else if(spell = "luluE"){
        color := 0x3C2258
    }
    else if(spell = "luluR"){
        color := 0x7BA683
    }

    ; Yuumi
    else if(spell = "yuumiQ"){
        color := 0xF1B023
    }
    else if(spell = "yuumiZ"){
        color := 0xA2679F
    }
    else if(spell = "yuumiZZ"){
        color := 0x89879A
    }
    else if(spell = "yuumiE"){
        color := 0xF7FF8C
    }
    else if(spell = "yuumiR"){
        color := 0x8F3BB0
    }

    ; Nami
    else if(spell = "namiQ"){
        color := 0x031AE1
    }
    else if(spell = "namiZ"){
        color := 0x085FE7
    }
    else if(spell = "namiE"){
        color := 0x007DF7
    }
    else if(spell = "namiR"){
        color := 0x04159E
    }

    ;Ivern
    else if(spell = "ivernQ"){
        color := 0x787104
    }
    else if(spell = "ivernZ"){
        color := 0x6BA225
    }
    else if(spell = "ivernE"){
        color := 0x798801
    }
    else if(spell = "ivernR"){
        color := 0xC5B5AF
    }


    ; Summoners 
    else if(spell = "D_flash"){
        color := 0x4A5824
    }
    else if(spell = "F_flash"){
        color := 0x394D21
    }
    else if(spell = "D_heal"){
        color := 0x3E1F13
    }
    else if(spell = "F_heal"){
        color := 0x080400
    }
    else if(spell = "D_exaust"){
        color := 0x180C08
    }
    else if(spell = "F_exaust"){
        color := 0x211808
    }
    else if(spell = "D_smite"){
        color := 0xF2C74D
    }
    else if(spell = "F_smite"){
        color := 0xF1E69A
    }
    else{
      MsgBox, Error getSpellColor1920_1080 : unknow spell %spell%
    }



    Return color
}


getSkillColorInfo1920_1080(){
  spell1 := getElementColor1920_1080("Q")
  spell2 := getElementColor1920_1080("Z")
  spell3 := getElementColor1920_1080("E")
  spell4 := getElementColor1920_1080("R")
  MsgBox, Q : %spell1% `n Z : %spell2% `n E : %spell3% `n R : %spell4%
}

getSumsColorInfo1920_1080(){
  spell1 := getElementColor1920_1080("D")
  spell2 := getElementColor1920_1080("F")
  MsgBox, D : %spell1% `n F : %spell2%
}

;^y::
;    getSumsColorInfo1920_1080()

;^i::
;    getSkillColorInfo1920_1080()