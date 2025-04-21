# first argument is the mod's name and the second one is the mod author
name=$1
author=$2

renaming()
{
        echo "Renaming in $(pwd)"
        for f in WinchModTemplate*; do mv "$f" "$(echo "$f" | sed -e "s/WinchModTemplate/$name/g")"; done
}

change_occurences()
{
        for f in $@
        do
                echo "Changing occurrences in $f"
                cat "$f" | sed -e "s/WinchModTemplate/$name/g" -e "s/YourName/$author/g"> "$f.tmp" && mv "$f.tmp" "$f"
        done
}

cd WinchModTemplate
change_occurences WinchModTemplate* mod_meta.json Loader.cs
renaming
cd ..
change_occurences WinchModTemplate.sln
renaming
