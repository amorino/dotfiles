# Turn that video into webm
# brew install ffmpeg --with-libvpx
function webmify
    if test (count $argv) -eq 0
        echo "Usage: webmify <input_video>"
        return 1
    end

    if not type -q ffmpeg
        echo "Error: ffmpeg is required. Install it with: brew install ffmpeg"
        return 1
    end

    set -l output "$argv[1].webm"
    if test (count $argv) -gt 1
        set output $argv[2]
    end

    ffmpeg -i "$argv[1]" -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -qmax 30 -y "$output"

    echo "Created: $output"
end
