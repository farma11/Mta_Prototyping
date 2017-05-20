import processing.serial.*;
import processing.sound.*;
Serial myPort;

final int sndN = 3;
SoundFile file0, file1;
SoundFile files[] = new SoundFile[sndN];
final int btns[] = {2, 3, 4};
int flag;

void setup(){
  size(400, 400);
  myPort = new Serial(this, Serial.list()[3], 9600);
  // 
  
  files[0] = new SoundFile(this, "./default/5.aif");
  files[1] = new SoundFile(this, "./nakama/cutting_a_napa.mp3");
  files[2] = new SoundFile(this, "./default/5.aif");

  flag = 0;
}

void draw(){
  background(255);
  if(myPort.available() > 0){
    flag = myPort.read(); 
  }
  if(flag == btns[0]){
    fill(255, 0, 0);
    file0.play();
    flag = 0;
  } else if(flag == btns[1]){
    fill(0, 255, 0);
    file1.play();
    flag = 0;
  } else if(flag == btns[2]){
    fill(0, 0, 255);
    file1.play();
    flag = 0;
  } else {
    fill(200); 
  }
  rect(50, 50, 100, 100);
}