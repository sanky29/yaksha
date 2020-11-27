# yaksha
The requirments are
<br /> Linux os
<br /> Python with libraries matplotlib, pillow
<br /> OCaml

<br /><br />
I have used OCaml to make develop the flip book language. I have added following primitives
<br />
1. Rotation to image
<br />
2. Position
<br />
3. Multiple image plot
<br />
4. Loop
<br />
<br />
The gerneral syntax of language is
<br />
1. start_frame end_frame image_name1 pos_x1 pos_y1 rotation1 image_name2 pos_x2 pos_y2 rotation2
<br />
Now this expression will command to plot all images at respective position and rotation given from start_frame to end_frame;
<br />
2. Al loop can be written like
<br />
loop i = 0 to 10:
<br />
...code....
<br />
end loop;
<br />
<br />
Example:
<br />
1. The code is as follows:
<br /><br />
loop i = 0 to 11:<br />
(i*3) (3+i*3 - 1) {i+1}.jpg 0 0 0;<br />
end loop;<br />
As you see there is no rotation and position change the output is
<br />
![alt text](https://github.com/sanky29/yaksha/data/good.gif)
