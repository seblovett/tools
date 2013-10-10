import sys

#print sys.argv[0] #this script
use = { "ant" : r"D:\UserPrograms\ant\bin;",
        "graphviz" : r"C:\Program Files (x86)\Graphviz2.32\bin;",
        "doxy" : r"C:\Program Files\doxygen\bin;",
        "tex" : r"C:\Program Files (x86)\MiKTeX 2.9\miktex\bin\;",
        "buildtools" : r"D:\UserPrograms\buildtools;"
         }
touse = sys.argv[1]
path = ' '.join(sys.argv[2:])

if ';' != path[-1] :
    path = path + ";"
if touse in use:
    if use[touse] not in path:
        path = path + use[touse]
        print "Using %s" % touse
        f = open('path.bat', 'w')
        f.write("SET PATH=%s" % path)
        f.close()
    else:
        print "Already using %s" % touse
        f = open("path.bat", 'w')
        f.close()
elif "--restore" == touse:
    for key in use:
        path = path.replace(use[key], '')
    f = open('path.bat', 'w')
    f.write("SET PATH=%s" % path)
    f.close()
elif "-h" == touse:
    print("Use supports:")
    for k in use:
        print(k)
    print("--restore")
else:
    print "%s not found" % touse
    f = open("path.bat", 'w')
    f.close()
