from PIL import Image
import glob

"""
This script opens, renames and saves the images in a different directory before
they are cropped by my "Results Cropping Script"
Takes image called "MATLAB R2020b - academic use 15_04_2021 17_01_36"
Returns image called "noise_1.png"
"""

img_types = ['noise', 'org', 'rot', 'proj1', 'proj2']
filenames = []

for img in img_types:
    for i in range(1, 6):
        filenames.append(f"{img}_{i}")

for i, filepath in enumerate(glob.iglob(r"ORIGINAL SCREENSHOT LOCATION\*.png")):
    temp_img = Image.open(filepath)
    temp_img.save(
        rf"NEW SCREENSHOT LOCATION\{filenames[i]}.png")
