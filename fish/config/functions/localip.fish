# Show local IP addresses for all network interfaces
function localip
    set -l purple "\x1B[35m"
    set -l reset "\x1B[m"

    networksetup -listallhardwareports | while read -l line
        # Check if line contains "Hardware Port:"
        if string match -q "Hardware Port:*" $line
            set -l port (string replace "Hardware Port: " "" $line)
            echo -e "$purple$port$reset"
        else if string match -q "Device: en*" $line
            set -l device (string replace "Device: " "" $line)
            set -l ip (ipconfig getifaddr $device 2>/dev/null)
            if test -n "$ip"
                echo "📶  $ip"
            end
        else if string match -q "Ethernet Address:*" $line
            set -l addr (string replace "Ethernet Address: " "" $line)
            echo "📘 $addr"
        end
    end
end
