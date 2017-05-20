import processing.serial.*;
import processing.sound.*;
Serial myPort;

final int sndN = 3;
SoundFile files[] = new SoundFile[sndN];
final int btns[] = {2, 3, 4};
int flag;

void setup(){
  size(400, 400);
  myPort = new Serial(this, Serial.list()[3], 9600);
  // windowsの場合は Serial.list()[0]に
  
  files[0] = new SoundFile(this, "./default/5.aif");
  files[1] = new SoundFile(this, "./nakama/cutting_a_napa.mp3");
  files[2] = new SoundFile(this, "./default/1.aif");

  flag = 0;
}

void draw(){
  background(255);
  if(myPort.available() > 0){
    flag = myPort.read(); 
  }
  
  // 各ボタンが押された場合の設定
  if(flag == btns[0]){ // ボタン1
    fill(255, 0, 0);
    files[0].play();
    flag = 0;
    
  } else if(flag == btns[1]){ // ボタン2
    fill(0, 255, 0);
    files[1].play();
    flag = 0;
    
  } else if(flag == btns[2]){ // ボタン3
    fill(0, 0, 255);
    files[2].play();
    flag = 0;
    
  } else { // 何も押されてない場合
    fill(200); 
  }
  
  rect(50, 50, 100, 100);
}