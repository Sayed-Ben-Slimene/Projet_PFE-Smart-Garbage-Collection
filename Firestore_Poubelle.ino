#include "heltec.h"
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <TinyGPS++.h>
#include <HardwareSerial.h>

// static const int RXPin = 12, TXPin = 11;  //(rx de gps ---> 3--11 / tx de gps ---> 4--12)

#if defined(ESP32)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif
#include <Firebase_ESP_Client.h>

// Provide the token generation process info.
#include <addons/TokenHelper.h>

/* 1. Define the WiFi credentials */
#define WIFI_SSID "SAYED_BEN_SLIMENE"
#define WIFI_PASSWORD "Oo98765443"

/* 2. Define the API Key */
#define API_KEY "AIzaSyA0IGyoIXpmZ8DCSJj10aAwAkDEqvv4sfY"

/* 3. Define the project ID */
#define FIREBASE_PROJECT_ID "smart-garbage-collection-73f9e"

/* 4. Define the user Email and password that alreadey registerd or added in your project */
#define USER_EMAIL "esp32lora@gmail.com"
#define USER_PASSWORD "esp32LORA!!"

// Define Firebase Data object
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

// Define GPS
static const int RXPin = 4, TXPin = 3;

static const uint32_t GPSBaud = 9600;

// The TinyGPS++ object
TinyGPSPlus gps;
// The serial connection to the GPS device
HardwareSerial ss(RXPin, TXPin);

unsigned long dataMillis = 0;
const int trigPin = 5;
const int echoPin = 18;

double Longitude = 11.031110317580845, Latitude =35.52407102610215 ;

//OLED pins
#define OLED_SDA 4
#define OLED_SCL 15 
#define OLED_RST 16
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RST);

//define sound speed in cm/uS
#define SOUND_SPEED 0.034


long duration;
float distanceCm;
String etat;
int valeur;

bool taskcomplete = false;
//define sound speed in cm/uS
#define SOUND_SPEED 0.034
int pulsation=500;

  
void setup()
{

  Serial.begin(115200); // Starts the serial communication
    ss.begin(GPSBaud);
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    Serial.print("Connecting to Wi-Fi");
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        delay(300);
    }
    Serial.println();
    Serial.print("Connected with IP: ");
    Serial.println(WiFi.localIP());
    Serial.println();

    Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

    /* Assign the api key (required) */
    config.api_key = API_KEY;

    /* Assign the user sign in credentials */
    auth.user.email = USER_EMAIL;
    auth.user.password = USER_PASSWORD;

    /* Assign the callback function for the long running token generation task */
    config.token_status_callback = tokenStatusCallback; // see addons/TokenHelper.h

#if defined(ESP8266)
    // In ESP8266 required for BearSSL rx/tx buffer for large data handle, increase Rx size as needed.
    fbdo.setBSSLBufferSize(2048 /* Rx buffer size in bytes from 512 - 16384 */, 2048 /* Tx buffer size in bytes from 512 - 16384 */);
#endif

    // Limit the size of response payload to be collected in FirebaseData
    fbdo.setResponseSize(2048);

    Firebase.begin(&config, &auth);

    Firebase.reconnectWiFi(true);

     //OLED DISPLAY
    Heltec.begin(true /*DisplayEnable Enable*/, false /*LoRa Disable*/, true /*Serial Enable*/);
    pinMode(OLED_RST, OUTPUT);
    digitalWrite(OLED_RST, LOW);
    delay(20);
    digitalWrite(OLED_RST, HIGH);

    Wire.begin(OLED_SDA, OLED_SCL);
    if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3c, false, false)) { // Address 0x3C for 128x32
      Serial.println(F("SSD1306 allocation failed"));
      for(;;); // Don't proceed, loop forever
  }
  
  Heltec.display->flipScreenVertically();
  Heltec.display->setFont(ArialMT_Plain_10);

  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
   
}

void loop()
{
  // This sketch displays information every time a new sentence is correctly encoded.
  while (ss.available() > 0){
    gps.encode(ss.read());
    if (gps.location.isUpdated()){
      Serial.print("Latitude= ");
      Serial.print(gps.location.lat(), 6);
      Serial.print(" Longitude= ");
      Serial.println(gps.location.lng(), 6);
    }
  }
 // clear the display
  Heltec.display->clear();
  // draw the current demo method
  Heltec.display->setTextAlignment(TEXT_ALIGN_RIGHT);
  Heltec.display->drawString(10, 128, String(millis()));
  // write the buffer to the display
  Heltec.display->display();

  delay(10);
  // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  
  // Calculate the distance
  distanceCm = duration * SOUND_SPEED/2;
  // Prints the distance in the Serial Monitor

  if (distanceCm <=20){
    valeur=100;
    etat="Plain !";  
}else if (distanceCm > 20 && distanceCm <=40){
etat="PresPlain !"; 
valeur=75;  
  }else if(distanceCm > 40 && distanceCm <=60){
    valeur=50;
    etat="PresMoyen"; 
  } else if(distanceCm > 60 && distanceCm <=80){
    valeur=25;
    etat="presvide"; 
  }else if(distanceCm > 80){
    valeur=0;
    etat="vide";
  }
  Serial.print("Distance (cm): ");
  Serial.println(int(distanceCm));
  Serial.println("etat poubelle ");
  
  Serial.println(etat);
  
  Heltec.display->setFont(ArialMT_Plain_10);
  Heltec.display->setTextAlignment(TEXT_ALIGN_CENTER);
  display.clearDisplay();
  display.setTextColor(WHITE);
  display.setTextSize(1,2);
  display.setCursor(0,0);
  display.print("Distance : ");
  display.display();
   display.setTextSize(1,2);
  display.setCursor(70,0);
  display.print(int(distanceCm));
  display.display();
 display.setCursor(30,20);
  display.print(etat);
   display.display();
    display.setCursor(30,40);
  display.print(valeur);
   display.display();
 // Heltec.display->(64, 22, distanceCm);
  
  delay(3000);                                                                                                                   int    number = random(50, 90);
                                                                                                                        delay(50);

    
    // Firebase.ready() should be called repeatedly to handle authentication tasks.

    if (Firebase.ready() && (millis() - dataMillis > 15000 || dataMillis == 0))
    {
        dataMillis = millis();

        // For the usage of FirebaseJson, see examples/FirebaseJson/BasicUsage/Create.ino
        FirebaseJson content;

        // aa is the collection id, bb is the document id.
        String documentPath = "data/0k3LWgHIV4Zs4QgQ0Orc";

        // If the document path contains space e.g. "a b c/d e f"
        // It should encode the space as %20 then the path will be "a%20b%20c/d%20e%20f"

        if (!taskcomplete)
        {
            taskcomplete = true;

            content.clear();
            content.set("data/Latitude/doubleValue", Latitude);
            content.set("data/Longitude/doubleValue", Longitude);
            content.set("data/etat/stringValue", etat);
            content.set("data/pourcentage/integerValue", valeur);
            content.set("data/name/stringValue", "bin test");

            Serial.print("Create a document... ");

            if (Firebase.Firestore.createDocument(&fbdo, FIREBASE_PROJECT_ID, "" /* databaseId can be (default) or empty */, documentPath.c_str(), content.raw()))
                Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
            else
                Serial.println(fbdo.errorReason());
        }

             content.clear();
            content.set("data/Latitude/doubleValue", Latitude);
            content.set("data/Longitude/doubleValue", Longitude);
            content.set("data/etat/stringValue", etat);
            content.set("data/pourcentage/integerValue", valeur);
            content.set("data/name/stringValue", "bin test");

             Serial.print("Update a Smart... ");

        /** if updateMask contains the field name that exists in the remote document and
         * this field name does not exist in the document (content), that field will be deleted from remote document
         */

        if (Firebase.Firestore.patchDocument(&fbdo, FIREBASE_PROJECT_ID, "" /* databaseId can be (default) or empty */, documentPath.c_str(), content.raw(), "pulsation,Latitude,Longitude,buttonstat" /* updateMask */))
            Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
        else
            Serial.println(fbdo.errorReason());
    }
}
