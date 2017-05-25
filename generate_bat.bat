
@ECHO OFF
::Set batch name
SET /P name_batch="Name batch: "
::Find in files
FIND "Certify.exe" *.txt > out.txt

::Generete batch
ECHO @ECHO OFF > batch.bat
ECHO SET /P user="Username: " >> batch.bat
ECHO SET /P pass="Password: " >> batch.bat
FIND "Certify.exe" out.txt >> batch.bat
DEL out.txt

::Clear file
setLocal EnableDelayedExpansion
FOR /f "tokens=* delims= " %%a IN (batch.bat) DO (
SET str=%%a
SET str=!str:---------- OUT.TXT=::Batch Generete!
SET str=!str:%%1=%%user%%!
SET str=!str:%%2=%%pass%%!
ECHO !str!>>"%name_batch%"
)
ENDLOCAL
DEL batch.bat

ECHO PAUSE >>"%name_batch%"
PAUSE
