// 各ボタンに対応するポート番号
const int btn2 = 2;
const int btn3 = 3;

// ボタンの状態の確保
int val = 0;

void setup(){
  Serial.begin(9600); // PCへ送受信するための設定
  pinMode(btn2, INPUT);
  pinMode(btn3, INPUT);
}

void loop(){
  val = digitalRead(btn2);

  // シリアルにボタンの状態を書き出し（0が1になる）
  if (val == HIGH){
    Serial.write(val); // PCへ送信
  } else {
    val = digitalRead(btn3);
    Serial.write(val);  // PCへ送信
  }
  
  delay(100); // 100msまつ
}
