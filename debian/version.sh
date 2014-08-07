#!/bin/bash

VERSION=`git describe --tags`
if [ $? -ne 0 ] ; then
	VERSION=0.1
fi

echo $VERSION

