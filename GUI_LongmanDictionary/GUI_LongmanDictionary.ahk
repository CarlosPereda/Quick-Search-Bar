; ======================================================================================================================
; Author:           CarlosPereda
; Repository:       https://github.com/CarlosPereda/Quick-Search-Bar
; Class:            GuiLongmanDictionary()
; Execution-Notes:  Bound to F3 / Can be executed directly
; Tested with:      AHK 2.0.11 (x64)
; Tested on:        Win 10 Home (x64)
; License:          You can use this software freely as long as you mention the author
; Notes:            Images of icons provided are not my property and they belong to their respective companies
; ======================================================================================================================
; This software is provided 'as-is', without any express or implied warranty.
; In no event will the authors be held liable for any damages arising from the use of this software.
; ======================================================================================================================

#Requires AutoHotkey v2.0
#Include "%A_LineFile%"
#Include ..\GUI_AbstractClasses\GUI_SearchAbstractClass.ahk
#Include ..\include\Functions.ahk

Class GuiLongmanDictionary extends GuiSearchAbstract{
    __New(is_search_highlighted_on := true){
        super.__New("Longman Dictionary GUI", "longman.png", "Search", "https://www.ldoceonline.com/dictionary/", is_search_highlighted_on)
        this.current_path := RegExReplace(A_LineFile, "[^\\]*$", "")
    }

    SearchHighlightedText(){
        highlightedText := get_highlighted_text()
    
        if highlightedText {
            Run(this.link . highlightedText)
            Exit
        }
    }
}

If (A_ScriptFullPath == A_LineFile){
    GuiLongmanDictionary(false).execute()
}