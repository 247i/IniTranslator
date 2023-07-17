@echo off
REM Change HHCPATH to point to where *you* have hhc.exe installed before running this BAT file
SET HHCPATH="F:\Program\HTML Help Workshop\hhc.exe" 
%HHCPATH% translator.hhp
copy translator.chm ..\bin\translator.chm

