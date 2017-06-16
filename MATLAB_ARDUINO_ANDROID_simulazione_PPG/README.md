I simulate a PPG signal using an image that I found on internet, than with Grabit I set some point an I exported the Data002.mat array filled by this point, the I interpolated thisarray to have a denser array of 10.000 values to send to Arduino.
The main file is Matlab_Arduino_PPG_simulator3.m that simulate the signal, plot it as a template and send continuously all the value to the Serial port.

This matlab project is related to my Android App project that I developed to manage an opensource pulsoximeter.
Check it on https://github.com/zamathebest/AndroidRepository/tree/master/ArduinoAndroidMioNEW
Unfortunatelly I was not authorized to used the Pulsoximeter sensor so I developed this matlab project.

I'm not a programmer (i'm just a Biomedical engeneer) so have fun trying to understand my mess!
