getDataFromConfigFileLine(line){
    mySplit := StrSplit(line, ".")
    Return, mySplit[2]
}

;^u::
;    value := getLineFromConfigFile(5)
;    MsgBox, data : %value%
;    Return

getLineFromConfigFile(lineNumber){
    FileRead, Contents, botConfig.txt
    if not ErrorLevel  ; Successfully loaded.
    {
        allLines := StrSplit(Contents, "`n")
        line := allLines[lineNumber]
        data := getDataFromConfigFileLine(line)
        Return, data
    }
    else{
        Return, "error"
    }
}
getSpellOrderFromConfigFile(){
    Return, getLineFromConfigFile(6)
}

getManaFromConfigFile(){
    Return, getLineFromConfigFile(7)
}

getChampionFromConfigFile(){
    Return, getLineFromConfigFile(8)
}

getScreenResolutionFromConfigFile(){
    Return, getLineFromConfigFile(9)
}

getItemNameFromFile(slot){
    itemLine := getLineFromConfigFile(10)
    allItems := StrSplit(itemLine, ",")
    Return, allItems[slot]
}

;^u::
;    side := getSideFromConfigFile()
;    spellorder := getSpellOrderFromConfigFile()
;    item := getItemNameFromFile(1)
;    mana := getManaFromConfigFile()
;    champion := getChampionFromConfigFile()
;    screen := getScreenResolutionFromConfigFile()
;    MsgBox, Side : %side%  spellorder : %spellorder%  item1 : %item%   mana : %mana%   champion :%champion%  screen :%screen%