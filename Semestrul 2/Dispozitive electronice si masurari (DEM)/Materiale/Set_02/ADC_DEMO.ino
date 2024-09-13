int Sensor_0;
float Sensor_0_converted = 0.000;
char Sensor_A0[8];
String ON;


void setup() {
  // put your setup code here, to run once:
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  ON = "STOP";
}

void loop() {
  
 // put your main code here, to run repeatedly:
  if (Serial.available() > 0) 
      {
         // get incoming GO string
         ON = Serial.readString();
         if (ON == "GO")
         {      Serial.println("RUNNING...");
                delay(50);
                Serial.flush();
                delay(50);
                while (ON != "STOP") {
                      // put your main code here, to run repeatedly:
                      delay(2000);
                      // read the input on analog pin 0:
                      Sensor_0 = analogRead(A1);
                      Serial.print("Digital code->");
                      Serial.print(Sensor_0);
                      Serial.print("   Binary value->");
                      Serial.print(Sensor_0, BIN);
                      Sensor_0_converted = ((Sensor_0+0.5)/1024.0) *5.0;
                      // print out the value you read:
                      dtostrf(Sensor_0_converted,4,3,Sensor_A0);
                      Serial.print("   Voltage value->");
                      Serial.println(Sensor_A0);
                     ON = Serial.readString();
                      if (ON == "STOP")
                      {
                        Serial.println("PAUSED...");
                        }
                    }
         }
         
      }
}
