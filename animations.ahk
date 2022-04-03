#Include, fonction.ahk
#Include, core.ahk

circleAnimation(x,y,h,speed){
  moveMouse(0+x,-3*h+y)
  Sleep, 30*speed
  moveMouse(2.4*h+x,-2.4*h+y)
  Sleep, 30*speed
  moveMouse(3*h+x,0+y)
  Sleep, 30*speed
  moveMouse(2.4*h+x,2.4*h+y)
  Sleep, 30*speed
  moveMouse(0+x,-3*h+y)
  Sleep, 30*speed
  moveMouse(-2.4*h+x,2.4*h+y)
  Sleep, 30*speed
  moveMouse(-3*h+x,0+y)
  Sleep, 30*speed
  moveMouse(-2.4*h+x,-2.4*h+y)
  Sleep, 30*speed
  moveMouse(0+x,-3*h+y)
  Sleep, 30*speed
}

crossAnimation(x,y,h,speed){
  moveMouse(x,y)
  Sleep, 30*speed
  moveMouse(-2.4*h+x,-2.4*h+y)
  Sleep, 30*speed
  moveMouse(x,y)
  Sleep, 30*speed
  moveMouse(2.4*h+x,2.4*h+y)
  Sleep, 30*speed
  moveMouse(x,y)
  Sleep, 30*speed
  moveMouse(-2.4*h+x,2.4*h+y)
  Sleep, 30*speed
  moveMouse(x,y)
  Sleep, 30*speed
  moveMouse(2.4*h+x,-2.4*h+y)
  Sleep, 30*speed
  moveMouse(x,y)
  Sleep, 30*speed
}



playAnimation(nombre){
    i := 0
    while(i <= nombre){
        circleAnimation(677,374,100,1)
        i:=i+1
    }
}