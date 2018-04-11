void siratama3(int radius, int px, int py, int skinR, int skinG, int skinB) {
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
  if (Animation_Statics == 0) {
    if (py>height) {
      Animation_Statics =1;
      py=0;
    }
  } else if(Animation_Statics == 1){
    if(py>height+60){
      Animation_Statics=2;
      py=0;
      Siratama1_GS2_Flag = 0;
    }
  }else if (Animation_Statics == 2) {
    if(py>150){
      image(Fukidashi2, width/2+100, 250, width/6, height/6);
    }
     if (py>175) {
      Siratama3_Visibility = 255;
      Siratama3_GS2_Suspend_Flag = 0;
      delay(2000);
      Siratama3_GS2_Flag = 0;
      Animation_Statics = 3;
      Blood_GS3_Flag = 0;
    }
  }else if(Animation_Statics == 3){
  }
}
//ellipse(中心のx座標,中心のy座標,横の直径,縦の直径);