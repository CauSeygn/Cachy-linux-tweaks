function printtime --on-event fish_postexec
    switch $argv[1]
        case clear help exit fastfetch reboot sync
            return
    end
    set -l cmd_status $status
    test -n "$CMD_DURATION" || return
    test $cmd_status -eq 0 || return

    set -l ms $CMD_DURATION
    set -l total_seconds (math -s0 "$ms / 1000")

    set -l s  (math -s0 "$total_seconds % 60")
    set -l m  (math -s0 "$total_seconds / 60 % 60")
    set -l h  (math -s0 "$total_seconds / 3600")

    set -l parts

    # Determine if each component should be shown
    set -l show_h 0
    set -l show_m 0
    set -l show_s 0

    # Hours: show if > 0
    if test $h -gt 0
        set show_h 1
    end

    # Minutes: show if > 0
    if test $m -gt 0
        set show_m 1
    end

    # Seconds: show if > 0, OR if everything is 0
    if test $s -gt 0
        set show_s 1
    else if test $h -eq 0 -a $m -eq 0 -a $s -eq 0
        set show_s 1
    end

    # Build output
    if test $show_h -eq 1
        set -a parts "$h"h
    end

    if test $show_m -eq 1
        if test $show_h -eq 1
            set -a parts (printf "%02d" $m)m
        else
            set -a parts "$m"m
        end
    end

    if test $show_s -eq 1
        if test $show_h -eq 1 -o $show_m -eq 1
            set -a parts (printf "%02d" $s)s
        else
            set -a parts "$s"s
        end
    end

    # Now echo only if parts exist
    if set -q parts
        set -l colors 27F9B5 FF0000 FF6B6B FF99CC FF66CC FF9900 FFCC99 F7DC6F F2C464 33CC33 66CC66 0000FF 0047FF 008080 800080 FFA07A
        set -l random_index (random 1 1 16)
        set -l random_color $colors[$random_index]
        set_color $random_color
        echo -e "\n\n  ~"(string join " " $parts)
    end
end