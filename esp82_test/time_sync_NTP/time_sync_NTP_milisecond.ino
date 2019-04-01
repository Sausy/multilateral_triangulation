//#include <NTP.h>
#include <WiFi.h>
#include <WiFiUdp.h>
#include <esp_pm.h>

#define size_of_uint 4294967295
#define clk_time_multi 4 //(1/240*10^-3)=4.16666666

unsigned int diff_time=0;

const char* ssid = "roboy";
const char* password = "wiihackroboy";

bool startWiFi(void);

int mode_select=0;
unsigned int trigger_cnt=0;
const int mode_selctPIN=23;
const int trigger_selctPIN=13;
const int trigger_selctPIN_US=26;
const int trigger_outPIN=12;
const int trigger_outPIN_US=14 ;

unsigned int localPort = 2390;      // local port to listen for UDP packets
const int NTP_PACKET_SIZE = 48; // NTP time stamp is in the first 48 bytes of the message
byte packetBuffer[ NTP_PACKET_SIZE]; //buffer to hold incoming and outgoing packets

unsigned long previousMillis = 0;        // will store last time LED was updated
int ledState = LOW;             // ledState used to set the LED

const long interval = 100;           // interval at which to blink (milliseconds)

int count=0; // 
int turn=2;   // 

WiFiUDP Udp;

int SineValues[256];
int freq = 40000;
int channel = 0;
int resolution = 8;
int dac_pin = 25;

void setup_sinGen(){
  /*  float ConversionFactor=(2*PI)/256;        // convert my 0-255 bits in a circle to radians
                                            // there are 2 x PI radians in a circle hence the 2*PI
                                            // Then divide by 256 to get the value in radians
                                            // for one of my 0-255 bits.
  float RadAngle;                           // Angle in Radians
  // calculate sine values
  for(int MyAngle=0;MyAngle<256;MyAngle++) {
    RadAngle=MyAngle*ConversionFactor;               // 8 bit angle converted to radians
    SineValues[MyAngle]=(sin(RadAngle)*127)+128;  // get the sine of this angle and 'shift' up so
                                            // there are no negative values in the data
                                            // as the DAC does not understand them and would
                                            // convert to positive values.
  }*/
  
  ledcSetup(channel, freq, resolution);
  ledcAttachPin(trigger_outPIN_US, channel);
}
void setup_GPIO(){
  //init
  //high pin before sync    20 GPIO05
  //out pin to trigger event 12 
  //in pin mode select      18 GPIO00
  //in pin to detect trigger event   13 GPIO02
  pinMode(5, OUTPUT);
  pinMode(trigger_outPIN, OUTPUT);
  //pinMode(trigger_outPIN_US, OUTPUT);
  pinMode(trigger_selctPIN, INPUT_PULLUP);
  pinMode(trigger_selctPIN_US, INPUT_PULLUP);
  pinMode(mode_selctPIN, INPUT);

  digitalWrite(trigger_outPIN,LOW);

  mode_select = digitalRead(mode_selctPIN);   // read the input pin
}

void setup() {  
  Serial.begin(115200);
  Serial.println();
  delay(100);
  Serial.println("start WiFi");
  while (!startWiFi()){delay(1500);}
  
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  Serial.println("Connected to wifi");
  
  Udp.begin(localPort);

  unsigned long wait= get_ms();
  //while (wait>=999)
  wait= get_ms();

  Serial.println(wait);

  setup_sinGen();
  setup_GPIO();

  Serial.println("current ClockFrqu");
  setCpuFrequencyMhz(80);
  //Serial.println(esp_clk_cpu_freq());
}


unsigned long time_stamp;
unsigned long time_stamp2;
void loop() {  
  //time_stamp = get_ms(); <- usually takes 3ms
  
  //delay 1 sould ensure that the timing from freeRTOS is correct. ?????
  if(mode_select==0){
    trigger_cnt=0; 
    while(digitalRead(trigger_selctPIN)){}
    delay(11); 
    time_stamp = get_ms();
    while(digitalRead(trigger_selctPIN_US)){
      trigger_cnt=trigger_cnt+1;
      if(trigger_cnt>=size_of_uint)
        trigger_cnt=0;
    }
    Serial.println(time_stamp);    
    Serial.println(trigger_cnt);
    Serial.println((double)(trigger_cnt*clk_time_multi)/1000000000);
    Serial.println(0.0005118812763042990860*(float)trigger_cnt);    
  }else{
    Serial.println("start_output:");
    digitalWrite(trigger_outPIN,HIGH);
    delay(1);
    digitalWrite(trigger_outPIN,LOW);
    time_stamp = get_ms();
    delay(100);
    ledcWriteTone(channel, freq);
    delay(5000);
    /*digitalWrite(trigger_outPIN_US,HIGH);
    delay(10);
    digitalWrite(trigger_outPIN_US,LOW);*/
    
    Serial.println("time stamp from signal begin finish:");  
    Serial.println(time_stamp); 
  }

  delay(1000);
}

unsigned long sendNTPpacket(IPAddress& address) {
  //Serial.println("1");
  // set all bytes in the buffer to 0
  memset(packetBuffer, 0, NTP_PACKET_SIZE);
  // Initialize values needed to form NTP request
  // (see URL above for details on the packets)
  //Serial.println("2");
  packetBuffer[0] = 0b11100011;   // LI, Version, Mode
  packetBuffer[1] = 0;     // Stratum, or type of clock
  packetBuffer[2] = 6;     // Polling Interval
  packetBuffer[3] = 0xEC;  // Peer Clock Precision
  // 8 bytes of zero for Root Delay & Root Dispersion
  packetBuffer[12]  = 49;
  packetBuffer[13]  = 0x4E;
  packetBuffer[14]  = 49;
  packetBuffer[15]  = 52;

  //Serial.println("3");

 // all NTP fields have been given values, now
  // you can send a packet requesting a timestamp:
  Udp.beginPacket(address, 123); //NTP requests are to port 123
  //Serial.println("4");
  Udp.write(packetBuffer, NTP_PACKET_SIZE);
  //Serial.println("5");
  Udp.endPacket();
  //Serial.println("6");
}

unsigned long get_ms()
{
  unsigned long read_ms=0;
  IPAddress timeServerIP;
  WiFi.hostByName("pool.ntp.org", timeServerIP); 

  sendNTPpacket(timeServerIP); // send an NTP packet to a time server
  // wait to see if a reply is available
    
  uint32_t beginWait = millis();
  while (millis() - beginWait < 1001) {
    int tam = Udp.parsePacket();
    if (tam >= NTP_PACKET_SIZE) {
      Udp.read(packetBuffer, NTP_PACKET_SIZE);  // read packet into the buffer
      uint32_t frac  = (uint32_t) packetBuffer[44] << 24
               | (uint32_t) packetBuffer[45] << 16
               | (uint32_t) packetBuffer[46] <<  8
               | (uint32_t) packetBuffer[47] <<  0;
      uint16_t mssec = ((uint64_t) frac * 1000) >> 32;
      read_ms=(word)mssec;
    }
  }
  return read_ms;
}


bool startWiFi(void)
{
  WiFi.begin(ssid, password);
  delay(100);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
 }
