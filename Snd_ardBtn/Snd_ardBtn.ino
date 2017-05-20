const int button = 2; // ボタンのポート番号(Arduinoの2番ポート)

void setup(){
  Serial.begin(9600); // PCへ送受信するための設定
}

void loop(){
  Serial.write(digitalRead(button)); // PCへ送信
  // シリアルにボタンの状態を書き出し（0が1になる）
  delay(100); // 100msまつ
}
