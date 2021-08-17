#include <LiquidCrystal.h>
#include <Wire.h>
#include "Caracteres.h"

const int rs = 13, en = 12, d4 = 6, d5 = 5, d6 = 4, d7 = 3;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

char palabra[10];
int  pinm1 = 10;
int  pinm2 = 9;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //puertos para los motores
  pinMode(pinm1, OUTPUT);
  pinMode(pinm2, OUTPUT);
  //inicializar el wire en el "puerto" 23
  Wire.begin(23);
  //inicializar pantalla lcd 2
  lcd.begin(16, 2);
  lcd.setCursor(4, 0);
  lcd.print("APAGADO");

  //Wire.onRequest(); //me piden datos
  Wire.onReceive(encenderCasa);//me mandan datos
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(100);
  /*
    lcd.print("hola");
    delay(500);
    lcd.clear();
  */
}

void encenderCasa() {

  lcd.clear();
  lcd.setCursor(0, 0);
  char c = Wire.read();
  Serial.print(c);
  if (c == 'A') {
    lcd.setCursor(4, 0);
    lcd.print("APAGADO");
    digitalWrite(pinm1, LOW);
    digitalWrite(pinm2, LOW);
  } else {
    int t = c;
    lcd.setCursor(0, 0);
    lcd.print("TEMP : ");
    lcd.print(t);
    lcd.createChar(0, cen);
    lcd.setCursor(10, 0);
    lcd.write((byte)0);
    lcd.print("C");
    if (t <= 18) {
      lcd.setCursor(0, 1);
      lcd.print("NIVEL : 1 ");
      digitalWrite(pinm1, LOW);
      digitalWrite(pinm2, LOW);
    } else if (t > 18 && t < 25 ) {
      lcd.setCursor(0, 1);
      lcd.print("NIVEL : 2 ");
      digitalWrite(pinm1, HIGH);
      digitalWrite(pinm2, LOW);
    } else {
      lcd.setCursor(0, 1);
      lcd.print("NIVEL : 3 ");
      digitalWrite(pinm1, HIGH);
      digitalWrite(pinm2, HIGH);
    }
  }
  /*
    lcd.clear();
    lcd.setCursor(0, 0);
    while (1 < Wire.available()) {
    char c = Wire.read();
    lcd.print(c);
    Serial.print(c);
    }
    delay(500);
  */
}
