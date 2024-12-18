//instalação das bibliotecas

#include <Wire.h> //biblioteca para o sensor BME/BMP280
#include <Adafruit_Sensor.h> //biblioteca para o sensor BME/BMP280
#include <Adafruit_BMP280.h> //biblioteca para o sensor BME/BMP280
#include <Adafruit_BME280.h> //biblioteca para o sensor BME/BMP280
#include <SD.h> //biblioteca para o datalogger

//definição dos pins para o sensor ultrassônico 
int TRIG = 4, ECHO = 5; 

Adafruit_BMP280 bmp; //definição de variável para o sensor BME/BMP280

int potPin = 0;    //pino analógico do potenciômetro
int potValue = 0;  //valor lido pelo potenciômetro (de 0 a 1023 por default)
int potValue2; //valor lido pelo potenciômetro depois do mapeamento (de 0 a 40 quando movimentado manualmente)
int led = 6; //pino digital do LED
int buzz = 7; //pino digital do buzzer
File cartao; //definição de variável do cartão
const int chipSelect = 10; //pino do CS do datalogger

void setup() {
  Serial.begin(9600); // Baud rate

  //configuração dos pinos
  pinMode(TRIG, OUTPUT); //pino de emissão do sensor ultrassônico
  digitalWrite(TRIG, LOW); //inicializando o pino do sensor ultrassônico como LOW
  pinMode(ECHO, INPUT); //pino de recepção do sensor ultrassônico

  pinMode(buzz, OUTPUT); //pino do buzzer

  if (!bmp.begin(0x76)) { 
    Serial.println("Could not find a valid BMP280 sensor, check wiring!"); //verificação de funcionamento do sensor BME/BMP280
  }
  
  while (!Serial);

  if (!SD.begin()) {

    Serial.println("initialization failed!"); //verificação de funcionamento do datalogger

    return;

  }

  Serial.println("initialization done."); //confirmação de inicialização do equipamento

  cartao = SD.open("dados.txt", FILE_WRITE); //salva os dados no cartão com o nome dados.txt, em que FILE_WRITE tem configuração append por default

  if (cartao == true){ //se o cartão for inicializado corretamente, printa o cabeçalho

    cartao.println("Temperatura Real, Potenciometro, Temp Mod., Pressão, Altitude, Profundidade"); //formato do cabeçalho no arquivo dados.txt

  } else {
    Serial.println("Erro");
  }
}

void loop() {

  potValue = analogRead(potPin); //lê o valor do potenciômetro de 0 a 1023
  potValue2 = map (potValue, 0, 1023, 0, 40); //mapeia o valor lido de potValue e converte para o intervalo de 0 a 40

  //inicialização das variáveis necessárias para os cálculos
  float soundSpeed = 0.00, sensorMeasurement = 0, height = 43, airDepth = 0; 
	int snowDepth = 0;
	long echo; //variável de retorno ECHO do sensor ultrassônico

  //inicialização do BME/BMP280
  Serial.println("BMP280 Sensor Readings:"); //cabeçalho dos dados no monitor serial

  Serial.print("Temperatura Real = "); //imprime o comentário no monitor 
  Serial.print(bmp.readTemperature()); //imprime a temperatura real no monitor
  Serial.println(" °C"); //imprime o comentário no monitor

	soundSpeed = 331.30 * sqrt((1.00 + (bmp.readTemperature() / 273.15))); //calcula a velocidade do som baseado na temperatura lida pelo sensor BME/BMP280

  //medição do sensor ultrassônico
	digitalWrite(TRIG, HIGH); 
	delayMicroseconds(10);
	digitalWrite(TRIG, LOW);

	//lê o resultado do ECHO
	echo = pulseIn(ECHO, HIGH);

  //conversão em centímetros do valor lido, conforme datasheet
	sensorMeasurement = (float)echo / 58.00;

	// cálculo da camada de air sobre a neve em metros de acordo com a velocidade do som corrigida pela temperatura
	airDepth = sensorMeasurement * (soundSpeed / 340);

	//cálculo da profundidade de neve: altura (height) conhecida menos o valor da camada de ar
	snowDepth = height - airDepth;

  //imprimindo os valores medidos
  Serial.print("Temperatura do Potenciômetro = ");
  Serial.print(potValue2);
  Serial.println(" °C");

  Serial.print("Temperatura Modificada = ");
  Serial.print(bmp.readTemperature()-potValue2);
  Serial.println(" °C");
  
  float pressure = bmp.readPressure() / 100.0F; // hPa
  Serial.print("Pressão = ");
  Serial.print(pressure);
  Serial.println(" hPa");

  float altitude = bmp.readAltitude(1013.25);
  Serial.print("Altitude aproximada = ");
  Serial.print(altitude);
  Serial.println(" m");

  Serial.print("Profundidade da neve = ");
  Serial.print(snowDepth);
  Serial.println(" cm");

  //alerta de altura de neve estabelecida para 5 cm, ativando o buzzer e o LED vermelho 
  if (snowDepth > (height-38)){
    digitalWrite(led,HIGH);
    digitalWrite(buzz, HIGH);
  } else {
    digitalWrite(led, LOW);
    digitalWrite(buzz, LOW); 
  }

  //separação dos dados no monitor serial
  Serial.println("");
  Serial.println("============");
  Serial.println("");

  //escrevendo os dados lidos no cartão, separando por vírgulas para pós-processamento
  if((cartao == true)){
    cartao.print(bmp.readTemperature());
    cartao.print(",");
    cartao.print(potValue2);
    cartao.print(",");
    cartao.print(bmp.readTemperature()-potValue2);   
    cartao.print(",");
    cartao.print(pressure);
    cartao.print(",");
    cartao.print(altitude);
    cartao.print(",");
    cartao.print(snowDepth);

    cartao.println("");
  }

  delay(1000);
  cartao.flush();

}
