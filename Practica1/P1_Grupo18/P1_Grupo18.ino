#include <MaxMatrix.h>
PROGMEM const unsigned char CH[] = {
  3, 8, B00000000, B00000000, B00000000, B00000000, B00000000, // space
  1, 8, B01011111, B00000000, B00000000, B00000000, B00000000, // !
  3, 8, B00000011, B00000000, B00000011, B00000000, B00000000, // "
  5, 8, B00010100, B00111110, B00010100, B00111110, B00010100, // #
  4, 8, B00100100, B01101010, B00101011, B00010010, B00000000, // $
  5, 8, B01100011, B00010011, B00001000, B01100100, B01100011, // %
  5, 8, B00110110, B01001001, B01010110, B00100000, B01010000, // &
  1, 8, B00000011, B00000000, B00000000, B00000000, B00000000, // '
  3, 8, B00011100, B00100010, B01000001, B00000000, B00000000, // (
  3, 8, B01000001, B00100010, B00011100, B00000000, B00000000, // )
  5, 8, B00101000, B00011000, B00001110, B00011000, B00101000, // *
  5, 8, B00001000, B00001000, B00111110, B00001000, B00001000, // +
  2, 8, B10110000, B01110000, B00000000, B00000000, B00000000, // ,
  4, 8, B00001000, B00001000, B00001000, B00001000, B00000000, // -
  2, 8, B01100000, B01100000, B00000000, B00000000, B00000000, // .
  4, 8, B01100000, B00011000, B00000110, B00000001, B00000000, // /
  4, 8, B00111110, B01000001, B01000001, B00111110, B00000000, // 0
  3, 8, B01000010, B01111111, B01000000, B00000000, B00000000, // 1
  4, 8, B01100010, B01010001, B01001001, B01000110, B00000000, // 2
  4, 8, B00100010, B01000001, B01001001, B00110110, B00000000, // 3
  4, 8, B00011000, B00010100, B00010010, B01111111, B00000000, // 4
  4, 8, B00100111, B01000101, B01000101, B00111001, B00000000, // 5
  4, 8, B00111110, B01001001, B01001001, B00110000, B00000000, // 6
  4, 8, B01100001, B00010001, B00001001, B00000111, B00000000, // 7
  4, 8, B00110110, B01001001, B01001001, B00110110, B00000000, // 8
  4, 8, B00000110, B01001001, B01001001, B00111110, B00000000, // 9
  2, 8, B01010000, B00000000, B00000000, B00000000, B00000000, // :
  2, 8, B10000000, B01010000, B00000000, B00000000, B00000000, // ;
  3, 8, B00010000, B00101000, B01000100, B00000000, B00000000, // <
  3, 8, B00010100, B00010100, B00010100, B00000000, B00000000, // =
  3, 8, B01000100, B00101000, B00010000, B00000000, B00000000, // >
  4, 8, B00000010, B01011001, B00001001, B00000110, B00000000, // ?
  5, 8, B00111110, B01001001, B01010101, B01011101, B00001110, // @
  4, 8, B01111110, B00010001, B00010001, B01111110, B00000000, // A
  4, 8, B01111111, B01001001, B01001001, B00110110, B00000000, // B
  4, 8, B00111110, B01000001, B01000001, B00100010, B00000000, // C
  4, 8, B01111111, B01000001, B01000001, B00111110, B00000000, // D
  4, 8, B01111111, B01001001, B01001001, B01000001, B00000000, // E
  4, 8, B01111111, B00001001, B00001001, B00000001, B00000000, // F
  4, 8, B00111110, B01000001, B01001001, B01111010, B00000000, // G
  4, 8, B01111111, B00001000, B00001000, B01111111, B00000000, // H
  3, 8, B01000001, B01111111, B01000001, B00000000, B00000000, // I
  4, 8, B00110000, B01000000, B01000001, B00111111, B00000000, // J
  4, 8, B01111111, B00001000, B00010100, B01100011, B00000000, // K
  4, 8, B01111111, B01000000, B01000000, B01000000, B00000000, // L
  5, 8, B01111111, B00000010, B00001100, B00000010, B01111111, // M
  5, 8, B01111111, B00000100, B00001000, B00010000, B01111111, // N
  4, 8, B00111110, B01000001, B01000001, B00111110, B00000000, // O
  4, 8, B01111111, B00001001, B00001001, B00000110, B00000000, // P
  4, 8, B00111110, B01000001, B01000001, B10111110, B00000000, // Q
  4, 8, B01111111, B00001001, B00001001, B01110110, B00000000, // R
  4, 8, B01000110, B01001001, B01001001, B00110010, B00000000, // S
  5, 8, B00000001, B00000001, B01111111, B00000001, B00000001, // T
  4, 8, B00111111, B01000000, B01000000, B00111111, B00000000, // U
  5, 8, B00001111, B00110000, B01000000, B00110000, B00001111, // V
  5, 8, B00111111, B01000000, B00111000, B01000000, B00111111, // W
  5, 8, B01100011, B00010100, B00001000, B00010100, B01100011, // X
  5, 8, B00000111, B00001000, B01110000, B00001000, B00000111, // Y
  4, 8, B01100001, B01010001, B01001001, B01000111, B00000000, // Z
  2, 8, B01111111, B01000001, B00000000, B00000000, B00000000, // [
  4, 8, B00000001, B00000110, B00011000, B01100000, B00000000, // \ backslash
  2, 8, B01000001, B01111111, B00000000, B00000000, B00000000, // ]
  3, 8, B00000010, B00000001, B00000010, B00000000, B00000000, // hat
  4, 8, B01000000, B01000000, B01000000, B01000000, B00000000, // _
  2, 8, B00000001, B00000010, B00000000, B00000000, B00000000, // `
  4, 8, B00100000, B01010100, B01010100, B01111000, B00000000, // a
  4, 8, B01111111, B01000100, B01000100, B00111000, B00000000, // b
  4, 8, B00111000, B01000100, B01000100, B00101000, B00000000, // c
  4, 8, B00111000, B01000100, B01000100, B01111111, B00000000, // d
  4, 8, B00111000, B01010100, B01010100, B00011000, B00000000, // e
  3, 8, B00000100, B01111110, B00000101, B00000000, B00000000, // f
  4, 8, B10011000, B10100100, B10100100, B01111000, B00000000, // g
  4, 8, B01111111, B00000100, B00000100, B01111000, B00000000, // h
  3, 8, B01000100, B01111101, B01000000, B00000000, B00000000, // i
  4, 8, B01000000, B10000000, B10000100, B01111101, B00000000, // j
  4, 8, B01111111, B00010000, B00101000, B01000100, B00000000, // k
  3, 8, B01000001, B01111111, B01000000, B00000000, B00000000, // l
  5, 8, B01111100, B00000100, B01111100, B00000100, B01111000, // m
  4, 8, B01111100, B00000100, B00000100, B01111000, B00000000, // n
  4, 8, B00111000, B01000100, B01000100, B00111000, B00000000, // o
  4, 8, B11111100, B00100100, B00100100, B00011000, B00000000, // p
  4, 8, B00011000, B00100100, B00100100, B11111100, B00000000, // q
  4, 8, B01111100, B00001000, B00000100, B00000100, B00000000, // r
  4, 8, B01001000, B01010100, B01010100, B00100100, B00000000, // s
  3, 8, B00000100, B00111111, B01000100, B00000000, B00000000, // t
  4, 8, B00111100, B01000000, B01000000, B01111100, B00000000, // u
  5, 8, B00011100, B00100000, B01000000, B00100000, B00011100, // v
  5, 8, B00111100, B01000000, B00111100, B01000000, B00111100, // w
  5, 8, B01000100, B00101000, B00010000, B00101000, B01000100, // x
  4, 8, B10011100, B10100000, B10100000, B01111100, B00000000, // y
  3, 8, B01100100, B01010100, B01001100, B00000000, B00000000, // z
  3, 8, B00001000, B00110110, B01000001, B00000000, B00000000, // {
  1, 8, B01111111, B00000000, B00000000, B00000000, B00000000, // |
  3, 8, B01000001, B00110110, B00001000, B00000000, B00000000, // }
  4, 8, B00001000, B00000100, B00001000, B00000100, B00000000, // ~
};

int pin_analogo;
int pin_dip1 = 7, valorDip1 = 0, boton = 5;
int pin_dip2 = 6, valorDip2 = 0;
int segmento[7] = {22, 23, 24, 25, 26, 27, 28};

int pulsador = 0;

//Pines Data, Clock y Load
int data = 12;
int clock = 11;
int load = 10;

int maxInUse = 2; //numero de displays a usar
MaxMatrix m(data, load, clock, maxInUse); //instancia de la libreria MaxMatrix con los pines y el numero de displays
byte buffer[10];



char msg[] = "*P1_GRUPO18-SECCION A*"; //mensaje estatico
char virtualT[20];

//Numeros
boolean uno[7] = {false, true, true, false, false, false, false};
boolean dos[7] = {true, true, false, true, true, false, true};
boolean tres[7] = {true, true, true, true, false, false, true};
boolean cuatro[7] = {false, true, true, false, false, true, true};
boolean cinco[7] = {true, false, true, true, false, true, true};


void setup() {
  // put your setup code here, to run once:

  m.init();   //inicia la instancia
  m.setIntensity(15);  //brillo de los displays
  Serial.begin(9600); //puerto serial
  pin_analogo = A1;   //pin analogo A1
  pinMode(pin_dip1, INPUT); //pin digital 7
  pinMode(pin_dip2, INPUT); //pin digital 6
  pinMode(boton, INPUT); //pin digital 5 para el boton
  for (int i = 0; i < 7; i++) {
    pinMode(segmento[i], OUTPUT);
    digitalWrite(segmento[i], LOW);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  int lectura = analogRead(pin_analogo);
  int valor = lectura / 10;
  //Serial.println("Lectura Actual");
  //Serial.println(valor);

  int velocidad = procesar_numero(valor);
  pulsador = digitalRead(boton); // lee y guarda el valor del boton para el cambio de modo
  valorDip1 = digitalRead(pin_dip1); //lee y guarda el valor en el pin del dip 1
  valorDip2 = digitalRead(pin_dip2); // lee y guarda el valor en el pin del dip 2


  //verificacion de pulsador para modo estatico o modo de ingresar texto en la virtual terminal
  if (pulsador == HIGH) {
    if (Serial.available()) {
      size_t count = Serial.readBytesUntil('\n', virtualT, 20);
      String tex = virtualT;
      Serial.println(tex);
      if (valorDip1 == HIGH) {
        textoLetraLetra(virtualT, velocidad / 2); // llama al metodo para imprimir letra por letra el mensaje
      } else {
        if (valorDip2 == HIGH) {
          textoConMovimiento(virtualT, velocidad); //llama al metodo para imprimir el mensaje
        } else {
          //reversa();
          textoConMovimientoDer(virtualT, velocidad); //llama al metodo para imprimir el mensaje
        }
      }



    } else {

      if (valorDip1 == HIGH) {
        textoLetraLetra(virtualT, velocidad / 2); // llama al metodo para imprimir letra por letra el mensaje
      } else {
        if (valorDip2 == HIGH) {
          textoConMovimiento(virtualT, velocidad); //llama al metodo para imprimir el mensaje
        } else {
          //reversa();
          textoConMovimientoDer(virtualT, velocidad); //llama al metodo para imprimir el mensaje
        }
      }


    }

  } else {
    //verificaciones del Dip switch
    if (valorDip1 == HIGH) {
      textoLetraLetra(msg, velocidad / 2); // llama al metodo para imprimir letra por letra el mensaje
    }
    else {

      if (valorDip2 == HIGH) {
        textoConMovimiento(msg, velocidad); //llama al metodo para imprimir el mensaje
      } else {
        //reversa();
        textoConMovimientoDer(msg, velocidad); //llama al metodo para imprimir el mensaje
      }

    }
  }

  delay(1000);

}

int procesar_numero(int valor) {
  if (valor >= 0 && valor < 21) {
    escribirNumero(uno);
    return 500;
  }
  else if (valor >= 21 && valor < 41) {
    escribirNumero(dos);
    return 400;
  }
  else if (valor >= 41 && valor < 61) {
    escribirNumero(tres);
    return 300;
  }
  else if (valor >= 61 && valor < 81) {
    escribirNumero(cuatro);
    return 200;
  }
  else {
    escribirNumero(cinco);
    return 100;
  }
}

void encenderPin(int pos, boolean valor) {
  if (valor) {
    digitalWrite(segmento[pos], HIGH);
  } else {
    digitalWrite(segmento[pos], LOW);
  }
}

void escribirNumero(boolean num []) {
  for (int i = 0; i < 8; i++) {
    encenderPin(i, num[i]);
  }
}

void printCharWithShift(char c, int shift_speed) {
  if (c < 32) return;
  c -= 32;
  memcpy_P(buffer, CH + 7 * c, 7);
  m.writeSprite(32, 0, buffer);
  m.setColumn(32 + buffer[0], 0);
  for (int i = 0; i < buffer[0] + 1; i++)
  {
    delay(shift_speed);
    m.shiftLeft(false, false);
  }
}

void printCharDer(char c, int shift_speed) {
  if (c < 32) return;
  c -= 32;
  memcpy_P(buffer, CH + 7 * c, 7);
  m.writeSprite(maxInUse, 0, buffer);
  m.setColumn(maxInUse + buffer[0], 0);
  for (int i = 0; i < buffer[0] + 1; i++)
  {
    delay(shift_speed);
    m.shiftRight(false, false);
  }
}
// texto con moviemiento
void textoConMovimiento(char* s, int shift_speed) {

  while (*s != 0) {
    // Serial.println(s);
    printCharWithShift(*s, shift_speed);
    s++;
  }

}

void textoConMovimientoDer(char* s, int shift_speed) {
  while (*s != 0) {

    printCharDer(*s, shift_speed);
    s++;
  }
}

// mostrar letra por letra el texto
void textoLetraLetra(char* s, int shift_speed) {
  String t = s;
  int i = 0;
  while (*s != 0) {
    writeChar(t[i], shift_speed);
    s++;
    i++;
  }
}

void writeChar(char c, int speed_delay) {
  if (c < 32) return;
  c -= 32;
  memcpy_P(buffer, CH + 7 * c, 7);
  m.writeSprite(9, 0, buffer);
  delay(speed_delay);
  m.clear();
  /*
    m.writeSprite(1, 0, buffer);
    delay(speed_delay);
    m.clear();
  */
}
