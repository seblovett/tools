import os
import shutil
#improvement - download using Git and update

#for now, will just use the existing
Local = r"D:\Projects\seblovWebSite"
Remote = r"Z:\public_html"

FilesToCopy=["Projects.xml", "awards.xml", "index.php"]
Log = "log.txt"

log = open(os.path.join(Remote, Log), 'w')
log.write("Begin update of website\n")

for f in FilesToCopy:
    try:
        shutil.copy(os.path.join(Local, f), os.path.join(Remote, f))
        log.write("Copied %s\n" % f)
    except:
        log.write("Failed to copy %s\n" % f)

#copy images if they don't exist
LocalImages = os.listdir(os.path.join(Local, "Images"))
RemoteImages = os.listdir(os.path.join(Remote, "Images"))

log.write("\nImages\n")
for i in LocalImages:
    if i not in RemoteImages:
        try:
            shutil.copy(os.path.join(Local, i), os.path.join(Remote, i))
            log.write("Copied %s\n" % i)
        except:
            log.write("Failed to copy %s\n" % i)
    



log.close()
log = open(os.path.join(Remote, Log), 'r')
print(log.read())
log.close()
