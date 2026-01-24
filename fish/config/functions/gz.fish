# Get gzipped size
function gz
    if test (count $argv) -eq 0
        echo "Usage: gz <file>"
        return 1
    end

    echo "orig size    (bytes): "
    cat "$argv[1]" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$argv[1]" | wc -c
end
