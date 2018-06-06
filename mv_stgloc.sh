#!/bin/bash
#################################################################
# FMJ Siemens 2014						#
#								#
#								#
#################################################################

init() {
ct=/opt/ibm/RationalSDLC/clearcase/bin/cleartool
IFS="
"
AVB=$($ct lsstgloc -vob -long | grep 'Global path' | cut -d":" -f2 | sed -e's/ //g')
HELP_MESSAGE="$0: Change the emplacement of the vob storage location.
-h: this message
-n|--new_vobstgloc_path : path to the new storage location
"
}

control_vob-tag () {
for vobs in $($ct lsvob)
do
echo "vob=$vobs"
echo "ok pour VOB_TAG=${vobs%$AVB*}"
echo "ok pour VOB_STG=$AVB${vobs##*$AVB}"
echo "ok pour VOB_VBS=${vobs##*$AVB}"
done
}

init

while getopts hn: arg
do
case $arg in
	h)
	echo "$HELP_MESSAGE"
	;;
	n)
	echo "this is the new path $OPTARG"
	;;
esac
done

