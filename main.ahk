#Requires AutoHotkey v2.0

#Include .\GUI_GoogleSearch\GUI_GoogleSearch.ahk
#Include .\GUI_GoogleMaps\GUI_GoogleMaps.ahk
#Include .\GUI_LongmanDictionary\GUI_LongmanDictionary.ahk
#Include .\GUI_GoogleTranslator\GUI_GoogleTranslator.ahk

;;;;;;;;;;;;;;; HotKeys ;;;;;;;;;;;;;;;;
F1::GuiGoogleSearch().execute()
+F2::GuiGoogleMaps().execute()
F3::GuiLongmanDictionary().execute()
F4::GuiGoogleTraslate().execute()