# SVD Exercise: Image Compression using RGB Scale

# Work with any image.png file

# Url Help:
# https://www.youtube.com/watch?v=SU851ljMIZ8

# need numpy for representing matrices as numpy arrays

# numpy.linalg.svd is a numpy function which performs SVD

# PIL library for Image open/show operations ((Image.open(), Image.show())

import numpy
from PIL import Image

# First, create 2 functions:

# 1) Function to open image.

# 2) Function to compress image by limiting to k singular values.

def openImage(imagePath):
  imOrig = Image.open(imagePath)
  im = numpy.array(imOrig)

  aRed = im[:,:, 0]
  aGreen = im[:,:, 1]
  aBlue = im[:,:,2]

  return [aRed, aGreen, aBlue, imOrig]

  def compressSingleChannel(channelDataMatrix, singularValuesLimit):
    uChannel, aChannel, vhChannel = numpy.linalg.svd(channelDataMatrix)
    aChannelCompressed = numpy.zeros((channelDataMatrix.shape[0], channelDataMatrix.shape[1]))  #Fill rest with zeros.
    k = singularValuesLimit   #Set a limit to k: reduce dimensions for compression.

    #A = U*Diag.*VT
    leftSide = numpy.matmul(uChannel[:, 0:k], numpy.diag(sChannel)[0:k, 0:k]  #U*Diagonal Matrix First Step
    aChannelCompressedInner = numpy.matmul(leftSide, vhChannel[0:k, :])
    aChannelCompressed = aChannelCompressedInner.astype('uint8')
    return aChannelCompressed

# MAIN PROGRAM:

print('Image Compression Using SVD - Example')
aRed, aGreen, aBlue, originalImage = openImage('Ball.png')

# Image Width + Height
imageWidth = 512
imageHeight = 512

# Number of Singular Values to Use for Reconstructing the Compressed Image

singularValuesLimit = 160 # Value of k in function!!!
#Try different values of k.
#NOTE: The smaller the values of k chosen, the smaller the compression ratio. k=25 implies the image should not be used.


aRedCompressed = compressSingleChannel(aRed, singularValuesLimit)
aGreenCompressed = compressSingleChannel(aGreen, singularValuesLimit)
aBlueCompressed = compressSingleChannel(aBlue, singularValuesLimit)

imr=Image.fromarray(aRedCompressed, mode = "None")
img=Image.fromarray(aGreenCompressed, mode = "None")
imb=Image.fromarray(aBlueCompressed, mode = "None")

newImage = Image.merge("RGB", (imr,img,imb))

originalImage.show()
newImage.show()

# CALCULATE AND DISPLAY THE COMPRESSION RATIO
mr=imageHeight
mc=imageWidth

originalSize = mr * mc * 3
compressedSize = singularValuesLimit * (1 + mr + mc) * 3

print('original size')
print(originalSize)

print('compressed size:')
print(compressedSize)

print('compressed size:')
print(compressedSize)

print('Ratio compressed size / original size: ')
ratio = compressedSize * 1.0 / original size
print(ratio)

print('Compressed image size is ' + str( round(ratio * 100 , 2)) + '% of the original image')

print('DONE - Image Compressed!')



















