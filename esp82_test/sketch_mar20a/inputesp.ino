/*#include <ESP8266WiFi.h>
#include "time.h"

//high pin before sync    20 GPIO05
//high pin after timesync 19 GPIO04
//in pin before sync      18 GPIO00
//in pin after timesync   17 GPIO02

//default config
const char *DNS_NAME="asdf";

//default network settings
const char *WLAN_SSID="roboy";
const char *WLAN_PW="Roboy2016";


//ntp settings
const char* ntpServer = "europe.pool.ntp.org";
const long  gmtOffset_sec = 3600; //set to UTC+1 
const int   daylightOffset_sec = 0;

//DNS settings
const char *DNS_IP="192.168.0.2";

void wlan_init(){
  int try_cnt=0;
  Serial.print("start to connect SSID=%s", WLAN_SSID);
  WiFi.begin(WLAN_SSID, WLAN_PW);

  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED or try_cnt<= 100)
  {
    delay(500);
    Serial.print(".");
    try_cnt++;
  }
  Serial.println();

  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP()); 
}

void initTimeSync(){
  //init and get the time
  configTime(gmtOffset_sec, daylightOffset_sec, ntpServer);
}

void printLocalTime()
{
  struct tm timeinfo;
  if(!getLocalTime(&timeinfo)){
    Serial.println("Failed to obtain time");
    return;
  }
  Serial.println(&timeinfo, "%A, %B %d %Y %H:%M:%S");
}


void setup()
{
  Serial.begin(115200);
  Serial.println();

  //init
  wlan_init();
  initTimeSync();

  //print local time
  printLocalTime();
}

void loop() {}*/
