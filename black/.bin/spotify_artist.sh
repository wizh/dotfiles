output=`$HOME/.bin/sp.sh current`
artist=`$HOME/.bin/sp.sh current | /bin/grep -m2 'Artist' | tail -n1 | cut -d " " -f2-`;
song=`$HOME/.bin/sp.sh current | /bin/grep 'Title' | cut -d " " -f2-`;

case "$output" in
    *running*)
        echo "";
        exit 0;
esac

echo $artist;

exit 0;
