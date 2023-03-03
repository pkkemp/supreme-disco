#!/bin/bash

cat << EOF > /Library/LaunchDaemons/com.pretendco.sso-verify.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    </true>
    <key>Label</key>
    <string>com.pretendco.sso-verify</string>
    <key>RunAtLoad</key>
    <true/>
    <key>ProgramArguments</key> 
    <array>
    <string><—-replace with path to sample distributed notification script—-></string>
    <string>-notification</string>
    <string><—-replace with notification name—-></string>
    <string>-action</string>
    <string><—-replace with path to script to execute when notification is posted—-></string> 
    </array>
</dict>
</plist>
EOF

chmod 644 /Library/LaunchDaemons/com.pretendco.sso-verify.plist
chown root:wheel /Library/LaunchDaemons/com.pretendco.sso-verify.plist

/bin/launchctl load /Library/LaunchDaemons/com.pretendco.sso-verify.plist
