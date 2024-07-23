/*Author: Enkhbold TTF Robotics
  subscribe on Youtube: http://bit.ly/2UAfQ8V
  WS2812B-8 Driver code
*/

import themidibus.*; //Import the library
import processing.serial.*;
import static javax.swing.JOptionPane.*;

PFont f;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
int ascii=35;
 int channel = 0;
  int pitch = 64;
  int velocity = 127;
final boolean debug = true;
MidiBus myBus; // The MidiBus
void setup() 
{
  //      for(int i=0;i<64;i++){
//       leds[i] = CRGB ( 0, 0, 0); 
//      }
  size(600,200);
  f = createFont("Arial", 72,true);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  //String portName = Serial.list()[1];
  //myPort = new Serial(this, portName, 9600);
  MidiBus.list();
  myBus = new MidiBus(this, 0, 0);
  String COMx, COMlist = "";
  /*
  Other setup code goes here - I put this at
   the end because of the try/catch structure.
   */
  try {
    if (debug) printArray(Serial.list());
    int i = Serial.list().length;
    if (i != 0) {
      if (i >= 2) {
        // need to check which port the inst uses -
        // for now we'll just let the user decide
        for (int j = 0; j < i; ) {
          COMlist += char(j+'a') + " = " + Serial.list()[j];
          if (++j < i) COMlist += ",  ";
        }
        COMx = showInputDialog("Which COM port is correct? (a,b,..):\n"+COMlist);
        if (COMx == null) exit();
        if (COMx.isEmpty()) exit();
        i = int(COMx.toLowerCase().charAt(0) - 'a') + 1;
      }
      String portName = Serial.list()[i-1];
      if (debug) println(portName);
      myPort = new Serial(this, portName, 9600); // change baud rate to your liking
      myPort.bufferUntil('\n'); // buffer until CR/LF appears, but not required..
    } else {
      showMessageDialog(frame, "Device is not connected to the PC");
      //exit();
    }
  }
  catch (Exception e)
  { //Print the type of error
    showMessageDialog(frame, "COM port is not available (may\nbe in use by another program)");
    println("Error:", e);
    // exit();
  }
}

void draw()
{
  
 

  myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  // delay(200);
  myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

  int number = 0;
  int value = 90;

  myBus.sendControllerChange(channel, number, value); // Send a controllerChange
  //background(255);
   background(255);
  fill(0);                         // STEP 4 Specify font color 
  textFont(f, 50);     
  text("88Hurtelh daralt= "+ascii, 10, 100);   // STEP 5 Display Text
 // text("Daralt_gen = "+pitch, 10, 150);   // STEP 5 Display Text
               // STEP 3 Specify font to be used
}
void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  ascii = MAP(pitch, 21, 108, 35, 122);
  myPort.write(ascii); 
  println("Daralt_asc = "+ascii);
 
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  ascii = MAP(pitch, 21, 108, 35, 122);
  myPort.write(ascii); 
  println("ascii = "+ascii);
  textFont(f, 16);     
  background(255);
  fill(0);                         // STEP 4 Specify font color 
  text("ascii = "+ascii, 100, 100);   // STEP 5 Display Text
  text("Pitch = "+pitch, 130, 100);   // STEP 5 Display Text
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
int MAP(int au32_IN, int au32_INmin, int au32_INmax, int au32_OUTmin, int au32_OUTmax)
{
  return ((((au32_IN - au32_INmin)*(au32_OUTmax - au32_OUTmin))/(au32_INmax - au32_INmin)) + au32_OUTmin);
}





/*

  Author: Enkhbold TTF Robotics
  subscribe on Youtube: http://bit.ly/2UAfQ8V
  WS2812B-8 Driver code

#include <FastLED.h>

#define NUM_LEDS 64
#define DATA_PIN A0

CRGB leds[NUM_LEDS];  //Define led number variables for CRGB
int incomingByte;    //Serial read var
int num=0;          //map function convert
unsigned long myTime=0;   //Millis
unsigned long previousMillis = 0;        // will store last time LED was updated
const long interval = 800;   //interval between last key until click new key
int last[64];
int ledState = LOW; 
void setup() {
  Serial.begin(9600); //Serial begin
  FastLED.addLeds<WS2812, DATA_PIN, RGB>(leds, NUM_LEDS);  // GRB ordering is typical
  Serial.println("ON UART");
}

void loop() {
//   leds[63] = CRGB(255, 0, 0);
//   FastLED.show();
 
  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();
    
    num = map(incomingByte, 50, 105, 0, 65);
  
    leds[num] = CRGB ( random(0,255), random(0,255), random(0,255));
    //random function can read random variable random(min,max);
    FastLED.show();  // this row should be write when you turn on led
  }
    
  unsigned long currentMillis = millis();

  if (currentMillis - previousMillis >= interval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW) {
      ledState = HIGH;
    } else {
      ledState = LOW;
      for(int i=0;i<64;i++){
       leds[i] = CRGB ( 0, 0, 0); 
      }
       
    }

    // set the LED with the ledState of the variable:
   
  }
  // leds[last[num]] = CRGB ( 0, 0, 0);

    // if the LED is off turn it on and vice-versa:
    

    // set the LED with the ledState of the variable:
    //digitalWrite(ledPin, ledState);
  
      

//   for (int i = 0; i <= NUM_LEDS; i++) {
//     leds[i] = CRGB ( 0, 0, 120);
//     FastLED.show();
//     delay(40);
//   }
  // for (int i = NUM_LEDS; i >= 0; i--) {
  //   leds[i] = CRGB ( 120, 0, 0);
  //   FastLED.show();
  //   delay(40);
  // }
  // for (int i = NUM_LEDS; i >= 0; i--) {
  //   leds[i] = CRGB ( 0, 120, 0);
  //   FastLED.show();
  //   delay(40);
  // }




}

 
 */
