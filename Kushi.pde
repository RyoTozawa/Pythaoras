void Kushi(){
  stroke(0);
  line(width/2-10,height,width/2-10,250);
  line(width/2+10,height,width/2+10,250);
  line(width/2-10,250,width/2,235);
  line(width/2+10,250,width/2,235);
  fill(250,165,92);
  beginShape();
  vertex(width/2-10,height);
  vertex(width/2-10,250);
  vertex(width/2,235);
  vertex(width/2+10,250);
  vertex(width/2+10,height);
  endShape();
}