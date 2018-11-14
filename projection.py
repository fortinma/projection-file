#/usr/bin/python
#script takes the filename of a geographic file and creates a .prj file with the same name and adds the text for a specific projection.
#the example below uses a cad "dwg" extension and builds an MTM Zone 10 NAD 27 projection file. Simply change the extension of the list of files you
#need to create projection files for and change the text for the projection file in the "projection_info" variable.  You can find
#projection files here: http://spatialreference.org
import os

directory = "City_PDM_2018/"
extension = ".dwg"
projection_info = 'PROJCS["MTM_3Degree",GEOGCS["GCS_North_American_1927",DATUM["D_North_American_1927",SPHEROID["Clarke_1866",6378206.4,294.9786982]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Transverse_Mercator"],PARAMETER["False_Easting",304800.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",-79.5],PARAMETER["Scale_Factor",0.9999],PARAMETER["Latitude_Of_Origin",0.0],UNIT["Meter",1.0]'
new_file_extension = ".prj"
for filename in os.listdir(directory):
    new_file =  filename[:-4] + new_file_extension
    f = open(directory + new_file, "w")
    f.write(projection_info)
    f.close()
