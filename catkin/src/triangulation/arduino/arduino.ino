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

  created 25 July 2018ll
  by Riccardo Rizzo
*/

#include "VidorPeripherals.h"
#include <WiFiNINA.h>
//#include <WiFiUdp.h>
#include "mqtt_test.hpp"

int status = WL_IDLE_STATUS;
///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = "roboy";        // your network SSID (name)
char pass[] = "wiihackroboy";    // your network password (use for WPA, or use as key for WEP)

MQTTClient client;
WiFiClient net;
unsigned long lastMillis = 0;

void connect();
void printWifiStatus();
void messageReceived(String &topic, String &payload);


void setup() {
  Serial.begin(115200);

  if (!FPGA.begin()) {
    Serial.println("Initialization failed!");
    while (1) {}
  }
  connect();
}

void loop()  {
  client.loop();

  if (!client.connected()) {
    connect();
  }

  // publish a message roughly every second.
  if (millis() - lastMillis > 1000) {
    lastMillis = millis();
    client.publish("/hello", "world");
  }
}

//=========================================================
void messageReceived(String &topic, String &payload) {
  Serial.println("incoming: " + topic + " - " + payload);
}

//=========================================================
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

//=========================================================
void connect() {
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

  client.begin("broker.shiftr.io", net);
  client.onMessage(messageReceived);

  Serial.print("\nconnecting...");
  while (!client.connect("arduino", "try", "try")) {
    Serial.print(".");
    delay(1000);
  }

  Serial.println("\nconnected!");

  client.subscribe("/hello");
  // client.unsubscribe("/hello");
}
