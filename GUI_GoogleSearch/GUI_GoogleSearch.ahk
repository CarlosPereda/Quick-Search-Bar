; ======================================================================================================================
; Author:           CarlosPereda
; Repository:       https://github.com/CarlosPereda/Quick-Search-Bar
; Class:            GuiGoogleSearch()
; Execution-Notes:  Bound to F1 / Can be executed directly
; Tested with:      AHK 2.0.11 (x64)
; Tested on:        Win 10 Home (x64)
; License:          You can use this software freely as long as you mention the author
; Notes:            Images of icons provided are not my property and they belong to their respective companies
; ======================================================================================================================
; This software is provided 'as-is', without any express or implied warranty.
; In no event will the author be held liable for any damages arising from the use of this software.
; ======================================================================================================================

#Requires AutoHotkey v2.0
#Include "%A_LineFile%"
#Include ..\GUI_AbstractClasses\GUI_SearchAbstractClass.ahk
#Include ..\include\Functions.ahk

Class GuiGoogleSearch extends GuiSearchAbstract{
    __New(is_search_highlighted_on := true){
        super.__New("Google Search GUI", "GoogleIcon.png", "Search", "https://www.google.com/search?q=", is_search_highlighted_on)
        this.current_path := RegExReplace(A_LineFile, "[^\\]*$", "")
    }
    
    search_highlighted_text(){
        highlightedText := LTrim(get_highlighted_text())
        
        if highlightedText {
            if (SubStr(highlightedText, 2 , 1) == ":"){ ; Prevents from searching local computer files or folders
                return
            }
            
            if (SubStr(highlightedText, 1 , 8) == "https://" or SubStr(highlightedText, 4 , -5) == ".com") { ; if it starts with "https://" go to, rather than search in google search
                Run(highlightedText)
                Exit
            }
            
            Run(this.link . highlightedText)
            Exit
        }
    }
    
    click_search_button(*){
        this := ObjFromPtrAddRef(this)
        if (SubStr(this.edit_control.value, -4, 4) == ".com"){
            Run("https://" this.edit_control.value)
        } else {
            Run(this.link . this.edit_control.value)
        }
        
        this.close_gui()
    }
    
}


If (A_ScriptFullPath == A_LineFile){    
    GuiGoogleSearch(false).execute()
}