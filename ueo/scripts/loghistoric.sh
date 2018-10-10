

#@v Auto Commit and export of history


#arg 1 Comment added to svn commit

#making the previous for next time we commit
cp -f /backups/historic/$USER.history_current.txt  /backups/historic/$USER.history_previous.txt




#getting a Latest export
history > /backups/historic/$USER.history_export.tmp


#getting a difference with the previous export
diff  /backups/historic/$USER.history_previous.txt  /backups/historic/$USER.history_export.tmp >  /backups/historic/$USER.history_DIFF.txt


#getting the current
cp -f /backups/historic/$USER.history_export.tmp /backups/historic/$USER.history_current.txt


#SVN Add newest file if needed
svn add /backup/historic/*.txt


svn ci /backups/historic/$USER.history_current.txt -m "auto export of UEO history CURRENT"
svn ci /backups/historic/$USER.history_DIFF.txt -m "auto export of UEO history DIFF"
svn ci /backups/historic/$USER.history_previous.txt -m "auto export of UEO history PREVIOUS"


#cleanup 
rm -f  /backups/historic/$USER.history_export.tmp

