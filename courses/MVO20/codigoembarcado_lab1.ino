
//#define pot A0; //Define pot como A0 

const int pinoA0 = A0;
const int pinoA1 = A1;
//iniciar variãveis
int mode = -1;
unsigned int valorSensor = 0; //Cria variável para armazenar o valor do potenciômetro 
unsigned long tempo;
int IN1 = 4 ;
int IN2 = 2 ;
int velocidadeMotor = 3;
/*float rpmMotor = 0;
float rpmMotor0 = 0;*/
float velocidadeRotacaoMotor;
float buff = 5;
struct palavraRecebida {
char modo;
double numero;
};
struct palavraRecebida rpmMotor;
String inString = "";    // string to hold input

void setup() 
{
pinMode(IN1, OUTPUT);
pinMode(IN2, OUTPUT);     
pinMode(velocidadeMotor, OUTPUT);
Serial.begin(9600); //Inicia a serial com Baud Rate de 9600 
Serial.println('a');
char leituraArduino = Serial.read();
while (leituraArduino != 'm')
{
  leituraArduino = Serial.read();
 }
} 

void loop() 
{      
if (Serial.available()>0)
{
  mode = Serial.read();
 if (mode == 'R')
 {
    tempo = millis(); 
    rpmMotor = leRealSerial();
    //rpmMotor0 = rpmMotor.numero;
    //rpmMotor0 = analogRead(pinoA0);
    //rpmMotor = rpmMotor0-511;
    //rpmMotor = rpmMotor0*.534-267.283;  
    //velocidadeRotacaoMotor = rpmMotor*.499022;
     if(rpmMotor.modo == 'W' ){
          velocidadeRotacaoMotor = rpmMotor.numero;
          if (velocidadeRotacaoMotor ==0){
            velocidadeRotacaoMotor = buff;
          }
          buff = velocidadeRotacaoMotor;
        }
    if (velocidadeRotacaoMotor>=0)
    {
        digitalWrite(IN2,HIGH);
        digitalWrite(IN1,LOW);
        analogWrite(velocidadeMotor,velocidadeRotacaoMotor);
    }
    if (velocidadeRotacaoMotor<0)
    {
        digitalWrite(IN2,LOW);
        digitalWrite(IN1,HIGH);
        analogWrite(velocidadeMotor,abs(velocidadeRotacaoMotor)); 
    }
    valorSensor = analogRead(pinoA1); 
    Serial.println(tempo);
    Serial.println(valorSensor);
    Serial.println(velocidadeRotacaoMotor);
  }
}
//potvalor = analogRead(A0); //Lê o potenciômetro e armazena na variável potvalor   
//Serial.print("Valor do Potenciometro = "); //Imprime na serial "Valor do      Potenciometro = "   
//Serial.println(potvalor); //Imprime na serial o valor lido   
//Serial.print("Valor em graus = "); //Imprime na serial "Valor do      Potenciometro = "   
//valor_graus=potvalor*288/1023;
//Serial.println(valor_graus); //Imprime na serial o valor lido   
delay(25); //Aguarda 250 milissegundos 

}

//Função que le a palavra recebida
  struct palavraRecebida leRealSerial(){
  struct palavraRecebida dadoRecebido;
  int contadorDeBit=1;
  char letra; 
  // Read serial input:
  while ( Serial.available() > 0) {
    char inChar = Serial.read();
    if (inChar == 'W'){
      dadoRecebido.modo = inChar;
    }         
    else {
      if (inChar != '\n') { 
        // As long as the incoming byte is not a newline, convert the incoming byte to a char
        // and add it to the string
        inString += (char)inChar;
      }
      // if you get a newline, print the string,
      // then the string's value as a float:
      else {
        dadoRecebido.numero = inString.toFloat();
        inString = "";// clear the string for new input:
      }
     }
  }
  delay(20);// Aguarda buffer serial ler próximo caractere
  return dadoRecebido;
}
