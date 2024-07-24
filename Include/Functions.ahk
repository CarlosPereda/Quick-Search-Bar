#Requires AutoHotkey v2.0

get_highlighted_text(){
	ClipboardOld := A_Clipboard 
    A_Clipboard  := ""

    Send("{Ctrl down}c{Ctrl up}")
    if !ClipWait(0.08)
        selected := ""
    else
        selected := A_Clipboard

    A_Clipboard := ClipboardOld
	return selected
}