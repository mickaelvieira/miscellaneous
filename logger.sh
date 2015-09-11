#!/bin/bash

readonly VERBOSITY=7

readonly RESET_ALL="\e[0m"
readonly BG_RED="\e[41m"
readonly BG_BLUE="\e[44m"
readonly BG_MAGENTA="\e[45m"
readonly FG_WHITE="\e[97m"
readonly FG_RED="\e[31m"
readonly FG_BLUE="\e[34m"
readonly FG_MAGENTA="\e[35m"

# https://tools.ietf.org/html/rfc5424
# 0 Emergency: system is unusable
# 1 Alert: action must be taken immediately
# 2 Critical: critical conditions
# 3 Error: error conditions
# 4 Warning: warning conditions
# 5 Notice: normal but significant condition
# 6 Informational: informational messages
# 7 Debug: debug-level messages

emergency() { # verbosity 0,1,2,3,4,5,6,7
    echo -e "${BG_RED}${FG_WHITE}EMERGENCY${RESET_ALL}  ${FG_RED}$1${RESET_ALL}" >&2
}
alert() { # verbosity 1,2,3,4,5,6,7
    if [[ ${VERBOSITY} -gt 0 ]]; then
        echo -e "${BG_RED}${FG_WHITE}ALERT${RESET_ALL}  ${FG_RED}$1${RESET_ALL}" >&2
    fi
}
critical() { # verbosity 2,3,4,5,6,7
    if [[ ${VERBOSITY} -gt 1 ]]; then
        echo -e "${BG_RED}${FG_WHITE}CRITICAL${RESET_ALL}  ${FG_RED}$1${RESET_ALL}" >&2
    fi
}
error() { # verbosity 3,4,5,6,7
    if [[ ${VERBOSITY} -gt 2 ]]; then
        echo -e "${BG_RED}${FG_WHITE}ERROR${RESET_ALL}  ${FG_RED}$1${RESET_ALL}" >&2
    fi
}
warning() { # verbosity 4,5,6,7
    if [[ ${VERBOSITY} -gt 3 ]]; then
        echo -e "${BG_RED}${FG_WHITE}WARNING${RESET_ALL}  ${FG_RED}$1${RESET_ALL}" >&2
    fi
}
notice() { # verbosity 5,6,7
    if [[ ${VERBOSITY} -gt 4 ]]; then
        echo -e "${BG_BLUE}${FG_WHITE}NOTICE${RESET_ALL}  ${FG_BLUE}$1${RESET_ALL}"
    fi
}
info() { # verbosity 6,7
    if [[ ${VERBOSITY} -gt 5 ]]; then
        echo -e "${BG_BLUE}${FG_WHITE}INFO${RESET_ALL}  ${FG_BLUE}$1${RESET_ALL}"
    fi
}
debug() { # verbosity 7
    if [[ ${VERBOSITY} -gt 6 ]]; then
        echo -e "${BG_MAGENTA}${FG_WHITE}DEBUG${RESET_ALL}  ${FG_MAGENTA}$1${RESET_ALL}"
    fi
}

emergency "This is my emergency message!"
alert "This is my alert message!"
critical "This is my critical message!"
error "This is my error message!"
warning "This is my warning message!"
notice "This is my notice message!"
info "This is my info message!"
debug "This is my debug message!"