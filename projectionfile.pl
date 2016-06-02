#!/usr/local/bin/perl

#####################################
# this program creates a .prj file for every file with a same specific extension 
# in a folder. Eg. all .tif files in a folder or all .dwg files in a folder
# run this script in a folder up from where the files are held
#####################################

print "Which directory do you want to process: ";
$directory = <STDIN>; 
chop($directory);
print "What format do you want to search for? .shp; .dwg .tif (no \".\") : ";
$extension = <STDIN>;
chop($extension);
#the next line requires you to find the information necessary to create the text information to be contained in the .prj file. Since there are quote marks required, a "\" is needed before each " mark. You can find the information for your projection information here: http://spatialreference.org/
$text = "PROJCS[\"MTM_3Degree\",GEOGCS[\"GCS_North_American_1927\",DATUM[\"D_North_American_1927\",SPHEROID[\"Clarke_1866\",6378206.4,294.9786982]],PRIMEM[\"Greenwich\",0.0],UNIT[\"Degree\",0.0174532925199433]],PROJECTION[\"Transverse_Mercator\"],PARAMETER[\"False_Easting\",304800.0],PARAMETER[\"False_Northing\",0.0],PARAMETER[\"Central_Meridian\",-79.5],PARAMETER[\"Scale_Factor\",0.9999],PARAMETER[\"Latitude_Of_Origin\",0.0],UNIT[\"Meter\",1.0]]";
#####################################

print "These are the created $directory .prj files\n";

open(list_of_files, "ls $directory/*.$extension |");
@fiches = <list_of_files>;

foreach $i (@fiches) {
  chop($i);
  print "$i\n";
  $temp = substr($i, 4,-4); #the first number (4 in this case) is the last letter to keep for the name of the new file
   open(output, ">$directory/$temp.prj"); 
   print output "$text";
   close(output);
}
