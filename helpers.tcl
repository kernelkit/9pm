package provide 9pm::helpers 1.0

# Get and return the current time in human readable form
proc get_time {} {
    return [clock format [clock seconds] -format {%Y %m %d - %H:%M:%S}]
}

# Get and return the current unix time-stamp
proc get_unix_time {} {
    return [clock format [clock seconds] -format {%s}]
}

# Return a random number between 0 and <max>
proc get_rand_int {max} {
    return [expr int(rand()*$max)]
}

# Return a random string with length <length>
proc get_rand_str {length} {
    return [subst [string repeat {[format %c [expr {97 + int(rand() * 26)}]]} $length]]
}

# This gets the path of the running script
proc get_running_script_path {} {
    return [file dirname [info script]]
}

# This gets the running scripts name
proc get_running_script_name {} {
    return [lindex [split [info script] "/"] [expr [llength [split [info script] "/"]] -1]]
}

# Get the called script path
proc get_script_path {} {
    global argv0
    set old_pwd [pwd]
    cd [file dirname $argv0]
    set script_path [pwd]
    cd $old_pwd
    return $script_path
}

# Get the called script name
proc get_script_name {} {
    global argv0
    return [lindex [split $argv0 "/"] [expr [llength [split $argv0 "/"]] -1]]
}

# Get full path (from a relative path)
proc get_full_path {path} {
    set old_pwd [pwd]
    cd $path
    set full_path [pwd]
    cd $old_pwd
    return $full_path
}

# This will prepend a path to a list of files
proc prepend_path {path filelist} {
    foreach elem $filelist {
        lappend result [file join $path $elem]
    }
    return $result
}