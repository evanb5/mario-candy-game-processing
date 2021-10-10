/*
 Description: Programming Culminating
 Author: Evan Bai
 Date of last edit: Sunday January 20 
 */

color backgroundColour = color(229, 151, 151);
float circleEX = 150, circleEY = 0;
float circleVX = 400, circleVY = 0;
float circleAX = 650, circleAY = 0;
float circleNX = 900, circleNY = 0;
float circleBX = 1150, circleBY = 0;
float textEX = 100, textEY = 60;
float textVX = 350, textVY = 60;
float textAX = 600, textAY = 60;
float textNX = 850, textNY = 60;
float textBX = 1100, textBY = 60;
float speedE = 6, speedV = 8, speedA = 10, speedN = 12, speedB = 14;
float gravity = .1;
float cookieX = 550, cookieY= 200;
PImage star, redStar, cookie;

void settings() {
  size(1300, 600);
}

void setup() {
  star = loadImage("mariostar.png");
  redStar = loadImage("marioredstar.png");
  cookie = loadImage("mmcookie.png");
  cookie.resize(200, 200);
}

void draw() {
  //inside of mouth
  background(backgroundColour);
  fill(255);
  //top teeth
  for (int i = -1; i < 1400; i = i+190) {
    ellipse(i, 10, 200, 200);
  }
  //bottom teeth
  for (int i = -1; i < 1400; i = i+190) {
    ellipse(i, 590, 200, 200);
  }
  //cookie
  image (cookie, cookieX, cookieY);
  if (cookieX == 0 || cookieX == 1100 || cookieY == 310 || cookieY == 90) {
    cookieX = 550;
    cookieY = 200;
  }
  //blue circle
  noStroke();
  float r2=0;
  while (r2 <=250) {
    fill(46, 166, 255, 15);
    ellipse(circleEX, circleEY, r2, r2);
    r2+=3;
  }
  //letter E
  fill(0);
  textSize(150);
  text("E", textEX, textEY);

  circleEY = circleEY + speedE;
  speedE = speedE + gravity;
  textEY = textEY + speedE;
  speedE = speedE + gravity;
  if (textEY > 500 && circleEY > 500) {
    speedE = speedE * -0.9;
    textEY = 550;
    circleEY = 500;
  }
  //red circle
  float r=0;
  while (r <=250) {
    fill(255, 41, 41, 15);
    ellipse(circleVX, circleVY, r, r);
    r+=3;
  }
  //letter V
  fill(0);
  textSize(150);
  text("V", textVX, textVY);

  circleVY = circleVY + speedV;
  speedV = speedV + gravity;
  textVY = textVY + speedV;
  speedV = speedV + gravity;
  if (textVY > 500 && circleVY > 500) {
    speedV = speedV * -0.9;
    textVY = 550;
    circleVY = 500;
  }
  //green circle
  float r1=0;
  while (r1 <=250) {
    fill(105, 252, 115, 20);
    ellipse(circleAX, circleAY, r1, r1);
    r1+=3;
  }
  //letter A
  fill(0);
  textSize(150);
  text("A", textAX, textAY);
  circleAY = circleAY + speedA;
  speedA = speedA + gravity;
  textAY = textAY + speedA;
  speedA = speedA + gravity;
  if (textAY > 500 && circleAY > 500) {
    speedA = speedA * -0.9;
    textAY = 550;
    circleAY = 500;
  }
  //turqoise circle
  float r3=0;
  while (r3 <=250) {
    fill(72, 255, 241, 15);
    ellipse(circleNX, circleNY, r3, r3);
    r3+=3;
  }
  //letter N
  fill(0);
  textSize(150);
  text("N", textNX, textNY);

  circleNY = circleNY + speedN;
  speedN = speedN + gravity;
  textNY = textNY + speedN;
  speedN = speedN + gravity;
  if (textNY > 500 && circleNY > 500) {
    speedN = speedN * -0.9;
    textNY = 550;
    circleNY = 500;
  }
  //yellow circle
  float r4=0;
  while (r4 <=250) {
    fill(240, 252, 74, 15);
    ellipse(circleBX, circleBY, r4, r4);
    r4+=3;
  }
  //letter B
  fill(0);
  textSize(150);
  text("B", textBX, textBY);

  circleBY = circleBY + speedB;
  speedB = speedB + gravity;
  textBY = textBY + speedB;
  speedB = speedB + gravity;
  if (textBY > 500 && circleBY > 500) {
    speedB = speedB * -0.9;
    textBY = 550;
    circleBY = 500;
  }
  //mouse is a yellow star but turns red when conditions are met
  if (mouseX < 200 || mouseX > 1100 || mouseY < 50 || mouseY > 450) {
    cursor(redStar, 0, 0);
  } else {
    cursor(star, 0, 0);
  }


  keyPressed();  
  {
    //cookie moves when arrow buttons are pressed
    if (key == CODED) {
      if (keyCode == UP) {
        cookieY = cookieY - 5;
      } else if (keyCode == DOWN) {
        cookieY = cookieY + 5;
      } else if (keyCode == LEFT) {
        cookieX = cookieX - 5;
      } else if (keyCode == RIGHT) {
        cookieX = cookieX + 5;
      }
      //program is closed when ESC is pressed
      if (keyPressed) {
        if (keyCode == ESC) {
          exit();
        }
      }
    }
  }
}
//if mouse is pressed, background colour changes to different shades of pink
void mousePressed() {
  backgroundColour = color(229, random(151), 151);
}