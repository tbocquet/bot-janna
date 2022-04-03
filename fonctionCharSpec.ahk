sendChar(mychar){
  if(mychar = " "){
    Send, {space}
  }
  else{
    Send, {%mychar% down}
    Sleep, 30
    Send, {%mychar% up}
  }
  Return
}

ctrlTouche(touche){
	Send, {Ctrl Down}%touche%
	Sleep, 50
	Send, {Ctrl Up}
	Return
}

pressEnter(){
  Sleep, 100
  Send, {enter down}
  Sleep, 100
  Send, {enter up}
  Sleep, 100
  Return
}

openChatAll(){
  Send, +{enter}
  Sleep, 50
}

mySend(MyString){
  nbchar := StrLen(MyString)
  compteur := 1
  while(compteur <= nbchar){
    sendChar(Substr(MyString, compteur , 1))
    compteur := compteur + 1
  }
  Return
}