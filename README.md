Rachana
=======

Rachana is Malayalam font designed by Hussain K H. The project was part of Rachana Aksharavedi for the original script of Malayalam in the digital computing. 

Rachana has glyphs with varying stroke width and very suitable for mixing with Serif family fonts. Rachana font has about 1200+ glyphs for Malayalam and contains glyphs required for printing old Malayalam books without compromising the writing style. This font is optimized for printing with individually designed glyphs for complex conjuncts rather than using component glyphs. The opentype rules used in this font later became a reference for many other Malayalam fonts. It has carefully designed ascend, descend metrics optimized for Malayalam script's vertically stacked conjuncts.

It is currently maintained by Swathanthra Malayalam Computing project. In 2015 Bold style variant of Rachana was designed by Hussain K H. Latin glyphs were also added to match the Malayalam glyphs. The source code for the font is available at https://gitlab.com/smc/rachana

Installation
==========
You can find this font in [fonts page](http://smc.org.in/fonts/) of Swathanthra Malayalam Computing site

###Steps for installation

* Download the font
* To setup the fonts just copy it to ~/.fonts directory 
* If you want it to be available to all users copy it to /usr/share/fonts.
* You can check whether the fonts are installed correctly by running the command ```fc-list Rachana ``` 
* Restart the running applications so that the new fonts are available to them.
* All aplications which depend on font config will be able to use the newly installed fonts.

Rachana Akshara Vedi
=================
Rachana is a language campaign forum for the Original script of Malayalam in the digital computing. 
It started in 1999 under the leadership of R. Chitrajakumar (Malayalam Lexicon, Kerala University,Thiruvananthapuram). Hussain KH (Kerala Forest Research Institute (KFRI), Thrissur) is the project coordinator who designed the font. Other Members are:  Gangadharan N (Malayalam Lexicon) who assisted Chitrajakumar in compiling the exhaustive character set of Malayalam. Dr. P Vijayakumaran Nair (KFRI) who assisted in programming the Rachana text editor which was used by many from 1999 to 2005 to typeset Books and journal articles in the old Lipi. Subash Kuriakose (KFRI) who gave advice to Hussain in the many aspects of Malayalam calligraphy. Later in 2004 Rajeev J Sebastian joined the Rachana team, whose mastery in Linux and untiring work is elevating the campaign to materialize its highest dream that to embed the original script in the OS enabling it in the whole field of digital applications. Dr. Mammen Chundamannil (KFRI) is an ardent supporter and well wisher of Rachana whose article 'For our language, our script' has spread the vision and objectives of Rachana to the whole world

Rachana fonts are the first set of Unicode compliant Open type fonts that contains the exhaustive character set of Malayalam compiled so far by Rachana team.


Building from source
--------------------
1. Install fontforge and python-fontforge
2. Install the python libraries required for build script:
    ```
    pip install -r tools/requirements.txt
    ```
3. Build the ttf, woff, woff2 files: 
   ``` 
   make
   ```