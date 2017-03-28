//import OSCuino libraries
#include <OSCBundle.h>
#include <OSCData.h>
#include <OSCMatch.h>
#include <OSCMessage.h>

#if defined(CORE_TEENSY) || defined(_AVR_ATmega32U4)
#include <SLIPEncodedUSBSerial.h>
SLIPEncodedUSBSerial SLIPSerial(Serial);
#else
#include <SLIPEncodedSerial.h>
SLIPEncodedSerial SLIPSerial(Serial);
#endif

void setup(){
  //read at 38400 b/sec
  Serial.begin(38400);
  //the port needs to be connected for this to work
  while(!Serial)
    ;
}

void loop(){
  float in;
  //first message, communicates with reaktor Knob1
  OSCMessage msg1("/Knob1");
  in = analogRead(0);
  //'in' needs to be constrained to the knob's limits 
  //operating between 0.000 and 1.000 
  msg1.add(in);
  msg1.send(SLIPSerial);
  SLIPSerial.endPacket();
  msg1.empty();
  
  //second message, communicates with reaktor Knob2
  OSCMessage msg2(" /Knob2");
  in = analogRead(1);
  msg2.add(in);
  msg2.send(SLIPSerial); 
  SLIPSerial.endPacket();
  msg2.empty();
  
  //third message, communicates with reaktor Knob3
  OSCMessage msg3(" /Knob3");
  in = analogRead(2);
  msg3.add(in);
  msg3.send(SLIPSerial);
  SLIPSerial.endPacket();
  msg3.empty();
  
  //fourth message, communicates with reaktor Knob4
  OSCMessage msg4(" /Knob4");
  in = analogRead(3);
  msg4.add(in);
  msg4.send(SLIPSerial);
  SLIPSerial.endPacket();
  msg4.empty();
  
  delay(20);
}