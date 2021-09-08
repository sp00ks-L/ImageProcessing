from PIL import Image
import glob


def get_results(file):
    """
    Given a screenshot of my MATLAB window (2560 x 1377 - 1440p), this crops the image to only contain the MATLAB
    script output, then individually crops each 'useful' part: the colour matrix and the results matrix
    """
    img = Image.open(file)
    # Slices path to only contain file name
    # WIll need changing depending on your selected path
    filename = img.filename[84:-4]

    # Crop majority of screenshot
    left = 1430
    top = 395
    right = 2000
    bottom = 835
    first_crop = img.crop((left, top, right, bottom))

    # 570 x 440 - this is the size of the image after the first crop
    # Colour Matrix Cropping
    cm_left = 25
    cm_top = 20
    cm_right = 510
    cm_bottom = 225
    cm_crop = first_crop.crop((cm_left, cm_top, cm_right, cm_bottom))

    # Result Matrix Cropping
    rm_left = 5
    rm_top = 355
    rm_right = 295
    rm_bottom = 430
    rm_crop = first_crop.crop((rm_left, rm_top, rm_right, rm_bottom))

    # Save images to respective folders
    cm_crop.save(rf"YOUR PATH\Colour Matrices\{filename}_CM.png")
    rm_crop.save(rf"YOUR PATH\Result Matrices\{filename}_RM.png")


PATH = r"SCREENSHOT PATH\*.png"

for filepath in glob.iglob(PATH):
    get_results(filepath)
