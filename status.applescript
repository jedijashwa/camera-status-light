set camerastatus to "initialize"
set postCurlStart to "curl -X POST maker.ifttt.com/trigger/"
set postCurlEnd to "/with/key/"
set postKey to ""

repeat
  --this section parses ioreg to get to proper value
  set input to (do shell script "ioreg -l")
  set text item delimiters to "FaceTime HD"
  set input to (text item 2 of input)
  set text item delimiters to "IOPowerManagement"
  set input to (text item 2 of input)
  set text item delimiters to "ChildrenPowerState"
  set input to (text item 2 of input)
  set text item delimiters to "="
  set input to (text item 2 of input)
  set text item delimiters to ","
  set input to (text item 1 of input)
  --input will equal 2 if camera is on and 1 if camera is off

  if (input is equal to "yes") then
    set status to "camera_on"
  else
    set status to "camera_off"
  end if
    
  if (camerastatus is not equal to status) then
    log status
    set camerastatus to status
    set postURLCommand to postCurlStart & status & postCurlEnd & postKey
    do shell script postURLCommand
  end if

  delay 2
end repeat