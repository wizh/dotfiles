output=`/usr/bin/amixer sget Master`;
vol=`echo $output | awk -F"[][]" '/Front Left:/ { print $2 }'`;

case "$output" in
    *off*)
        echo "muted";
        exit 0;
esac

echo $vol;
exit 0;
