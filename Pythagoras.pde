//---セットアップ---//
PImage Fukidashi;
PImage Fukidashi1;
PImage Fukidashi2;
PImage Fukidashi3;
PImage Fukidashi4;
PFont font;
//import ddf.minim.*;
//Minim minim;
//AudioPlayer boilling1;
import processing.serial.*;
Serial serialPort; // Arduinoにデータを送るシリアルポート
boolean firstContact = false;  //Arduinoからのはじめの送信を確認する
byte[] inByte = new byte[3]; // 受信データ用バッファ
int oval1;
int stack_line_px[] = new int[100];
int stack_line_py[] = new int[100];
void setup() {
  font = createFont("azuki_font", 30);  //この際に最大サイズを決める
  textFont(font);  //設定したフォントを使用
  String portName = Serial.list()[3]; // 使用するシリアルポート名
  serialPort = new Serial(this, portName, 9600);
  serialPort.buffer(inByte.length); // 読み込むバッファの長さをの指定
  //oval1 = 100;
  fullScreen(JAVA2D);
  background(255);
  smooth();
  frameRate(60);
  Fukidashi = loadImage("fukidashi.jpg");
  Fukidashi1 = loadImage("fukidashi2.jpg");
  Fukidashi2 = loadImage("fukidashi1.jpg");
  Fukidashi3 = loadImage("fukidashi3.jpg");
  Fukidashi4 = loadImage("open.png");
  //泡の初期を代入
  for (int i=0; i<100; i++) {
    stack_px[i] = int(random(0, width));//x座標 
    stack_py[i] = int(random(height/2, height));//y座標
    stack_px2[i]=int(random(0, width));//x座標
    stack_py2[i]=int(random(height-150, height));//y座標
    stack_radius[i] = int(random(10, 50));//半径
    stack_line_px[i] = int(random(width/2-80, width/2-110));
    stack_line_py[i] = int(random(500, 470));
  }
  //sendServo(1,75);
}

// シリアルポートにデータが受信されると呼び出されるメソッド
void serialEvent(Serial port) {
  inByte = port.readBytes();
  if (firstContact == false) {
    if (inByte[0] == 'C') { // Arduinoとの接続確認
      port.clear();
      firstContact = true;
      sendServo(1, 0);
    }
  }
}
// シリアルポートにサーボの値を送るメソッド
void sendServo(int id, int value) {
  if (!firstContact) return;
  int v = value;
  if (v < 15) v = 15; // サーボの最小値。個体差による。
  if (v > 125) v = 125; // サーボの最大値。個体差による。
  serialPort.write((byte)'S');
  serialPort.write((byte)id);
  serialPort.write((byte)v);
}

int timer = 0;//タイマー用変数初期化
int i=0;//for文で使う変数初期化
int GS0_1=0;//座標移動に使う変数
int GS0_2=0;//座標移動に使う変数
int GS0_3=0;//座標移動に使う変数
int GS1_1=0;//座標移動に使う変数
int GS1_2=0;//座標移動に使う変数
int GS1_3=0;//座標移動に使う変数
int GS2_1=0;//座標移動に使う変数
int GS2_2=0;//座標移動に使う変数
int GS2_3=0;//座標移動に使う変数
int GS3_1=0;//座標移動に使う変数
int GS3_2=0;//座標移動に使う変数
int GS3_3=0;//座標移動に使う変数
int Blood1_GS3_px = 0;
int Blood1_GS3_py = 0;
int s=90;//座標移動に使う変数
int R=0;//R(RED)
int G=0;//G(GREEN)
int B=0;//B(BLUE)
int Animation_Statics = 0;//アニメーションの状態を表す変数
int Siratama1_GS0_Flag = -1;
int Siratama2_GS0_Flag = -1;
int Siratama3_GS0_Flag = -1;
int Siratama1_GS1_Flag = 0;
int Siratama2_GS1_Flag = -1;
int Siratama3_GS1_Flag = -1;
int Siratama1_GS2_Flag = 1;
int Siratama2_GS2_Flag = -1;
int Siratama3_GS2_Flag = -1;
int Siratama3_GS3_Flag = -1;
int Siratama1_GS2_Suspend_Flag = -1;//アニメーション２の白玉①一時停止
int Siratama2_GS2_Suspend_Flag = -1;//アニメーション２の白玉②一時停止
int Siratama3_GS2_Suspend_Flag = -1;//アニメーション２の白玉③一時停止
int Blood_GS3_Flag = -1;
int degree = 0;
int point_x = 0;
float point_y = 0;
int Siratama1_Visibility = 100;
int Siratama2_Visibility = 100;
int Siratama3_Visibility = 100;
boolean Suspend = false;
boolean roll = false;
boolean open = false;
float GS3_R = 0;
float GS3_G = 0;
float GS3_B = 0;
//---実行---//
void draw() {
  if (Suspend==false) {
    background(255);
    textSize(200);
    fill(241, 171, 143);
    text("準備中", 330, 450);
    textSize(30);
    text("Output port: "+oval1, width-300, height-100);
  } else if (Suspend) {
    background(255);
    //ビー玉からみたらしへの変化
    if (Animation_Statics == 0) {
      point_x++;
      point_y = sin(radians(point_x))*(height/20)+650;
      stroke(0);
      fill(0);
      //ellipse(point_x,point_y,10,10);
      pushMatrix();
      siratama1_for_rotating(80, 170, 100+GS0_1, 255, 255, 255);//回転白玉①投下
      popMatrix();
      GS0_1+=6;
      strokeWeight(10);
      stroke(140, 140, 140);
      line(10, 300, 10, height);
      line(width-10, 300, width-10, height);
      strokeWeight(0);
      stroke(0);
      fill(210, 94, 44, 60);
      rect(16, 600, width-30, height-600);
      //---二体目投下開始---//
      if (Siratama2_GS0_Flag == 0) {
        pushMatrix();
        siratama2_for_rotating(80, 170, 50+GS0_2, 255, 255, 255);//回転白玉②投下
        popMatrix();
        GS0_2+=6;
      }
      //---三体目投下開始---//
      if (Siratama3_GS0_Flag == 0) {
        pushMatrix();
        siratama3_for_rotating(80, 170, 40+GS0_3, 255, 255, 255);//回転白玉③投下
        popMatrix();
        GS0_3+=6;
      }
      //Dokan();
      //---泡を発泡---//
      for (int i=0; i<100; i++) {
        fill(209, 128, 71, 100);
        Bubbles(stack_px2[i], stack_py2[i], stack_radius[i]);
        int dpy = int(random(0, 5));
        stack_py2[i]-= dpy;
        if (stack_py2[i]<height-200) {
          stack_py2[i]=int(random(height-200, height));
        }
      }
    } else if (Animation_Statics == 1) {
      //---泡を複数だす---//
      background(210, 94, 44);
      fill(255+R, 255+G, 255+B);
      siratama1(80, width/2, 100+GS1_1, 255+R, 255+G, 255+B);
      GS1_1+=2;
      for (int i=0; i<100; i++) {
        fill(255, 255, 255, 100);
        Bubbles(stack_px[i], stack_py[i], stack_radius[i]);
        int dpy = int(random(0, 5));
        stack_py[i]-= dpy;
        if (stack_py[i]<0) {
          stack_py[i]=int(random(200, height));
        }
      }
      //---1秒ごとにみたらし色に---//
      if (timer%30==0) {
        R-=1;
        G-=6;
        B-=8;
      }
      if (Siratama2_GS1_Flag==0) {
        fill(255+R, 255+G, 255+B);
        siratama2(80, width/2-300, 50+GS1_2, 255+R, 255+G, 255+B);
        GS1_2+=2;
      }
      if (Siratama3_GS1_Flag==0) {
        fill(255+R, 255+G, 255+B);
        println(255+R);
        println(255+G);
        println(255+B);
        siratama3(80, width/2+300, 50+GS1_3, 255+R, 255+G, 255+B);
        GS1_3+=2;
      }
    } 
    //---白玉1個目刺さる---//
    else if (Animation_Statics ==2) {
      background(255);
      Kushi();
      if (Siratama1_GS2_Flag == 0) {
        fill(241, 171, 143, Siratama1_Visibility);
        siratama1(80, width/2, 100+GS2_1, 255, 255, 255);
        if (Siratama1_GS2_Suspend_Flag == -1) {
          GS2_1+=5;
        }
      }
      //---白玉2個目刺さる---//
      if (Siratama2_GS2_Flag == 0) {
        fill(241, 171, 143, Siratama2_Visibility);
        siratama2(80, width/2, 100+GS2_2, 255, 255, 255);
        if (Siratama2_GS2_Suspend_Flag == -1) {
          GS2_2+=5;
        }
      }
      //---白玉3個目刺さる---//
      if (Siratama3_GS2_Flag == 0) {
        fill(241, 171, 143, Siratama3_Visibility);
        siratama3(80, width/2+50, 100+GS2_3, 255, 255, 255);
        println(100+GS2_3);
        if (Siratama3_GS2_Suspend_Flag == -1) {
          GS2_3+=1;
        }
      }
    } else if (Animation_Statics==3) {
      fill(209, 128, 71, 150);
      SC_Kushi();
      fill(241+GS3_R, 171+GS3_G, 143+GS3_B);
      GS3_R+=0.1;
      GS3_G+=0.6;
      GS3_B+=0.8;
      siratama3_crashed(160, width/2, 360, 255, 255, 255);
      if (Blood_GS3_Flag == 0) {
        stroke(255, 10, 10);
        strokeWeight(2);
        for (int i=0; i<50; i++) {
          line(stack_line_px[i], stack_line_py[i], stack_line_px[i]-12, stack_line_py[i]+20);
          Blood1_GS3_px = int(random(1, 20));
          Blood1_GS3_py = int(random(10, 40));
          stack_line_px[i]-= Blood1_GS3_px;
          stack_line_py[i]+= Blood1_GS3_py;
          if (stack_line_px[i] < width/2-130&&stack_line_py[i]>560) {
            stack_line_px[i] = int(random(width/2-70, width/2-110));
            stack_line_py[i] = int(random(500, 470));
          }
        }
        if (241+GS3_R>260&&171+GS3_G>260&&143+GS3_B>260) {
          Animation_Statics = 4;
        }
      }
    } else if (Animation_Statics == 4) {
      fill(209, 128, 71, 150);
      SC_Kushi();
      fill(255);
      siratama3_crashed(160, width/2+s, cos(radians(s-3))*600+360, 255, 255, 255);
      s+=3;
      if (cos(radians(s-3))*600+360+220<0) {
        Animation_Statics = 5;
      }
    } else if (Animation_Statics == 5) {
      fill(209, 128, 71, 150);
      SC_Kushi();
      //image(Fukidashi3,50,130,width/3,height/3);
      textSize(150);
      text("モーター開閉！！", 50, 300);
      sendServo(1,1501);
    }
    //---タイマー設置---//
    if (timer%60==0) {
      fill(0);
      println(timer/60+"秒");
    }
    timer++;
    keyPressed();
  }
}
//---キー操作---//
void keyPressed() {
  if (key=='P'||key=='p') {
    noLoop();
  } else if (key=='S'||key=='s') {
    Suspend = true;
    loop();
  } 
  if (key=='R'||key=='r') {
    if (oval1<=120) {
      oval1+=5;
    }
    sendServo(1, oval1);
  } else if (key=='L'||key=='l') {
    if (oval1>=20) {
      oval1-=5;
    }
    sendServo(1, oval1);
  }
}