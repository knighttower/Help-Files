
_program(program:="", cmd:="") {
    if (program <> "") { 
        if (FileExist(program)) {
            Run %program%  %cmd%
        }
        else {
            MsgBox, 16, Error, opening program
        }
    }
}



openFirefox(url:="https://google.com",desktop:=1,x:=0,y:=0,max :=0){
    
    ;SwitchToDesktop(2)
    _program("C:\Program Files\Firefox Developer Edition\firefox.exe",url)
    Sleep 1000
    
    WinActivate, ahk_class Firefox
    WinWait, Firefox
    WinMove, x, y
        

    ;winID := _GetCurrentWindowID() 
   /*  WinSetTitle, %setId%, "firefox"
    WinGetTitle, Title, A
    ;MsgBox, The active window is "%Title%".
    ;WinActivate, winID
    WinMove, %setId%, x, y */
      
        /* 
        if(max == 1){
             WinMaximize, class
        }else{
            WinMove, class, , , , 1080, 1440
        }
        MoveAndSwitchToDesktop(desktop) 
        */
    
    Return

}

openChrome(url:="https://google.com",params=""){
     

    _program("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",url)
    

    winclass := params[winclass]
    WinActivate, ahk_class %winclass%
    WinWait, %winclass%
    WinMove, params[x], params[y]
    if(params[full]){
        WinMaximize, %winclass%
    }
    WinGetTitle, Title, A
    newText = %winclass%
    WinSetTitle, %Title%, newText, newText
    
    MsgBox, The active window is "%Title%".
    
    Return

}


devDesktop(){
    ;openFirefox("https://google.com",1,1920,300,1)
    ;Sleep 1000
    
    params1 := []
    params1[x] = 1920
    params1[y] = 0
    params1[full] = 0
    params1[winclass] := "Gmail"
    openChrome("https://mail.google.com",params1)
  
    params2 := []
    params2[x] = 0
    params2[y] = 0
    params2[winclass] := "Outlook"
    openChrome("https://outlook.com",params2)
}

scheduleDesktop(){
    
    SwitchToDesktop(2)
    ;openFirefox("https://google.com",1,1920,300,1)
    ;Sleep 1000
    
    params1 := []
    params1[x] = 1920
    params1[y] = 0
    params1[full] = 0
    params1[winclass] := "Gmail"
    openChrome("https://mail.google.com",params1)
  
    params2 := []
    params2[x] = 0
    params2[y] = 0
    params2[winclass] := "Outlook"
    openChrome("https://outlook.com",params2)
    
}

doSetup(){
   devDesktop()
   Sleep 2000
   scheduleDesktop()
}
doSetup()