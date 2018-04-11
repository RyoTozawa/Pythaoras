void SC_Kushi(){
  stroke(0);
  /*
  line(width/2-10,height,width/2-10,250);
  line(width/2+10,height,width/2+10,250);
  line(width/2-10,250,width/2,235);
  line(width/2+10,250,width/2,235);
  fill(250,165,92);
  */
  beginShape();
  vertex(width/2-120,height);
  vertex(width/2-120,height-200);
  vertex(width/2-60,height-300);
  vertex(width/2,height-200);
  vertex(width/2,height);
  endShape();
}