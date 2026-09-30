function pkgcacheclear --description 'Interactively clear pacman/AUR caches'

    # --- Helper functions (private, prefixed so they don't pollute the global function namespace) ---
    function _pkgcacheclear_prompt --description 'Prompt y/n then run a named function with the given args'
        set -l prompt $argv[1]
        set -l fn $argv[2]
        set -l success_msg $argv[3]
        set -l fn_args $argv[4..-1]

        # Read has a special way to set its color, gotta do it inlined like this
        # otherwise it ignores it and comes out as normal color
        read -l -P (set_color --bold blue)":: $prompt [Y/n] "(set_color normal) answer
        set -l read_status $status

        # Exit out early
        if test $read_status -ne 0
            return 1
        end

        # Answer handling
        switch (string lower -- "$answer")
            case '' y yes
                set_color green
                echo "$success_msg..."
                set_color normal
                if not $fn $fn_args
                    set_color red
                    echo "Command failed. Exiting."
                    set_color normal
                    return 1
                end
            case n no
                set_color red
                echo "skipped..."
                set_color normal
            case '*'
                set_color red
                echo "Invalid input. Please enter y, n, or press enter for yes."
                set_color normal
                _pkgcacheclear_prompt $prompt $fn $success_msg $fn_args
        end
    end

    function _pkgcacheclear_clean_pacman_cache
        set -l dir $argv[1]
        if test -d $dir
            sudo fd . "$dir" --max-depth 1 --exec rm -rf {} +
        end
    end

    function _pkgcacheclear_clean_sync_db
        sudo pacman -Sc --noconfirm &>/dev/null
    end

    function _pkgcacheclear_rm_contents
        set -l dir $argv[1]
        if test -d $dir
            fd . "$dir" --max-depth 1 --exec rm -rf {} +
        end
    end

    function _pkgcacheclear_clean_yay
        fd . "$argv[1]" --type d --exec rm -rf {} +
    end
    # --------------------------------------------------------------------------------------------------

    # Directories
    set -l pacman_cache /var/cache/pacman/pkg/
    set -l db_dir /var/lib/pacman/
    set -l clone_dir $HOME/.cache/paru/clone/
    set -l diff_dir $HOME/.cache/paru/diff/
    set -l yay_dir $HOME/.cache/yay/

    # Prompts
    echo "Cache directory: $pacman_cache"
    _pkgcacheclear_prompt "Do you want to remove all packages from cache?" _pkgcacheclear_clean_pacman_cache "removing all packages from cache" $pacman_cache; or return 1

    echo "Database directory: $db_dir"
    _pkgcacheclear_prompt "Do you want to remove unused repositories?" _pkgcacheclear_clean_sync_db "removing unused sync repositories"; or return 1

    echo "Clone Directory: $clone_dir"
    _pkgcacheclear_prompt "Do you want to clean all AUR packages from paru cache?" _pkgcacheclear_rm_contents "cleaning all AUR packages from paru cache" $clone_dir; or return 1

    echo "Diff Directory: $diff_dir"
    _pkgcacheclear_prompt "Do you want to remove all saved paru diffs?" _pkgcacheclear_rm_contents "removing all saved paru diffs" $diff_dir; or return 1

    echo "Yay Directory: $yay_dir"
    _pkgcacheclear_prompt "Do you want to remove all cached yay packages?" _pkgcacheclear_clean_yay "removing all cached yay packages" $yay_dir; or return 1

    echo "Done"
    read -l -P "Press enter to exit "
end
