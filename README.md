first get the jobResults xml from $jenkinsdata/global-build-stats/jobresults
copy it to this folder

NEW WAY for master :
perl xmlparse.pl jobResults-2012-12.xml > final.xml
perl xmlparse.pl jobResults-2012-11.xml >> final.xml
manually remove the internal <list> </list> from final.xml

for cs_migration :
perl csxmlparse.pl jobResults-2012-12.xml > csfinal.xml
perl csxmlparse.pl jobResults-2012-11.xml >> csfinal.xml
manually remove the internal <list> </list> from csfinal.xml
#####################################################################


