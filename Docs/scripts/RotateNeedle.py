# Generates images at different rotations
# Input images should be square (512x512, 20x20, etc...)

from skimage import data, io, filters, transform
import imageio
import matplotlib

# Config parameters
outputImageAmount = 25

startAngle = 0
saveStartIndex = 0  # The number to start saving images on, appended after outputImageName

outputImagePath = "images/airspeed_indicator_needle-"
baseImagePath = "speed_indicator_needle.png"
# End config parameters

print(f"Using image at: {baseImagePath} | Output path: {outputImagePath}")


def save_image(image):
    global saveStartIndex
    matplotlib.image.imsave(outputImagePath + str(saveStartIndex) + ".png", image)
    saveStartIndex += 1


def rotate_image(image, angle):
    # The image does not like to be rotated past 180 degrees, so instead rotate the other way by going negative
    if angle <= 180:
        angle *= -1
    else:
        angle = 360 - angle

    return transform.rotate(image, angle)


def generate_images(start_angle, end_angle):
    image_array = imageio.imread(baseImagePath)  # Read as numpy array

    save_image(rotate_image(image_array, start_angle))  # Rotate to start angle + save base image at start angle

    rotate_angle = (end_angle - start_angle) / outputImageAmount
    angle = start_angle  # Clockwise from 0 to 360
    for i in range(outputImageAmount - 1):  # Rotate outputImageAmount - 1 times since the base image is saved
        angle += rotate_angle
        save_image(rotate_image(image_array, angle))


while True:
    print(f"saveStartIndex: {str(saveStartIndex)} | startAngle: {str(startAngle)}")
    endAngle = int(input("End angle: "))
    generate_images(startAngle, endAngle)
    startAngle = endAngle


