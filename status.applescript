set camerastatus to "camera_off"
set postCurlStart to "curl -X POST maker.ifttt.com/trigger/"
set postCurlEnd to "/with/key/"
set postKey to 

repeat
  delay 1
  if (((do shell script "ioreg -l | grep 0x100097f1a | awk '{print $23}'") as string) is equal to "6>") then
    set status to "camera_off"
  else
    set status to "camera_on"
  end if
  
  set theContent to status
  
  if (camerastatus is not equal to status) then
    set camerastatus to status
    set postURLCommand to postCurlStart & status & postCurlEnd & postKey
    do shell script postURLCommand
  end if
  
  --  tell application "Messages"
  --    send (theContent as string) to buddy "4157671641" of service "SMS"
  --  end tell
end repeat