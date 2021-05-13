# yaksha
## Introduction
This was part of placement process of Hasura. We were suppose to develop small toy language which can convert set of images to GIF following some code written in our language. I developed language which will have simple arithmetic expression including variables and for loops. Following are high level primitives:
<br />
1. Rotation to image
2. Position
3. Multiple image plot
4. Loop
<br />

## Requirments
<br /> Linux os
<br /> Python with libraries matplotlib, pillow
<br /> OCaml

## Getting Started
The general syntax of language is
<br />
1. start_frame end_frame image_name1 pos_x1 pos_y1 rotation1 image_name2 pos_x2 pos_y2 rotation2
   - Now this expression will command to plot all images at respective position and rotation given from start_frame to end_frame;
2. Al loop can be written like
```
loop i = 0 to 10:
  Instructions
end loop;
```
3. To interpret code run the command
```
./
```
## Example
1. The code is as follows:
```
loop i = 0 to 11:
  (I*3) (3+I*3 - 1) {I+1}.jpg 0 0 0;
end loop;
```
As you see there is no rotation and position change the output is
<br />

<img alt="ALT test" src="https://github.com/sanky29/yaksha/blob/master/data/good.gif">

<br />
2. Now for following code we have
```
loop I = 0 to 17:
  I (I+1) apple.jpeg 300 (300-20*I) 0;
end loop;
loop I = 0 to 20
  (I+18) (I+19) applel.jpeg (250-I*5) I*5 I*9 appler.jpeg (350+I*9) I*5 (360-I*9)
end loop
loop I = 1 to 21:
  (I+38) (I+39) applel.jpeg (150-I*5) (100-I*5) (180+I*9) appler.jpeg (450+I*5) (100-I*5) (180-I*9);
end loop;
```
<img alt="ALT test" src="https://github.com/sanky29/yaksha/blob/master/good2.gif">


