if (((do shell script "ioreg -l | grep 0x100097f1a | awk '{print $23}'") as string) is equal to "6>") then
  set status to "camera_off"
else
  set status to "camera_on"
end if

set theContent to status

set camerastatus to status
set postURL to "curl -X POST maker.ifttt.com/trigger/" & status & "/with/key/KEY"
do shell script postURL

tell application "Messages"
  send (theContent as string) to buddy "4157671641" of service "SMS"
end tell
