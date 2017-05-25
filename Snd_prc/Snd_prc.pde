import processing.serial.*;
import processing.sound.*;
Serial myPort; 

final int sndN = 3; // ボタンの数
SoundFile files[] = new SoundFile[sndN];
final int btns[] = {2, 3, 4, 5, 6, 7}; // 各ボタンの値
int flag;

void setup(){
  size(400, 400);
  myPort = new Serial(this, Serial.list()[3], 9600);
  // windowsの場合は Serial.list()[0]に
  
  // ボタンの数を6つまで(files[5]まで)対応できます
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
  for(int i = 0; i < btns.length; i++){
    if(flag == btns[i]){ // ボタン1
      fill(255, 0, 0);
      files[i].play();
      flag = 0;
      break;
    } else {
      fill(100);
    }
  }
  
  rect(50, 50, 100, 100);
}