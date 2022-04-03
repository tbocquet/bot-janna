;***********************Boutique*********************************

#Include fonctionCharSpec.ahk
#Include fileReader.ahk
#Include core.ahk

ouvrirBoutique(){
  Send, {p down}
  Sleep, 50
  Send, {p up}
  Return
}

fermerBoutique(){
  Send, {Esc down}
  Sleep, 50
  Send, {Esc up}
  Return
}

buyItem(item){
	ouvrirBoutique()
	ctrlTouche("l")
  mySend(item)
	Sleep,100
	pressEnter()
	Sleep,100
;	pressEnter() ; Correction dégueulasse d'un ancien bug
;	Sleep,100
	fermerBoutique()
  Sleep,100
	Return
}

slotVide(num){
  if (num = 1){
    color := getElementColor("item1")
  }
  if (num = 2){
    color := getElementColor("item2")
  }
  if (num = 3){
    color := getElementColor("item3")
  }
  if (num = 4){
    color := getElementColor("ward")
  }
  if (num = 5){
    color := getElementColor("item4")
  }
  if (num = 6){
    color := getElementColor("item5")
  }
  if (num = 7){
    color := getElementColor("item6")
  }
  Return (color = getElementColor("emptyItemSlotPixColor"))
}


itemBuyer(){
  Sleep, 100
  if (slotVide(1)){
    myItem := getItemNameFromFile(1)
    buyItem(myItem)
  }
  else if (slotVide(2)){
    myItem := getItemNameFromFile(2)
    buyItem(myItem)
  }
  else if (slotVide(3)){
    myItem := getItemNameFromFile(3)
    buyItem(myItem)
  }
  else if (slotVide(5)){
    myItem := getItemNameFromFile(4)
    buyItem(myItem)
  }
  else if (slotVide(6)){
    myItem := getItemNameFromFile(5)
    buyItem(myItem)
  }
  else if (slotVide(7)){
    myItem := getItemNameFromFile(6)
    buyItem(myItem)
  }
  Return
}

;^o::
;  itemBuyer()