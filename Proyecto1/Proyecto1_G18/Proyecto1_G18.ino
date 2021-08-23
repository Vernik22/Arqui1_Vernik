//velocidad de los motores adelante
int velocidad_Alta = 500;
int velocidad_Baja = 1100;
//pines motores
int motorAtras = 13;
int motorDer = 4;
//int motorIzq2 = 5;
int motorIzq2 = 51;
//pines extra, ultra, pin para reversa
int pinUltra = 7;
int reversa = 11;
//pines leds
int ledIzq = 9;
int ledDer = 10;
int ledDet = 6;

// enviado desde la app android
char lectura = "";
//inicializo la velocidad
int velocidad;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial1.begin(9600);
  //pines motores

  pinMode(motorAtras, OUTPUT);
  pinMode(motorDer, OUTPUT);
  pinMode(motorIzq2, OUTPUT);


  pinMode(reversa, OUTPUT);

  //pines leds
  pinMode(ledIzq, OUTPUT);
  pinMode(ledDer, OUTPUT);
  pinMode(ledDet, OUTPUT);
  //inicializo la velocidad en baja
  velocidad = velocidad_Alta;
  
  //iniciar apagados
  digitalWrite(motorAtras, LOW);
  digitalWrite(motorDer, LOW);
  digitalWrite(motorIzq2, LOW);
  digitalWrite(reversa,LOW);
}

void loop() {
  // put your main code here, to run repeatedly:

  if (Serial1.available() > 0) {
    lectura = Serial1.read();
    Serial.print(lectura);
    //i = izquierda, d=derecha, a= adelante, s=stop, r=reversa, v= velocidad alta, b=velocidad baja,
    if (lectura == 'a') {
      digitalWrite(reversa,LOW);
      digitalWrite(ledDer, LOW);
      digitalWrite(ledIzq, LOW);
      digitalWrite(ledDet, LOW);
      analogWrite(motorAtras, velocidad);
      analogWrite(motorDer, velocidad);
      analogWrite(motorIzq2, velocidad);


    } else if (lectura == 's') {
      digitalWrite(reversa,LOW);
      digitalWrite(ledDet, LOW);
      digitalWrite(ledDer, LOW);
      digitalWrite(ledIzq, LOW);
      digitalWrite(motorAtras, LOW);
      digitalWrite(motorDer, LOW);
      digitalWrite(motorIzq2, LOW);


    } else if (lectura == 'i') {
      digitalWrite(reversa,LOW);
      digitalWrite(ledDet, LOW);
      digitalWrite(ledDer, LOW);
      digitalWrite(ledIzq, HIGH);
      analogWrite(motorAtras, velocidad);
      digitalWrite(motorDer, LOW);
      analogWrite(motorIzq2, velocidad);

    } else if (lectura == 'd') {
      digitalWrite(reversa,LOW);
      digitalWrite(ledDet, LOW);
      digitalWrite(ledIzq, LOW);
      digitalWrite(ledDer, HIGH);
      analogWrite(motorAtras, velocidad);
      analogWrite(motorDer, velocidad);
      digitalWrite(motorIzq2, LOW);

    } else if (lectura == 'r') {
     digitalWrite(ledDet, LOW);
      digitalWrite(ledIzq, LOW);
      digitalWrite(ledDer, LOW);
      analogWrite(motorAtras, LOW);
      analogWrite(motorDer, LOW);
      digitalWrite(motorIzq2, LOW);
      digitalWrite(reversa,HIGH);

    } else if (lectura == 'v') {
      digitalWrite(reversa,LOW);
      
      digitalWrite(motorAtras, HIGH);
      digitalWrite(motorDer, HIGH);
      digitalWrite(motorIzq2, HIGH);
    

    } else if (lectura == 'b') {
      digitalWrite(reversa,LOW);
     
      analogWrite(motorAtras, velocidad);
      analogWrite(motorDer, velocidad);
      analogWrite(motorIzq2, velocidad);
     

    }

  }

  
    int cm;
    cm = 0.01723 * readUltrasonic(pinUltra, pinUltra);
    if(cm <= 20){
      digitalWrite(ledDer, LOW);
      digitalWrite(ledIzq, LOW);
      digitalWrite(ledDet, HIGH);
      digitalWrite(motorAtras, LOW);
      digitalWrite(motorDer, LOW);
      digitalWrite(motorIzq2, LOW);
      Serial1.print("h");
      delay(100);
      }
    delay(100);
  
 
}

long readUltrasonic(int triggerPin, int echoPin) {
  pinMode(triggerPin, OUTPUT);
  digitalWrite(triggerPin, LOW);
  delayMicroseconds(2);
  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(triggerPin, LOW);

  pinMode(echoPin, INPUT);
  return pulseIn(echoPin, HIGH);
}
