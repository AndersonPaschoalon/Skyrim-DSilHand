;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_C06KodlakTravelToExtracti_001090D2 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
; Activate Wolf Spirit Extraction
SpiritWolfScript wss = (WolfSpirit as SpiritWolfScript)
wss.Extract(akActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property WolfSpirit  Auto  
