output=`$HOME/.bin/sp.sh current`
song=`$HOME/.bin/sp.sh current | /bin/grep 'Title' | cut -d " " -f2-`;

case "$output" in
    *running*)
        echo "";
        exit 0;
esac

echo $song;

exit 0;
