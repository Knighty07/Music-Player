//Library: use Sketch / Import Library / Add Library/ Minim

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1;  //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
//
void setup () {
  //size(500, 600); //Remind you of Display Geometry
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  song1 = minim.loadFile("home depot theme song.mp3"); //able to pass absolute path, file name & extension, and URL
  song1.loop(0);
  // song1.play(); //Parameter is milli-seconds from start of audio file to start playing
}//End setup
void draw() {
}//End draw
//
void keyPressed() {
  if (key=='P' || key=='p') {
    if (song1.isPlaying() ) {
      song1.pause();
    } else if (song1.position() >=song1.length()-song1.length()*1/10){
      song1.play();
    }

    // if (key=='P' || key=='p') song1.play();
    if (key=='L' || key=='l') song1.loop(2);
    if (key=='Z' || key=='z') song1.loop();
    if (key=='R' || key=='r') {
      if (song1.isMuted()) {
        song1.unmute();
      } else {
        song1.isMuted();
      }
    }//End Mute button
    //Fast Forward/Fast Reverse
    //Built in Quesion:
    if (key=='S' || key=='s')song1.skip(1000); //1000 Milliseconds=1 second
    if (key=='T' || key=='t')song1.skip(-1000); 

    //Stop Button
    if  (key=='W' || key=='w') {
      if (song1.isPlaying() ) {
        song1.pause();
        song1.rewind();
      } else {
        song1.rewind();
      }
    }
    //play pause feature
  }//End keyPressed
  //
  void mouseClicked() {}//End mousePressed
  //
  //End Main Program
