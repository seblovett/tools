from PIL import Image
from optparse import OptionParser
def ConvertEndian16(value):
    if value >= 2**16:
        raise Exception("Value outside of 16 bit range")
    retval = ( ( value & 0x00FF) << 8 ) | ( ( value & 0xFF00 ) >> 8 )
    return retval
def Col2RGB565(red, green, blue, littleEndian = False):
    '''Covert a tuple of 8 bit colours to RGB565 format'''
    '''Red and Blue are 5 bit fields, green is 6 bit'''
    if (red > 255) or (blue > 255) or (green > 255):
        raise Exception("colours are not 8 bit values")
    
    r = ( red / 8 ) & 0x1F #shift left by three and mask to 5 bits
    b = ( blue / 8 ) & 0x1F
    g = ( green / 4 ) & 0x3F # only shift by two and mask to 6 bits

    rgb = ( r << 11 ) | ( g << 5 ) | ( b << 0 )

    if littleEndian:
        rgb = ConvertEndian16(rgb)
    return rgb

if "__main__" == __name__:
    parser = OptionParser()
    
    parser.add_option("-i", "--image", dest="image",\
                      help="input image to convert", metavar="FILE")
    parser.add_option("-f", "--flash", dest="flash",\
                      help="put the code in the flash memory space", action="store_true",\
                      default=False)
    (options, args) = parser.parse_args()
    
    
    im = Image.open(options.image)
    basename = '.'.join(options.image.split('.')[:-1])
    output = basename + ".h"
    out = open(output, 'w')
    fname = output.split('\\')[-1]
    fname = '_'.join(fname.split('.')[:-1])
    print fname.upper()
    print fname

    out.write('#ifndef %s_H\n\
#define %s_H\n\n\
#include <avr/io.h>\n' % (fname.upper(), fname.upper()))
    if options.flash:
        out.write('#include <avr/pgmspace.h>\n')
    out.write('/*This is an automatically generated file from im2h.py*/\n' )
    (width, height) = im.size
    print width, height
    out.write("#define %s_WIDTH\t\t0x%x\n" % (fname.upper(), width))
    out.write("#define %s_HEIGHT\t\t0x%x\n" % (fname.upper(), height))
    if options.flash:
        PROGMEM= "PROGMEM "
    else:
        PROGMEM = ""
    out.write("const uint8_t %s[%s_HEIGHT * %s_WIDTH * 2] %s= {\n" % (fname, fname.upper(), fname.upper(), PROGMEM))
    for i in range(height):
        s = list()
        
        for j in range(width):
            
            r, b, g = im.getpixel((j,i))
            col = Col2RGB565(r,b,g, False) 
            s.append("0x%x" % ((col & 0xFF00) >> 8))
            s.append("0x%x" % ((col & 0x00FF) >> 0))
        
        line = ",".join(s)
        out.write("\t")
        out.write(line)
        if i != (height - 1):
            out.write(',')
        out.write("\n")
    out.write('};\n/*end of image*/\n\n#endif /* #ifndef %s_H */ ' % fname.upper())
    out.close()
