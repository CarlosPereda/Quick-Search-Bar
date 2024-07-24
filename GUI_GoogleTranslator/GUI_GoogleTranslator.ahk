; ======================================================================================================================
; Author:           CarlosPereda
; Repository:       https://github.com/CarlosPereda/Quick-Search-Bar
; Class:            GuiGoogleTraslate()
; Execution-Notes:  Bound to F4 / Can be executed directly
; Tested with:      AHK 2.0.11 (x64)
; Tested on:        Win 10 Home (x64)
; License:          You can use this software freely as long as you mention the author
; Notes:            Images of icons provided are not my property and they belong to their respective companies
; Limitations:      -Tooltip location is different in screens with diff resolution
; ======================================================================================================================
; This software is provided 'as-is', without any express or implied warranty.
; In no event will the authors be held liable for any damages arising from the use of this software.
; ======================================================================================================================

#Requires AutoHotkey v2.0
#Include "%A_LineFile%"
#Include ..\GUI_AbstractClasses\GUI_SearchAbstractClass.ahk
#Include ..\include\Functions.ahk
#Include ..\include\EnumeratedMap.ahk

Global gui_translate_mode := 0
Class GuiGoogleTraslate extends GuiSearchAbstract{
    __New(is_search_highlighted_on := true){
        super.__New("Google Translate GUI", "Google_Translate.png", "Search", "https://translate.google.com/?sl=en&tl=es&text=", is_search_highlighted_on)
        ; this.translate_mode := 0
        this.translate_mode_map := EnumeratedMap(
            "Eng To Spa", "https://translate.google.com/?sl=en&tl=es&text=",
            "Spa To Eng", "https://translate.google.com/?sl=es&tl=en&text="
            )

        this.placeholder_text := this.translate_mode_map.selectKey(gui_translate_mode)      
        this.current_path := RegExReplace(A_LineFile, "[^\\]*$", "")
    }

    set_custom_events(){
        this.OnEvent("ContextMenu", this.change_translate_mode.bind(ObjPtr(this)))
    }

    change_translate_mode(mode_index_ref, *){ ; https://www.autohotkey.com/docs/v2/Variables.htm#ref    
        this := ObjFromPtrAddRef(this)
        Global gui_translate_mode
        gui_translate_mode++
        this.placeholder_text := this.translate_mode_map.selectKey(gui_translate_mode)
        this.link := this.translate_mode_map[this.placeholder_text]

        ; https://www.autohotkey.com/docs/v2/lib/Object.htm#DefineProp
        this.DefineProp 'aux_show_translate_mode_tooltip', {call: this.show_translate_mode_tooltip.bind(ObjPtr(this))} 
        this.aux_show_translate_mode_tooltip()
        
        this.DefineProp 'aux_update_text_control', {call: this.update_text_control.bind(ObjPtr(this))}
        this.aux_update_text_control()
    }

    show_translate_mode_tooltip(*){
        this := ObjFromPtrAddRef(this)
        this.GetPos(&x,&y)
        ToolTip this.placeholder_text, 300, 120
        SetTimer () => ToolTip(), -2000
    }
}


If (A_ScriptFullPath == A_LineFile){
    GuiGoogleTraslate(false).execute()
}


#HotIf WinActive("Google Translate GUI")
TAB::{ ; Activate ContextMenu Event change_translate_mode()
    HWND := (WinExist("Google Translate GUI"))
    ControlClick HWND, "Google Translate GUI",, "R"
}
#HotIf  