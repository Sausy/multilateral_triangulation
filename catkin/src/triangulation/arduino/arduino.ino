/*
  This sketch shows how to use the NeoPixel library in MKRVidor 4000
  It turns on all of the LED's of a NeoPixel strip with different colors.
  In this example all the commands are sent to pin A6 to the strip.

  Circuit:
  - MKR Vidor 4000;
  - External Power Supply
  - Neopixel strip:
    - Neopixel GND connected to  MKRVIDOR4000 GND and Power supply V-;
    - Power supply V+ connected to 5V+ Neopixel;
    - pin A6 connected to the Neopixel control Pin D0.

  created 25 July 2018
  by Riccardo Rizzo
*/

#include "VidorPeripherals.h"
#include "Vidor_NeoPixel.h"
#include <WiFiNINA.h>
//#include <WiFiUdp.h>

int status = WL_IDLE_STATUS;
///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = "roboy";        // your network SSID (name)
char pass[] = "wiihackroboy";    // your network password (use for WPA, or use as key for WEP)



void printWifiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print your board's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);

  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.print(rssi);
  Serial.println(" dBm");
}

Vidor_NeoPixel np(256, A6); // The constructor allows you to set the control pin and the number of the LED's.
int count = 0;
void setup() {
  Serial.begin(115200);

  if (!FPGA.begin()) {
    Serial.println("Initialization failed!");
    while (1) {}
  }
  Serial.println("Initialization Done!");
  for (int j = 0; j < 256; j++) {
    np.setPixelColor(j, 0, 0, 0, 0); // The function setPixelColor(led,red,green,blue,white) sets the desired color to a particular LED.
  }
  np.setBrightness(20); // The np.setBrightness(int) function sets the brightness of all the LED's on the strip
  np.show(); //The np.show() function send the commands to the strips

  // check for the WiFi module:
  if (WiFi.status() == WL_NO_MODULE) {
    Serial.println("Communication with WiFi module failed!");
    // don't continue
    while (true);
  }

  // attempt to connect to Wifi network:
  while (status != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
    status = WiFi.begin(ssid, pass);
  }
  Serial.println("Connected to wifi");
  printWifiStatus();
}

void loop()  {
  for (int i = 0; i < 256; i++) {
    np.setPixelColor(i, 80, 125 % i, 180 % i, 1);
    np.show();
    delay(100);
  }
  while (1);
}
