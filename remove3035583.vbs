Dim hideupdates(0)
hideupdates(0) = "(KB3035583)"
 
Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run "taskkill /f /im gwx.exe"
objShell.Run "wusa /uninstall /kb:3035583 /quiet /norestart"
 
set updateSession = createObject("Microsoft.Update.Session")
set updateSearcher = updateSession.CreateupdateSearcher()
 
Set searchResult = updateSearcher.Search("IsInstalled=0 and Type='Software'")
 
For i = 0 To searchResult.Updates.Count-1
set update = searchResult.Updates.Item(i)
For j = LBound(hideupdates) To UBound(hideupdates) 
'MsgBox hideupdates(j)
if instr(1, update.Title, hideupdates(j), vbTextCompare) = 0 then
  'Wscript.echo "No match found for " &amp; hideupdates(j)
else
Wscript.echo "Hiding " &amp; hideupdates(j)
update.IsHidden = True
end if
Next
Next
