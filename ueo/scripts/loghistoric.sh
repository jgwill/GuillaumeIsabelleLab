#!/bin/bash


#@v Auto Commit and export of history
#USAGE: source loghistoric.sh




#unique TLID to create unique Historic for each Shell
if [ -z "$tlid" ]; then 
	tlid=$(date '+%y%m%d%H%M%S');
	export tlid;
	echo "Setting TLID for this Shell to $tlid"; 
 
else 
	echo "This Terminal TLID is already set to: '$tlid'";
fi

#arg 1 Comment added to svn commit
hprefix=$HOSTNAME.$USER.$tlid

#making the previous for next time we commit
echo " " > /backups/historic/$hprefix.history_previous.txt
if [ -e /backups/historic/$hprefix.history_current.txt ]
then
	   cp -f /backups/historic/$hprefix.history_current.txt  /backups/historic/$hprefix.history_previous.txt 
    else
	       echo "created" >> /backups/historic/$hprefix.history_current.txt 
	fi





#getting a Latest export
history > /backups/historic/$hprefix.history_export.tmp


#getting a difference with the previous export
diff  /backups/historic/$hprefix.history_previous.txt  /backups/historic/$hprefix.history_export.tmp >  /backups/historic/$hprefix.history_DIFF.txt


#getting the current
cp -f /backups/historic/$hprefix.history_export.tmp /backups/historic/$hprefix.history_current.txt


# SVN Update repo
svn up /backups/historic

#SVN Add newest file if needed
svn add /backups/historic/$hprefix.*.txt --quiet


svn ci /backups/historic/$hprefix.history_current.txt -m "auto export of $HOSTNAME history CURRENT" --quiet
svn ci /backups/historic/$hprefix.history_DIFF.txt -m "auto export of $HOSTNAME history DIFF" --quiet
svn ci /backups/historic/$hprefix.history_previous.txt -m "auto export of $HOSTNAME history PREVIOUS" --quiet


#cleanup
rm -f  /backups/historic/$hprefix.history_export.tmp

