from cv2 import imshow, imread, resize, waitKey, equalizeHist, destroyAllWindows
import os
import numpy as np

base_path = 'D:/Sem 6/IP/MiniProjectIP/images'
file_names = []
for i in range(1, 25):
    file_names.append('Fabric' + str(i) + '.jpg')

files = []
for i in range(1, 25):
    files.append(os.path.join(base_path, file_names[i - 1]))
x = imread(files[0])
imshow('', x)
waitKey(0)
destroyAllWindows()
