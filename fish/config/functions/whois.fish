# Whois a domain or a URL
function whois
    if test (count $argv) -eq 0
        echo "Usage: whois <domain|url>"
        return 1
    end

    # Get domain from URL
    set -l domain (echo "$argv[1]" | awk -F/ '{print $3}')
    if test -z "$domain"
        set domain $argv[1]
    end

    echo "Getting whois record for: $domain …"

    # Use internic whois server and strip extra fluff
    /usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
end
