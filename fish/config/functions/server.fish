# Start an HTTP server from a directory, optionally specifying the port
function server
    set -l port 8000
    if test (count $argv) -gt 0
        set port $argv[1]
    end

    open "http://localhost:$port/" &

    # Try different servers in order of preference
    if type -q statik
        # statik is good because it won't expose hidden folders/files by default.
        # npm install -g statik
        statik --port $port .
    else if type -q python3
        python3 -m http.server $port
    else if type -q python
        python -m SimpleHTTPServer $port
    else
        echo "No HTTP server found. Install statik, python3, or python."
        return 1
    end
end
