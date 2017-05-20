// 各ボタンに対応するポート番号 (必要数のボタンの配列を)
const int btn2 = 2;
const int btn3 = 3;
const int btns[] = {2, 3, 4};


void setup(){
  Serial.begin(9600); // PCへ送受信するための設定
  pinMode(btns[0], INPUT);
  pinMode(btns[1], INPUT);
  pinMode(btns[2], INPUT);
}

void loop(){

  // シリアルにボタンの状態を書き出し（0が1になる）
  if (digitalRead(btns[0]) == HIGH){
    Serial.write(btns[0]); // PCへ送信
    
  } else if(digitalRead(btns[1]) == HIGH){
    Serial.write(btns[1]);  // PCへ送信
    
  } else if(digitalRead(btns[2]) == HIGH){
    Serial.write(btns[2]);  // PCへ送信
  }
  
  delay(100); // 100msまつ
}
