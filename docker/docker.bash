#!/usr/bin/env bash
# cd Stack management
#
# You `cd` around like you normally would, and the directories are pushed
# into a stack.  Use the function `s` to view the stack of directories,
# and run `s $num` to `cd` into the directory listed.
#
# inspired by http://www.derekwyatt.org/2011/08/18/my-bash-directory-management/
#
# Author: Dave Eddy <dave@daveeddy.com>
# License: MIT

dcp() {
    local test=false
    local remove=false

    # Parse options
    while getopts ":t" opt; do
        case $opt in
            t)
                test=true
                ;;
            rm)
                remove=true
                ;;

            \?)
                echo "Invalid option: -$OPTARG" >&2
                return 1
                ;;
        esac
    done
    shift $((OPTIND -1))

    # Select image with fzf
    local image=$(docker image ls --format '{{.Repository}}:{{.Tag}}' | fzf)

    # If user pressed ESC or nothing selected
    [ -z "$image" ] && return 1

    echo "Selected image: $image"

    if $do_something; then
        echo "Doing something with $image..."
        docker run -it --rm $image bash
    fi
}
