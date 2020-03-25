final int LIFE_W = 50;
final int LIFE_H = 51;
final int GROUNDHOG_W = 80;
final int GROUNDHOG_H = 80;
final int SOIL_W = 640;
final int SOIL_H = 320;
final int ROBOT_W = 80;
final int ROBOT_H = 80;
final int SOLDIER_W = 80;
final int SOLDIER_H = 80;
final int grid = 80;

int robotX, robotY, soldierX, soldierY, laserX1, laserX2;

PImage bg, groundhog, life, robot, soil, soldier;

void setup(){
	size(640, 480);

	// load images
  bg = loadImage("img/bg.jpg");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  imageMode(CORNER);
  
  //set up robot
  robotX = floor(random(grid*2, width - ROBOT_W));
  robotY = grid * floor(random(2,6));
  
  //set up soldier
  soldierY = grid * floor(random(2,6));
  soldierX = 0;
  
  //set up laser
  laserX1 = robotX + 25;
  laserX2 = robotX + 25;
}


void draw() {
  
  //put bg
  image(bg, 0, 0, width, height);
  
  //put life
  image(life, 10, 10, LIFE_W, LIFE_H);
  image(life, 10 + LIFE_W + 20, 10, LIFE_W, LIFE_H);
  image(life, 10 + LIFE_W*2 + 20*2, 10, LIFE_W, LIFE_H);
  
  //put grass
  noStroke();
  fill(124, 204, 25);
  rect(0, grid*2 - 15, width, 15);
  
  //put soil
  image(soil, 0, grid*2, SOIL_W, SOIL_H);
  
  //put groundhog
  image(groundhog, width/2 - GROUNDHOG_W/2, grid, GROUNDHOG_W, GROUNDHOG_H);
  
  //put sun
  stroke(255,255,0);
  strokeWeight(5);
  fill(253,184,19);
  ellipse(width - 50, 50, 120,120);
  
  //laser move
  noStroke();
  fill(255,0,0);
  rect(laserX2, robotY + 32, 40, 10, 5);
  laserX2 -= 2;
  if (laserX2 < laserX1 - grid*2 - 25){
    laserX2 = laserX1;
  }
  
  //put robot
  image(robot, robotX, robotY, ROBOT_W, ROBOT_H);
  
  //put soldier
	image(soldier, soldierX, soldierY, SOLDIER_W, SOLDIER_H);

  //soldier move
  soldierX += 2;
  if (soldierX > width){
    soldierX = -SOLDIER_W;
  }
}
