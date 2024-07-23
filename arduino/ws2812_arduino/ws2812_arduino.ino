/*Author: Enkhbold Ganbold
  Github: https://github.com/enkhbold470
  subscribe on Youtube: http://bit.ly/2UAfQ8V
  WS2812B-8 Driver code
*/
#include <FastLED.h>

#define NUM_LEDS 64
#define DATA_PIN 2

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
  digitalWrite(3,1);
  
}

void loop() {

  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();
    
    num = map(incomingByte, 50, 105, 0, 65);
  
    leds[num] = CRGB ( random(0,255), random(0,255), random(0,255));
    //random function can read random variable random(min,max);
    FastLED.show();  // this row should be write when you turn on led
  }
  
}
