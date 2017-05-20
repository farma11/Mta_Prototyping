import processing.serial.*;
import processing.sound.*;
Serial myPort;

SoundFile file;
int flag;

void setup(){
  size(400, 400);
  myPort = new Serial(this, Serial.list()[3], 9600);
  file = new SoundFile(this, "5.aif");
  flag= 0;
}

void draw(){
  background(255);
  if(myPort.available() > 0){
    flag = myPort.read(); 
  }
  if(flag == 1){
    fill(0);
    file.play();
    flag = 0;
  } else {
    fill(200); 
  }
  rect(50, 50, 100, 100);
}