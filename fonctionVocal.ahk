#Include fonctionCharSpec.ahk

vocalLowHp(curseur){
  if(curseur == 0){
    messagesChat("OniChan, I feel strange","I think my hp are a bit too low ","Fueh")
  }
  else if(curseur == 1){
    messagesChat("Bazu iku yo ! :3")
  }
  else if(curseur == 2){
    messagesChat("OniChan I'll look for restore my hp","Gomenasai")
  }
  Return
}

vocalLowMana(curseur){
  if(curseur == 0){
      messagesChat("Sry OniChan, I am low mana I have to back")
  }
  else if(curseur == 1){
    messagesChat("I'll go to restore my magic point !")
  }
  else if(curseur == 2){
    messagesChat("I already used my EXPLOSION today,","OniChan can you carry me back to the base ? :3")
  }
  else if(curseur == 3){
    messagesChat("Pfff I imagine you don't have something to restore my mana or other so i back")
    messagesChat("OniChan no baaaka !")
  }
  Return
}

vocalAlieDied(curseur){
  if(curseur == 0){
    messagesChat("OniChan !","Nooooooooooooooo!")
  }
  else if(curseur == 1){
    messagesChat("Sry OniChan, I was to weak to save you")

  }
  else if(curseur == 2){
    messagesChat("next time I'll save you for sure !","Yakusoku da !")
  }
  else if(curseur == 3){
    messagesChat("OniChan ! Could you stop to feed enemies ?!")

  }
  else if(curseur == 4){
    messagesChat("OniChan no baaaaka !")

  }
  else if(curseur == 5){
    messagesChat("Shall I change of OniChan ?")
  }
  Return
}

vocalBotDied(curseur){
  if(curseur == 0){
    messagesChat("Oh no.","I was too cute for this world...")
  }
  else if(curseur == 1){
    messagesChat("MAIS AIDE MOI BORDEL !!")

  }
  else if(curseur == 2){
    messagesChat("Report adc pls !")
  }
  else if(curseur == 3){
    messagesChat("OniChan ! Could you stop to feed enemies ?!")

  }
  else if(curseur == 4){
    messagesChat("OniChan no baaaaka !")

  }
  else if(curseur == 5){
    messagesChat("Shall I change of OniChan ?")
  }
  Return
}

messagesChat(all_mess*) {
    for i, mess in all_mess {
        pressEnter()
        ;Send, {Raw}%mess%
        mySend(mess)
        pressEnter()
    }
    Return
}