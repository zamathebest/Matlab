//LEGGE CIO CHE CI STA SUL BUFFER DI LETTURA DEL BLUETOOTH
//Rx BT al 12
//Tx BT all'11
/*
   Arduino Bluetooth HC-05 Base
   Semplice programmino per vedere come Arduino scambia dati attraverso il modulo bluetooth HC-05

   Autore  : Andrea Lombardo
   Web     : http://www.lombardoandrea.com
   Post    : http://adf.ly/12267939/arduino-hc-05-base
   Git     : https://github.com/AndreaLombardo/Arduino-HC-05_Base
*/

//Includo libreria SoftwareSerial
#include <SoftwareSerial.h>

//definisco pin RX e TX da Arduino verso modulo BT
#define BT_TX_PIN 12
#define BT_RX_PIN 11
String testo="#";
byte inbyte=0;
//istanzio oggetto SoftwareSerial (il nostro futuro bluetooth)
SoftwareSerial bt =  SoftwareSerial(BT_RX_PIN, BT_TX_PIN);

void setup() {

  //definisco modalità pin
  pinMode(BT_RX_PIN, INPUT);
  pinMode(BT_TX_PIN, OUTPUT);

  //inizializzo comunicazione Seriale
  Serial.begin(9600);

  //inizializzo comunicazione Bluetooth
  bt.begin(9600);

}

void loop() {
  //se ci sono dati sul buffer della Serial
  while (Serial.available() > 0) {
    //mandali al modulo bluetooth
    inbyte = Serial.read();
    if (inbyte == 35)//'#' IN CODICE ASCII
    {
      while(inbyte != 126)//finche diverso da "~"
      {
        inbyte = Serial.read();
            //inizio
            if (inbyte == 48)//'0' IN CODICE ASCII
          {
            testo=testo+"0";
            
          }
          if (inbyte == 49)//'1' IN CODICE ASCII
          {
            testo=testo+"1";
            
          }
          if (inbyte == 50)//'2' IN CODICE ASCII
          {
            testo=testo+"2";
            
          }
          if (inbyte == 51)//'3' IN CODICE ASCII
          {
            testo=testo+"3";
            
          }
          if (inbyte == 52)//'4' IN CODICE ASCII
          {
            testo=testo+"4";
            
          }
          if (inbyte == 53)//'5' IN CODICE ASCII
          {
            testo=testo+"5";
            
          }
          if (inbyte == 54)//'6' IN CODICE ASCII
          {
            testo=testo+"6";
            
          }
          if (inbyte == 55)//'7' IN CODICE ASCII
          {
           testo=testo+"7"; 
            
          }
          if (inbyte == 56)//'8' IN CODICE ASCII
          {
            testo=testo+"8";
            
          }
          if (inbyte == 57)//'9' IN CODICE ASCII
          {
            testo=testo+"9";
            
          }
          if (inbyte == 46)//'.' IN CODICE ASCII
          {
            testo=testo+".";
            
          }
          if (inbyte == 43)//'+' IN CODICE ASCII
          {
            testo=testo + "+";
            
          }
      }
      testo=testo+"~";
      bt.print(testo);
      testo="#";
    }
  }

  //se ci sono dati sul buffer SoftwareSerial (il buffer del bluetooth)
  while (bt.available() > 0) {
    //mostrali nel Serial Monitor
    Serial.println(bt.read());
  }
}
