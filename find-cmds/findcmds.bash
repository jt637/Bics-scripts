#!/usr/bin/env bash
# cd Stack management
#
#
# inspired by http://www.derekwyatt.org/2011/08/18/my-bash-directory-management/
#
# Author: Justin Tornetta
# License: MIT

fopen() {
    vim "$(find . | fzf --preview 'cat {}')"
}
