// Game params
PVector WINDOW_SIZE = new PVector(1500,800);
color BG = color(87, 199, 200);
int FPS = 40;

// Game objects
GameController gameController;
PipeController pipeController;
Bird bird;

void settings(){
  size(int(WINDOW_SIZE.x), int(WINDOW_SIZE.y));
}

void setup(){
  frameRate = FPS;
  bird = new Bird();
  pipeController = new PipeController();
  gameController = new GameController(bird,pipeController);
  
  pipeController.setController(gameController);
  pipeController.generatePipes();
}

void keyPressed(){
  if (keyCode == 38 && !bird.dead){ // up arrow
    bird.jump();
  }
}

void draw(){
  background(BG);
  
  bird.update();
  pipeController.updatePipes();
  gameController.showScore();
}
