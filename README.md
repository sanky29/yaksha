# yaksha
The requirments are
<br /> Linux os
<br /> Python with libraries matplotlib, pillow
<br /> OCaml

<br />
<br />
To use compiler run following command <br />
./fs.sh   input_file_name   output_file
<br />
The input_file_name should contain your code. The image file path should be raltive to the code file directory.

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
(I*3) (3+I*3 - 1) {I+1}.jpg 0 0 0;<br />
end loop;<br />
As you see there is no rotation and position change the output is
<br />

<img alt="ALT test" src="https://github.com/sanky29/yaksha/blob/master/data/good.gif">

<br />
2. Now for followig code we have <br />
loop I = 0 to 17:<br />
I (I+1) apple.jpeg 300 (300-20*I) 0;<br />
end loop;<br />
loop I = 0 to 20:<br />
(I+18) (I+19) applel.jpeg (250-I*5) I*5 I*9 appler.jpeg (350+I*9) I*5 (360-I*9);<br />
end loop;<br /> 
loop I = 1 to 21:<br />
(I+38) (I+39) applel.jpeg (150-I*5) (100-I*5) (180+I*9) appler.jpeg (450+I*5) (100-I*5) (180-I*9);<br />
end loop; <br />

<img alt="ALT test" src="https://github.com/sanky29/yaksha/blob/master/good2.gif">


