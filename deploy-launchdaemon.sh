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
        <string>/Users/Shared/script</string>
        <string>-notification</string>
        <string>com.apple.KerberosPlugin.InternalNetworkAvailable</string>
        <string>-action</string>
        <string>/Users/Shared/script</string> 
    </array>
</dict>
</plist>
EOF

chmod 644 /Library/LaunchDaemons/com.pretendco.sso-verify.plist
chown root:wheel /Library/LaunchDaemons/com.pretendco.sso-verify.plist

/bin/launchctl load /Library/LaunchDaemons/com.pretendco.sso-verify.plist
