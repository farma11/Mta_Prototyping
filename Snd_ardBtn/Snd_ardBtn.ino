// 各ボタンに対応するポート番号
const int btn2 = 2;
const int btn3 = 3;

// ボタンの状態の確保
// int val = 0;

void setup(){
  Serial.begin(9600); // PCへ送受信するための設定
  pinMode(btn2, INPUT);
  pinMode(btn3, INPUT);
}

void loop(){

  // シリアルにボタンの状態を書き出し（0が1になる）
  if (digitalRead(btn2) == HIGH){
    Serial.write(1); // PCへ送信
  } else if(digitalRead(btn3) == HIGH){
    Serial.write(2);  // PCへ送信
  }
  
  delay(100); // 100msまつ
}
