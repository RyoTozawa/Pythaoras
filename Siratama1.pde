void siratama1(int radius, int px, int py, int skinR, int skinG, int skinB) {
  stroke(50, 50, 50, 200);
  strokeWeight(5);
  //fill(skinR, skinG, skinB);
  ellipse(px, py, (2*radius), (2*radius));
  stroke(0);
  //左目
  int const_x1 = 25;
  int const_y1 = 20;
  int different_x1 = 25;
  int different_y1 = 10;
  line(px-const_x1, py-const_y1, px-const_x1-different_x1, py-const_y1+different_y1);
  line(px-const_x1, py-const_y1, px-const_x1-different_x1, py-const_y1-different_y1);
  //右目
  int const_x2 = -25;
  int const_y2 = 20;
  int different_x2 = 25;
  int different_y2 = 10;
  line(px-const_x2, py-const_y2, px-const_x2+different_x2, py-const_y2+different_y2);
  line(px-const_x2, py-const_y2, px-const_x2+different_x2, py-const_y2-different_y2);
  //口
  bezier(px-20, py, px-15, py+10, px-5, py+10, px, py);  
  bezier(px+20, py, px+15, py+10, px+5, py+10, px, py); 
  strokeWeight(1);
  //ほっぺ
  fill(250, 128, 114, 100);
  int hoppe = 38;
  noStroke();
  ellipse(px-55, py+10, hoppe, hoppe);
  ellipse(px+55, py+10, hoppe, hoppe);
  if (Animation_Statics ==0) {
    if (py>height) {
      Animation_Statics =1;
      py=0;
    }
  } else if (Animation_Statics == 1) {
    if (py>height/2-200) {
      Siratama2_GS1_Flag=0;
      Siratama3_GS1_Flag=0;
    }else if(py>height+100){
      py=0;
    }
  } else if (Animation_Statics == 2) {
    if (py>height-150) {
      Siratama1_Visibility = 255;
      Siratama2_GS2_Flag = 0;
      image(Fukidashi, width/2+100, height-280, width/6, height/6);
      Siratama1_GS2_Suspend_Flag = 0;
    }
  }
}
//ellipse(中心のx座標,中心のy座標,横の直径,縦の直径);