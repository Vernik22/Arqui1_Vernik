#include <Keypad.h>
#include <LiquidCrystal_I2C.h>
#include <Wire.h>
#include "Caracteres.h"


LiquidCrystal_I2C lcd(0x20, 16, 2);

const byte filas = 4;
const byte col = 3;

char keys[filas][col] = {
  {'1', '2', '3'},
  {'4', '5', '6'},
  {'7', '8', '9'},
  {'*', '0', '#'}
};

byte filasPin[filas] = {10, 9, 8, 7};
byte colPin[col] = {13, 12, 11};

String contra_pad= "";

Keypad key = Keypad(makeKeymap(keys), filasPin, colPin, filas, col);
char pass[6];
int pos = 0;
int estado = 0;
int tempC = 0;

// contraseña para nosotros 202118

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //iniciar el wire para i2c con otro arduino
  Wire.begin();
  //inicializar pantalla lcd1
  lcd.init();
  lcd.backlight();
  lcd.setCursor(3, 0);
  lcd.print("CASA ACYE1");
  lcd.setCursor(4, 1);
  lcd.print("A-G18-S2");

  //inicializar el sensor de temperatura
  Wire.beginTransmission(0x48);
  Wire.write(0xAC);
  Wire.write(0x02);
  Wire.beginTransmission(0x48);
  Wire.write(0xEE);
  Wire.endTransmission();
}

void loop() {
  // put your main code here, to run repeatedly:
  char lectura = key.getKey();
  
  if (lectura) {

    lcd.clear();    
    if (lectura == '#') {
      // apagar todos los circuitos
      resetPass();   
      pos = 0 ;
      estado = 0;
      contra_pad= "";
      pantalla();

      Wire.beginTransmission(23);
      Wire.write('A');
      Wire.endTransmission();
      delay(200);


    } else if (lectura != '*') {
      pass[pos] = lectura;
      contra_pad+=lectura;
      pos = pos + 1 ;
      lcd.setCursor(4,0);
      lcd.print("PASSWORD");
      lcd.setCursor(3,1);
      lcd.print(contra_pad);
    } else {
      //mandar a llamar al metodo que verifica si la contraseña es correcta
      if (verificarPass()) {
        estado = 1;
        lcd.clear();
        lcd.setCursor(2, 0);
        lcd.print("BIENVENIDO A ");
        lcd.setCursor(6, 1);
        lcd.print("CASA");

        //inicio transmision en el puerto 23, envio una cadena y cierro la transmision
        /*
                char en[9] = "ENCENDIDO";
                for (byte i = 0; i < 9; i++) {
                  Wire.beginTransmission(23);
                  Wire.write(en[i]);
                  Wire.endTransmission();
                  delay(200);
                }
        */
        temperatura();
        char t = tempC;

        Wire.beginTransmission(23);
        Wire.write(t);
        Wire.endTransmission();
        delay(200);

      } else {
        estado = 0;
        lcd.clear();
        lcd.setCursor(4, 0);
        lcd.print("ERROR EN");
        lcd.setCursor(3, 1);
        lcd.print("CONTRASE A");
        lcd.createChar(0, enie);
        lcd.setCursor(11, 1);
        lcd.write((byte)0);
        resetPass();
        contra_pad= "";
        pos = 0 ;
        delay(500);
        pantalla();
      }
    }

  } else if (estado == 1) { //leer temperatura
    temperatura();
    char t = tempC;
    Wire.beginTransmission(23);
    Wire.write(t);
    Wire.endTransmission();
    delay(100);
  }

}

// contraseña para nosotros 202118

bool verificarPass() {
  if (pos == 6) {
    if (pass[0] == '2' && pass[1] == '0' && pass[2] == '2' && pass[3] == '1' && pass[4] == '1' && pass[5] == '8') {
      estado = 1;
      return true;
    } else return false;

  } else {
    return false;
  }
}

void resetPass() {
  for (int i = 0; i < 6 ; i++) {
    pass[i] = "";
  }
  contra_pad= "";
}

void temperatura() {
  Wire.beginTransmission(0x48);
  Wire.write(0xAA);
  Wire.endTransmission();
  Wire.requestFrom(0x48, 1);
  tempC = Wire.read();
  delay(200);
}

void pantalla() {
  lcd.clear();
  lcd.setCursor(3, 0);
  lcd.print("CASA ACYE1");
  lcd.setCursor(4, 1);
  lcd.print("A-G18-S2");
}
