// Lima - second assignment
// Spetial thanks to Eric Heep


// import OSC

import oscP5.*;
import netP5.*;

// Define array of objects
Square[] sqr; 
int y;
int NUM_BARS = 128;

OscP5 oscP5; // Define oscP5 object
NetAddress myRemoteLocation; // Object to send data

void setup() {
  noCursor();
  println(NUM_BARS);
  size(displayWidth, displayHeight);
  fill(255);
  sqr = new Square[NUM_BARS]; 
  for (int i = 0; i < NUM_BARS; i++) {
    if (i < (NUM_BARS/3)) y = height/2-50;
    if (i >= (NUM_BARS/3) && i < (NUM_BARS/3 * 2)) y = height/2;
    if (i >= (NUM_BARS/3 * 2) && i < NUM_BARS) y = height/2+50;
    sqr[i] = new Square((i % 24) * 60, y, 60, 50);
   // println(y);  
    }
   oscP5 = new OscP5(this, 12001); // use port for listening 
   myRemoteLocation = new NetAddress("127.0.0.1",12000); 
}

float j = 0;
float t = 0;

void draw() {

  background(0); 
  for (int i =0; i < 120; i++)
  {
    j = random(0, mouseX);
    t = random(0, mouseY);
  }

  for (int i = 0; i < NUM_BARS; i++) {
    // Line 1  
    sqr[i].bpm(j, random(60, 120));
    sqr[i].update();
    sendSquareOsc(sqr[i].swtch);
  }
}

void sendSquareOsc(int x){
  OscMessage myMessage = new OscMessage("/squares"); 
  myMessage.add(x);
  println(x);
 oscP5.send(myMessage, myRemoteLocation);
}
  
boolean sketchFullScreen()
{
  return true;
}

  
