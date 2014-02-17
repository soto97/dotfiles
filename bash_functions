
# qfind - used to quickly find files that contain a string in a directory
qfind () {
    find . -exec grep -l --no-messages $1 {} \;
    return 0
}

