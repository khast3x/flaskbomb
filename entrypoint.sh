#!/usr/bin/env sh

CMD=$1
SIZE=$2
USAGE="flask_bomb.py <normal | fast> <X> ; # Where X is the amount of deflated payload in Gb"
DEST="/app/static"

case $SIZE in
    ''|*[!0-9]*) echo $USAGE; exit ;;
    *) echo "Input ok" ;;
esac

case "$CMD" in
  "normal" )
    echo "Generating classic payload, please be patient"
    time dd if=/dev/zero bs=1M count=$(($SIZE*1024)) | gzip > $DEST/cake.gzip
    du -sh $DEST/cake.gzip && md5sum $DEST/cake.gzip
    exec python -u flask_bomb.py
    ;;

  "fast" )
    echo "Generating faster payload, please be patient"
    dd if=/dev/zero bs=1M count=$((1*1024)) | gzip > $DEST/egg.gzip
    du -sh $DEST/egg.gzip && md5sum $DEST/egg.gzip
    touch cake.gzip && time -p sh -c "for f in \$(seq $SIZE); do cat $DEST/egg.gzip >> $DEST/cake.gzip; echo \"Added \$f Gb\" ; done;"
    du -sh $DEST/cake.gzip && md5sum $DEST/cake.gzip && \
    rm -rf $DEST/egg.gzip
    exec python -u flask_bomb.py

    ;;

   * )
    exec $CMD ${@:2}
    ;;
esac

