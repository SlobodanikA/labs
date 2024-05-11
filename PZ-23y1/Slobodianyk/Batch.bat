@echo off
md batch\public,batch\hiden
cd batch
attrib +h hiden
help xcopy > public\copyhelp.txt
xcopy /-I public\copyhelp.txt hiden\copied_copyhelp.txt