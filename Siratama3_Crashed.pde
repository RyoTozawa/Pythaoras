int eye = 0;
void siratama3_crashed(int radius, float px, float py, int skinR, int skinG, int skinB) {
  //fill(255,98,50,180);
  stroke(50, 50, 50, 200);
  strokeWeight(5);
  ellipse(px, py, (2*radius), (2*radius));
  stroke(0);
  //左目
  fill(255);
  int const_x1 = 25;//基準x座標
  int const_y1 = 20;//基準y座標
  ellipse(px-2*const_x1, py-2*const_y1, 4*10, 4*15);
  fill(0);
  ellipse(px-2*const_x1, py-const_y1+eye, 35, 35);
  //右目
  fill(255);
  int const_x2 = -25;//基準x座標
  int const_y2 = 20;//基準y座標
  ellipse(px-2*const_x2, py-2*const_y2, 4*10, 4*15);
  fill(0);
  ellipse(px+2*const_x1, py-const_y1+eye, 35, 35);
  //口
  fill(255);
  ellipse(px,py+70,30,170);
  //ほっぺ
  fill(250, 128, 114);
  int hoppe = 80;
  noStroke();
  ellipse(px-2*55, py+4*10, hoppe, hoppe);
  ellipse(px+2*55, py+4*10, hoppe, hoppe);
  image(Fukidashi3,50,130,width/3,height/3);
  if(py>height/2-100){
    Siratama3_GS3_Flag = 0;
    Blood_GS3_Flag = 0;
    eye+=9;
  }
  if(eye>height){
    eye=1200;;
  }
}
//ellipse(中心のx座標,中心のy座標,横の直径,縦の直径);