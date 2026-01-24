# Animated gifs from any video
# from alex sexton   gist.github.com/SlexAxton/4989674
function gifify
    if test (count $argv) -eq 0
        echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
        return 1
    end

    if not type -q ffmpeg
        echo "Error: ffmpeg is required. Install it with: brew install ffmpeg"
        return 1
    end

    if not type -q gifsicle
        echo "Error: gifsicle is required. Install it with: brew install gifsicle"
        return 1
    end

    if test "$argv[2]" = "--good"
        if not type -q convert
            echo "Error: ImageMagick is required for --good option. Install it with: brew install imagemagick"
            return 1
        end
        ffmpeg -i "$argv[1]" -r 10 -vcodec png out-static-%05d.png
        convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > "$argv[1].gif"
        rm out-static*.png
    else
        ffmpeg -i "$argv[1]" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$argv[1].gif"
    end

    echo "Created: $argv[1].gif"
end
