void siratama2(int radius, int px, int py, int skinR, int skinG, int skinB) {
  stroke(50, 50, 50, 200);
  strokeWeight(5);
  //fill(skinR, skinG, skinB);
  ellipse(px, py, (2*radius), (2*radius));
  stroke(0);
  //左目
  //左目
  int const_x1 = 25;//基準x座標
  int const_y1 = 20;//基準y座標
  ellipse(px-const_x1, py-const_y1, 10, 10);
  //右目
  int const_x2 = -25;//基準x座標
  int const_y2 = 20;//基準y座標
  ellipse(px-const_x2, py-const_y2, 10, 10);
  //口
  bezier(px-20, py, px-15, py+10, px-5, py+10, px, py);//曲線を描いてくれる関数  
  bezier(px+20, py, px+15, py+10, px+5, py+10, px, py);//曲線を描いてくれる関数
  strokeWeight(1);//外線の太さ
  //ほっぺ
  fill(250, 128, 114, 100);
  int hoppe = 38;
  noStroke();
  ellipse(px-55, py+10, hoppe, hoppe);
  ellipse(px+55, py+10, hoppe, hoppe);
  if (Animation_Statics == 1) {
    if (py>height+60) {
      py = 0;
    }
  } else if (Animation_Statics == 2) {
    if (py>height-350) {
      Siratama2_Visibility = 255;
      Siratama3_GS2_Flag = 0;
      image(Fukidashi1, width/2-320, height-450, width/6, height/6);
      Siratama2_GS2_Suspend_Flag = 0;
    }
  }
}
//ellipse(中心のx座標,中心のy座標,横の直径,縦の直径);