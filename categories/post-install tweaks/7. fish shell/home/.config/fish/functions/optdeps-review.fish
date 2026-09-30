function optdeps-review
    set -l cache_dir ~/.cache/optdeps-review
    mkdir -p $cache_dir
    set -l cache_file $cache_dir/snapshot.tsv
    set -l new_file (mktemp)
    set -l added_file (mktemp)
    set -l removed_file (mktemp)
    set -l fully_removed_file (mktemp)
    set -l summary_file (mktemp)
    set -l removed_block_file (mktemp)
    touch $added_file $removed_file

    # --- build current snapshot: CATEGORY\tPACKAGE\tLINE ---
    begin
        yay -Qi (yay -Qeq) | awk -v cat=EXPLICIT '
        BEGIN{RS=""; FS="\n"}
        {
          name=""
          for (i=1;i<=NF;i++) if ($i ~ /^Name *:/) { name=$i; sub(/^Name *: */,"",name) }
          printing=0
          for (i=1;i<=NF;i++) {
            line=$i
            if (line ~ /^Optional Deps/) printing=1
            if (line ~ /^Required By/)   printing=0
            if (printing) {
              l=line
              sub(/^Optional Deps *: */,"",l)
              gsub(/^ +/,"",l)
              if (l=="" || l=="None") continue
              print cat "\t" name "\t" l
            }
          }
        }'
        yay -Qi (yay -Qdq) | awk -v cat=DEPENDENCY '
        BEGIN{RS=""; FS="\n"}
        {
          name=""
          for (i=1;i<=NF;i++) if ($i ~ /^Name *:/) { name=$i; sub(/^Name *: */,"",name) }
          printing=0
          for (i=1;i<=NF;i++) {
            line=$i
            if (line ~ /^Optional Deps/) printing=1
            if (line ~ /^Required By/)   printing=0
            if (printing) {
              l=line
              sub(/^Optional Deps *: */,"",l)
              gsub(/^ +/,"",l)
              if (l=="" || l=="None") continue
              print cat "\t" name "\t" l
            }
          }
        }'
    end > $new_file

    # --- diff against cache ---
    if test -f $cache_file
        set -l old_sorted (mktemp)
        set -l new_sorted (mktemp)
        set -l changed_file (mktemp)
        sort -u $cache_file > $old_sorted
        sort -u $new_file > $new_sorted
        comm -23 $new_sorted $old_sorted > $added_file
        comm -13 $new_sorted $old_sorted > $removed_file
        cut -f1,2 $added_file $removed_file | sort -u > $changed_file

        if test -s $changed_file
            echo "¥¥ Changed since last run ¥¥" >> $summary_file
            while read -l cat pkg
                if test "$cat" = EXPLICIT
                    echo "$pkg (Explicit)" >> $summary_file
                else
                    echo "$pkg (Dependencies)" >> $summary_file
                end
            end < $changed_file
        end

        # rows belonging to a package that contributes ZERO rows to the current
        # snapshot at all -> the whole package is gone, not just one opt dep
        awk -F'\t' 'FILENAME==ARGV[1] { seen[$1"\t"$2]=1; next } !(($1"\t"$2) in seen)' $new_file $removed_file > $fully_removed_file

        rm -f $old_sorted $new_sorted $changed_file
    end

    # --- build the "fully removed package" blocks, with a live install check per line ---
    if test -s $fully_removed_file
        echo >> $summary_file
        set -l curpkg ""
        for row in (cat $fully_removed_file)
            set -l parts (string split \t -- $row)
            set -l pkg $parts[2]
            set -l line $parts[3]
            if test "$pkg" != "$curpkg"
                if test -n "$curpkg"
                    echo "" >> $removed_block_file
                end
                echo "- == $pkg ==" >> $removed_block_file
                set curpkg "$pkg"
            end
            set -l depname (string split -m1 ':' -- $line)[1]
            set depname (string trim -- $depname)
            if test -z "$depname"
                set depname (string trim -- (string replace -r ' \[installed\]$' '' -- $line))
            end
            set -l now_installed 0
            if pacman -Qq $depname >/dev/null 2>&1
                set now_installed 1
            end
            set -l was_tagged 0
            if string match -q -r '\[installed\]' -- $line
                set was_tagged 1
            end
            if test $was_tagged -eq 1 -a $now_installed -eq 0
                echo "- $line" >> $removed_block_file
            else if test $was_tagged -eq 0 -a $now_installed -eq 1
                echo "+ $line" >> $removed_block_file
            else
                echo "  $line" >> $removed_block_file
            end
        end
    end

    # --- pretty print: '+' new, '-' gone, fully-removed packages surfaced right after the summary ---
    begin
        cat $summary_file
        cat $removed_block_file
        echo
        echo "¥¥ Explicit ¥¥"
        echo
        awk -F'\t' -v addedfile=$added_file -v removedfile=$removed_file -v wantcat=EXPLICIT '
        BEGIN {
          while ((getline l < addedfile) > 0) added[l]=1
          close(addedfile)
          while ((getline l < removedfile) > 0) {
            n = split(l, f, "\t")
            if (n < 3 || f[1] != wantcat) continue
            key = f[2]
            removedlines[key] = (key in haveremoved) ? removedlines[key] "\n" f[3] : f[3]
            haveremoved[key] = 1
          }
          close(removedfile)
        }
        function flush_removed(pkg) {
          if (pkg in haveremoved) {
            m = split(removedlines[pkg], arr, "\n")
            for (i=1;i<=m;i++) print "- " arr[i]
          }
        }
        $1==wantcat {
          key=$1"\t"$2"\t"$3
          if ($2 != curpkg) {
            if (curpkg != "") { flush_removed(curpkg); print "" }
            print "== " $2 " =="
            curpkg=$2
          }
          print (key in added ? "+ " : "  ") $3
        }
        END { if (curpkg != "") flush_removed(curpkg) }' $new_file
        echo
        echo "---------------------"
        echo "¥¥ Dependencies ¥¥"
        echo
        awk -F'\t' -v addedfile=$added_file -v removedfile=$removed_file -v wantcat=DEPENDENCY '
        BEGIN {
          while ((getline l < addedfile) > 0) added[l]=1
          close(addedfile)
          while ((getline l < removedfile) > 0) {
            n = split(l, f, "\t")
            if (n < 3 || f[1] != wantcat) continue
            key = f[2]
            removedlines[key] = (key in haveremoved) ? removedlines[key] "\n" f[3] : f[3]
            haveremoved[key] = 1
          }
          close(removedfile)
        }
        function flush_removed(pkg) {
          if (pkg in haveremoved) {
            m = split(removedlines[pkg], arr, "\n")
            for (i=1;i<=m;i++) print "- " arr[i]
          }
        }
        $1==wantcat {
          key=$1"\t"$2"\t"$3
          if ($2 != curpkg) {
            if (curpkg != "") { flush_removed(curpkg); print "" }
            print "== " $2 " =="
            curpkg=$2
          }
          print (key in added ? "+ " : "  ") $3
        }
        END { if (curpkg != "") flush_removed(curpkg) }' $new_file
    end | bat -l diff --paging=always

    cp $new_file $cache_file
    rm -f $new_file $added_file $removed_file $fully_removed_file $summary_file $removed_block_file
end
