#include <SPI.h>
#include "jtag.h"
//#include <WiFi.h>
#include <WiFiNINA.h>

// For High level functions such as pinMode or digitalWrite, you have to use FPGA_xxx
// Low level functions (in jtag.c file) use other kind of #define (TDI,TDO,TCK,TMS) with different values
#define FPGA_TDI                            (26u)
#define FPGA_TDO                            (29u)
#define FPGA_TCK                            (27u)
#define FPGA_TMS                            (28u)

// Clock send by SAMD21 to the FPGA
#define FPGA_CLOCK                        (30u)

// SAMD21 to FPGA control signal (interrupt ?)
#define FPGA_MB_INT                       (31u)

// FPGA to SAMD21 control signal (interrupt ?)
#define FPGA_INT                          (33u) //B2 N2

// For MKR pinout assignments see : https://systemes-embarques.fr/wp/brochage-connecteur-mkr-vidor-4000/

extern void enableFpgaClock(void);

#define SPI_WRITE_COMMAND                 (1<<7)
#define ADDR_PERIPH_PWM                   (1<<3)
#define ADDR_SPI_REG_1                    0
#define ADDR_SPI_REG_2                    1

#define no_data    0xFF, 0xFF, 0xFF, 0xFF, \
          0xFF, 0xFF, 0xFF, 0xFF, \
          0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, \
          0xFF, 0xFF, 0xFF, 0xFF, \
          0x00, 0x00, 0x00, 0x00  \

#define NO_BOOTLOADER   no_data
#define NO_APP        no_data
#define NO_USER_DATA    no_data

__attribute__ ((used, section(".fpga_bitstream_signature")))
const unsigned char signatures[4096] = {
  //#include "signature.ttf"
  NO_BOOTLOADER,

  0x00, 0x00, 0x08, 0x00,
  0xA9, 0x6F, 0x1F, 0x00,   // Don't care.
  0x20, 0x77, 0x77, 0x77, 0x2e, 0x73, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x65, 0x73, 0x2d, 0x65, 0x6d, 0x62, 0x61, 0x72, 0x71, 0x75, 0x65, 0x73, 0x2e, 0x66, 0x72, 0x20, 0x00, 0x00, 0xff, 0xf0, 0x0f,
  0x01, 0x00, 0x00, 0x00,   
  0x01, 0x00, 0x00, 0x00,   // Force

  NO_USER_DATA,
};
__attribute__ ((used, section(".fpga_bitstream")))
const unsigned char bitstream[] = {
  #include "app.h"
};

const int slaveSelectPin = FPGA_MB_INT;

unsigned char PWM_Puls;
char PWM_IncDir;


//NETWORKSETUP
int status = WL_IDLE_STATUS;
char ssid[] = "roboy";        // your network SSID (name)
char pass[] = "wiihackroboy";    // your network password (use for WPA, or use as key for WEP)
int keyIndex = 0;
void wlan_setup();


void wlan_setup(){
   // check for the WiFi module:
  if (WiFi.status() == WL_NO_MODULE) {
    Serial.println("Communication with WiFi module failed!");
    // don't continue
    while (true);
  }

  String fv = WiFi.firmwareVersion();
  if (fv < "1.0.0") {
    Serial.println("Please upgrade the firmware");
  }

  // attempt to connect to Wifi network:
  while (status != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
    status = WiFi.begin(ssid, pass);

    // wait 10 seconds for connection:
    delay(10000);
  }

  Serial.println("Connected to wifi");
  //printWifiStatus();


}

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.println("Start setup");
  int ret;
  uint32_t ptr[1];

  enableFpgaClock();
  
  //Init Jtag Port
  ret = jtagInit();
  mbPinSet();

  // Load FPGA user configuration
  ptr[0] = 0 | 3;
  mbEveSend(ptr, 1);

  // Give it delay
  delay(1000);

  // Configure onboard LED Pin as output
  pinMode(LED_BUILTIN, OUTPUT);

  // Disable all JTAG Pins (usefull for USB BLASTER connection)
  pinMode(FPGA_TDO, INPUT);
  pinMode(FPGA_TMS, INPUT);
  pinMode(FPGA_TDI, INPUT);
  pinMode(FPGA_TCK, INPUT);


  // Configure other share pins as input too
  pinMode(FPGA_INT, INPUT);


  // Positionne le SS de la liaison SPI vers le FPGA en sortie
  pinMode (slaveSelectPin, OUTPUT);
  
  // initialise la liaison SPI
  SPI.begin();

  // Rapport cyclique
  PWM_Puls = 0; 
  // Increment / Decrement
  PWM_IncDir = 1;

  // SS : Par defaut on adresse pas le FPGA
  digitalWrite(slaveSelectPin, HIGH);

  // ADDR_SPI_REG_2[7:0] = Rapport cyclique. Initialise a 0%
  SPIFPGAWrite(SPI_WRITE_COMMAND | ADDR_PERIPH_PWM | ADDR_SPI_REG_2 , 0);

     
  // ADDR_SPI_REG_1[7] = PWM ON/OFF, ADDR_SPI_REG_1[3:0] = Prediviseur d'horloge
  // Pour une frequence FPGA = 80Mhz (non fiable). Prediviseur =
  // 0  : 156.25 Khz
  // 1  : 78.125 Khz
  // ...
  // 15 : 4.77 Hz
  SPIFPGAWrite(SPI_WRITE_COMMAND | ADDR_PERIPH_PWM | ADDR_SPI_REG_1, 128 + 1);   

  
  wlan_setup();

}


void SPIFPGAWrite(int adresse, int valeur) {

  // Selectionne le SS du FPGA
  digitalWrite(slaveSelectPin, LOW);
  
  //  Envoi la commande et la donnee
  //  Avec la configuration actuelle du FPGA : 1 seule donnee
  SPI.transfer(adresse);
  SPI.transfer(valeur);

  // Deselectionne le SS du FPGA
  digitalWrite(slaveSelectPin, HIGH);
}

// the loop function runs over and over again forever
void loop() {
        //Serial.println("random");
       delay(50);                     
       PWM_Puls+= PWM_IncDir;
       
       // Change de direction a 75% de rapport cyclique
       if ((PWM_Puls == 0) || (PWM_Puls==191)) PWM_IncDir *= -1;

       // Ecriture du nouveau rapport cyclique
       SPIFPGAWrite(SPI_WRITE_COMMAND | ADDR_PERIPH_PWM | ADDR_SPI_REG_2, PWM_Puls);   

}
