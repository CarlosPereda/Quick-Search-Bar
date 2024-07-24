; ======================================================================================================================
; Author:           CarlosPereda
; Repository:       https://github.com/CarlosPereda/Quick-Search-Bar
; Class:            GuiSearchAbstract()
; Execution-Notes:  None / This class is meant to be inherited
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
#Include ..\include\Functions.ahk

Class GuiSearchAbstract extends Gui{
    __New(window_title, icon_file, placeholder_text, link, is_search_highlighted_on := true){
        super.__New("-Caption AlwaysOnTop", window_title)
        this.window_title := window_title
        this.icon_file := icon_file
        this.placeholder_text := placeholder_text
        this.link := link
        this.is_search_highlighted_on := is_search_highlighted_on
        this.current_path := RegExReplace(A_LineFile, "[^\\]*$", "")
        this.icon_width := " w64"
        this.icon_x_pos := "14"
        this.icon_y_pos := "14"

        ; Prevent multiple windows active
        if (WinExist(this.window_title))
            exit
    }

    draw_gui(){
        this.BackColor := "2a2a2b"
        this.setFont("s32 c555555", "Consolas")
        this.Opt("+OwnDialogs") ; https://www.autohotkey.com/docs/v1/lib/ToolTip.htm#Remarks
        WinSetTransColor("2a2a2b", this)

        this.Add("Picture", "w600 h90 ", this.current_path . "background.png")
        
        this.Add("Picture", "xs+14 ys+14 h64 BackgroundTrans" . " xs+" . this.icon_x_pos . " ys+" . this.icon_y_pos . this.icon_width, this.current_path . this.icon_file) 
        
        this.text_control := this.Add("Text", "xs+90 ys+18 w504 r1  BackgroundTrans", this.placeholder_text)
        this.edit_control := this.Add("Edit", "xs0 ys0 w0 r1")
        this.search_button := this.Add("Button", "hidden default", "[Hidden]")
        
        GroupAdd "SearchGUIGroup", this.window_title
        
        this.set_default_events()
        this.set_custom_events()
        this.move_windows_with_mouse()

        this.show()
    }


    set_default_events(){
        this.edit_control.OnEvent("Change", this.update_text_control.bind(ObjPtr(this)))
        this.edit_control.OnEvent("Focus", this.blink_caret.bind(ObjPtr(this)))
        this.edit_control.OnEvent("LoseFocus", this.hide_caret.bind(ObjPtr(this)))
        this.search_button.OnEvent("Click", this.click_search_button.bind(ObjPtr(this)))
        this.OnEvent("Escape", this.close_gui)
    }


    set_custom_events(){
        ; Body intentionally empty. 
        ; Custom events are meant to be implemented in a subclass but they are not mandatory
    }


    update_text_control(*){
        this := ObjFromPtrAddRef(this)
        if (StrLen(this.edit_control.value) >= 20){
            this.text_control.Opt("cffffff")
            this.text_control.Text := SubStr(this.edit_control.value, StrLen(this.edit_control.value)-19) . "|"
            
        } else if (StrLen(this.edit_control.value) >= 1) {
            this.text_control.Opt("cffffff")
            this.text_control.Text := this.edit_control.value . "|"
            
        }  else {
            this.text_control.Opt("c555555")
            this.text_control.Text := this.placeholder_text
        }
    }


    blink_caret(*){
        this := ObjFromPtrAddRef(this)
        While (WinActive(this.window_title)){          
            last_char := SubStr(this.text_control.Text, -1, 1)

            ; replacement is " " if last_char=="|", else replacement is "|"
            replacement := (last_char=="|") ? " " : "|" 

            ; RexExReplace text_control only if edit_control lenght >= 1
            (StrLen(this.edit_control.value) >= 1) && 
                this.text_control.Text := RegExReplace(this.text_control.Text, "\" . last_char . "$", replacement)
          sleep(500)
       }
    }


    hide_caret(*){
        this := ObjFromPtrAddRef(this)
        last_char := SubStr(this.text_control.Text, -1, 1)
        if (last_char == "|"){
           this.text_control.Text := SubStr(this.text_control.Text, 1, -1) . " "
        }
    }

    
    click_search_button(*){
        this := ObjFromPtrAddRef(this)

        Run(this.link . this.edit_control.value)
        this.close_gui()
    }


    move_windows_with_mouse(){
        OnMessage(0x201, WM_LBUTTONDOWN)
        WM_LBUTTONDOWN(*){
            PostMessage(0xA1, 2)
        }
    }

    
    execute(*){
        if (this.is_search_highlighted_on)
            this.search_highlighted_text()

        this.draw_gui()
    }


    close_gui(*){
        WinClose(this.window_title)
    }


    search_highlighted_text(){
        highlighted_text := get_highlighted_text()
    
        if highlighted_text {
            Run(this.link . highlighted_text)
            Exit
        }
    }
}

#HotIf WinActive("ahk_group SearchGUIGroup")
Left::SendInput("{BackSpace}")
LControl & Left::SendInput("{BackSpace}")
#HotIf