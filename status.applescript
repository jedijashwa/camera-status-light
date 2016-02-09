if (((do shell script "ioreg -l | grep 0x100097f1a | awk '{print $23}'") as string) is equal to "6>") then
  set status to "camera off"
else
  set status to "camera on"
end if

set recipientName to "Josh"
set recipientAddress to "josh.riesenbach@gmail.com"
set theSubject to "Your camera's status"
set theContent to status

tell application "Mail"
  
  --Create the message
  set theMessage to make new outgoing message with properties {subject:theSubject, content:theContent, visible:true}
  
  --Set a recipient
  tell theMessage
    make new to recipient with properties {name:recipientName, address:recipientAddress}
    
    --Send the Message
    send
    
  end tell
end tell