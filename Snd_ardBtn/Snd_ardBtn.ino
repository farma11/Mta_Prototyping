// 各ボタンに対応するポート番号 (必要数のボタンの配列を)
const int btns[] = {2, 3, 4, 5, 6, 7}; 
const int btnNum = 6;

void setup(){
  Serial.begin(9600); // PCへ送受信するための設定

  for(int i = 0; i < btnNum; i++){
    pinMode(btns[i], INPUT);
  }
}

void loop(){

  // シリアルにボタンの状態を書き出し（0が1になる）
  for(int i = 0; i < btnNum; i++){
    if (digitalRead(btns[i]) == HIGH){
      Serial.write(btns[i]); // PCへ送信
    }
  }
  
  delay(100); // 100msまつ
}
