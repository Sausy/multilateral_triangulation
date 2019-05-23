#include "Arduino.h"
// LED connected to digital pin 13
const int PIN13 = 13;

void setup()
{
// sets the digital pin as output
pinMode(PIN13, OUTPUT);
}

void loop()
{
// Set LED on, wait a second, turn LED off
// then wait one more second
digitalWrite(PIN13, HIGH);
delay(1000);
digitalWrite(PIN13, LOW);
delay(1000);
}
