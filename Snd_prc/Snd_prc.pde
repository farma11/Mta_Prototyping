import processing.serial.*;
import processing.sound.*;
Serial myPort;

SoundFile file0, file1;
int flag;

void setup(){
  size(400, 400);
  myPort = new Serial(this, Serial.list()[3], 9600);
  file0 = new   SoundFile(this, "./default/5.aif");
  file1 = new   SoundFile(this, "./nakama/cutting_a_napa.mp3");
  flag= 0;
}

void draw(){
  background(255);
  if(myPort.available() > 0){
    flag = myPort.read(); 
  }
  if(flag == 1){
    fill(0);
    file0.play();
    flag = 0;
  } else if(flag == 2){
    fill(100);
    file1.play();
    flag = 0;
  } else {
    fill(200); 
  }
  rect(50, 50, 100, 100);
}