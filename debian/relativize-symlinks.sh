#!/bin/bash

function relativize {
	RL=`readlink -f $1`
	DR=`dirname $1`
	DR=`readlink -f $DR`/
	rel=${RL#$DR}
	ln -fs $rel $1
}

BASE=$1
if [ ${BASE:0:1} != "/" ] ; then
	BASE=$PWD/$BASE
fi

for f in `find $BASE -type l` ; do
	relativize "$f"
done
