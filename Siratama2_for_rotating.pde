void siratama2_for_rotating(int radius, int px, int py, int skinR, int skinG, int skinB) {
  fill(skinR, skinG, skinB);//白玉の肌の色
  stroke(50, 50, 50, 200);//外枠の線
  strokeWeight(5);//外線の太さ
  translate(px,py);//座標軸変更→白玉の中心
  rotate(degree*PI/180);//中心を基点に回転
  degree+=1;
  ellipse(0, 0, (2*radius), (2*radius));//白玉の輪郭
  stroke(0);//外線の色
  //左目
  int const_x1 = 25;//基準x座標
  int const_y1 = 20;//基準y座標
  ellipse(-const_x1,-const_y1,10,10);
  //右目
  int const_x2 = -25;//基準x座標
  int const_y2 = 20;//基準y座標
  ellipse(-const_x2,-const_y2,10,10);
  //口
  bezier(-20, 0, -15, +10, -5, +10,0,0);//曲線を描いてくれる関数  
  bezier(+20, 0, +15, +10, +5, +10,0,0);//曲線を描いてくれる関数
  strokeWeight(1);//外線の太さ
  //ほっぺ
  fill(250, 128, 114, 100);
  int hoppe = 38;
  noStroke();
  ellipse(-55, +10, hoppe, hoppe);
  ellipse(+55, +10, hoppe, hoppe);
  
  //白玉が下まで行ったらリセット
  if (Animation_Statics==0) {
    if (py>290) {
      Siratama3_GS0_Flag = 0;
      py=0;
    }
  }
  //上記と同様
  else if (Animation_Statics ==1) {
    if (py>height) {
      Animation_Statics =2;
      GS1_2=0;
    }
  }
  
}
//ellipse(中心のx座標,中心のy座標,横の直径,縦の直径);