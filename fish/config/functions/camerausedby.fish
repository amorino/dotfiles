# Who is using the laptop's iSight camera?
function camerausedby
    echo "Checking to see who is using the iSight camera… 📷"
    set -l usedby (lsof | grep -w "AppleCamera\|USBVDC\|iSight" | awk '{printf $2"\n"}' | xargs ps 2>/dev/null)
    if test -n "$usedby"
        echo -e "Recent camera uses:\n$usedby"
    else
        echo "No active camera usage found."
    end
end
