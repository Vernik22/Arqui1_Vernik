int pin_analogo;
int segmento[7] = {22,23,24,25,26,27,28};

//Numeros
boolean cero[7] = {true,true,true,true,true,true,false};
boolean uno[7] = {false,true,true,false,false,false,false};
boolean dos[7] = {true,true,false,true,true,false,true};
boolean tres[7] = {true,true,true,true,false,false,true};
boolean cuatro[7] = {false,true,true,false,false,true,true};
boolean cinco[7] = {true,false,true,true,false,true,true};
boolean seis[7] = {true,false,true,true,true,true,true};
boolean siete[7] = {true,true,true,false,false,false,false};
boolean ocho[7] = {true,true,true,true,true,true,true};
boolean nueve[7] = {true,true,true,true,false,true,true};

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pin_analogo = A1;
  for(int i=0;i<7;i++){
    pinMode(segmento[i],OUTPUT);
    digitalWrite(segmento[i],LOW);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  int lectura = analogRead(pin_analogo);
  int valor = lectura / 10;
  Serial.println("Lectura Actual");
  Serial.println(valor);
  procesar_numero(valor);
  //probar_pines();
  delay(1000);
}

void procesar_numero(int valor){
  if (valor ==0 ){
    escribirNumero(cero);
  }
  else if(valor > 0 && valor < 10){
    escribirNumero(cero);
  }
  else if(valor >= 10 && valor < 20){
    escribirNumero(uno);
  }
  else if(valor >= 20 && valor < 30){
    escribirNumero(dos);
  }
  else if(valor >= 30 && valor < 40){
    escribirNumero(tres);
  }
  else if(valor >= 40 && valor < 50){
    //Serial.println("Es un puto 4");
    escribirNumero(cuatro);
  }
  else if(valor >= 50 && valor < 60){
    escribirNumero(cinco);
  }
  else if(valor >= 60 && valor < 70){
    escribirNumero(seis);
  }
  else if(valor >= 70 && valor < 80){
    escribirNumero(siete);
  }
  else if(valor >= 80 && valor < 90){
    escribirNumero(ocho);
  }
  else{
    escribirNumero(nueve);
  }
}

void borrar_numero(){
  for(int i=0; i<7;i++){
    digitalWrite(segmento[i], LOW);    
  }
}

void probar_pines(){
  for(int i=0; i<7;i++){
    digitalWrite(segmento[i], HIGH);
    delay(100);
  }
}

void encenderPin(int pos,boolean valor){
    if(valor){
      digitalWrite(segmento[pos],HIGH);
    }else{
      digitalWrite(segmento[pos],LOW);
    }
}

void escribirNumero(boolean num []){
  for(int i=0;i<8;i++){
    encenderPin(i,num[i]);
  }
}
