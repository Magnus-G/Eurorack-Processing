Eurorack-Processing
===================

FROM PROCESSING TO VIDEO
-----
saveFrame("output/name-####.tiff");
QuickTime Pro: Open image sequence
Save as 24fps
Drop video in Live
Set warp markers where the control points in video are. First and last.
See control points as red arrows in timeline
Warp video to match control points in sound
Make sure the video window is large!!
Export Quicktime Movie
Compression: Photo - JPEG
Quality: Best 

FROM ARDCORE TO PROCESSING
-----
Upload StandardFirmata (Examples > Firmata > StandardFirmata) to Ardcore (from native app! important)
Add import org.firmata.*; to the top of the Processing file called Ardcore_W_Processing_Firmata.pde
Try changing the number in brackets to find the right port
arduino = new Arduino(this, Arduino.list()[5], 57600);
Run Processing sketch
