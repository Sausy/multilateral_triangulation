//#include <NTP.h>
/*#include <WiFi.h>
#include <WiFiUdp.h>
#include <esp_pm.h>

#define size_of_uint 4294967295
#define clk_time_multi 4 //(1/240*10^-3)=4.16666666

unsigned int diff_time=0;

const char* ssid = "roboy";
const char* password = "wiihackroboy";

bool startWiFi(void);

int mode_select=0;
const int mode_selctPIN=23;
const int trigger_selctPIN=13;
unsigned int trigger_cnt=0;
const int trigger_outPIN=12;

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
int freq = 2000;
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
  }*//*
  ledcSetup(channel, freq, resolution);
  ledcAttachPin(dac_pin, channel);
}
void setup_GPIO(){
  //init
  //high pin before sync    20 GPIO05
  //out pin to trigger event 12 
  //in pin mode select      18 GPIO00
  //in pin to detect trigger event   13 GPIO02
  pinMode(5, OUTPUT);
  pinMode(trigger_outPIN, OUTPUT);
  pinMode(mode_selctPIN, INPUT);
  pinMode(trigger_selctPIN, INPUT_PULLUP);

  digitalWrite(trigger_outPIN,HIGH);

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
void loop() {  

  
  time_stamp = get_ms();
  //Serial.println(foo);
  //WiFi.mode(WIFI_OFF);
  
  if(mode_select==0){
    trigger_cnt=0;
    Serial.println("wait till sync");
    while(digitalRead(trigger_selctPIN)){ }
    delay(5000);
    //time_stamp = get_ms();
    
    while(digitalRead(trigger_selctPIN)){
      trigger_cnt=trigger_cnt+1;
      if(trigger_cnt>=size_of_uint)
        trigger_cnt=0;
    }
        
    Serial.println(trigger_cnt);
    Serial.println((double)(trigger_cnt*clk_time_multi)/1000000000);
    Serial.println(0.0005118812763042990860*(float)trigger_cnt);
    //todo restart wifi
    
    
  }else{
    Serial.println("started  with out");
    digitalWrite(trigger_outPIN,LOW);
    delay(1);
    digitalWrite(trigger_outPIN,HIGH);
    delay(5050);
    digitalWrite(trigger_outPIN,LOW);
    delay(10);
    digitalWrite(trigger_outPIN,HIGH);
    Serial.println("finished out");
    
    //Serial.println("output freq: ");
    /*for (int freq = 20000; freq <= 30000; freq = freq + 1000){
       Serial.println(freq);
       ledcWriteTone(channel, freq);
       delay(1000);
    }*/
    /*Serial.println("counter start impuls");
    ledcWrite(channel, 0); 
    ledcWriteTone(channel, 1000);
    delay(10000);
    Serial.println("stop");
    ledcWriteTone(channel, 0);
    delay(500);
    ledcWriteTone(channel, 1000);
    delay(100);
    ledcWriteTone(channel, 0);
    delay(1000);*//*
    
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
    //  Serial.println("Receive NTP Response");
    Udp.read(packetBuffer, NTP_PACKET_SIZE);  // read packet into the buffer
      
    //  unsigned long highWord = word(packetBuffer[40], packetBuffer[41]); //this is for hours,min,seconds etc. I don't need that.
    // unsigned long lowWord = word(packetBuffer[42], packetBuffer[43]);

      unsigned long otherHighword = word(packetBuffer[44], packetBuffer[45]);
      
      unsigned long otherLowWord = word(packetBuffer[46], packetBuffer[47]);
      unsigned long fractional = otherHighword << 16 | otherLowWord;
      float read_msF =(float)fractional*2.3283064365387E-07; // fractional*(1000/2^32) to get milliseconds. 
      
       //read_ms=word(packetBuffer[44], packetBuffer[45])>>6;
      // Serial.print("ms: short ");Serial.println(read_ms);
      read_ms=(word)(read_msF);
      //Serial.print("ms: real ");Serial.println(read_ms);
      
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
 }*/
