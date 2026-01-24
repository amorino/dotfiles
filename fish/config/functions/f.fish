# Find shorthand
function f
    find . -name "$argv[1]" 2>&1 | grep -v 'Permission denied'
end
