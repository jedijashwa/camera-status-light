if (((do shell script "ioreg -l | grep 0x100097f1a | awk '{print $23}'") as string) is equal to "6>") then
  set status to "camera off"
else
  set status to "camera on"
end if

set theContent to status

tell application "Messages"
  send (theContent as string) to buddy "4157671641" of service "SMS"
end tell
