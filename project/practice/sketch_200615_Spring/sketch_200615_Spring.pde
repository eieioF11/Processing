//Spring

float stiffness = 0.05;
float damping = 0.9;
float mass = 3.0;
float gravity = 0.0;
float velocityX = 0.0, velocityY = 0.0;
float targetX, targetY;
float x, y;
 
void setup() {
    size(400, 400);
    smooth();
}
 
void draw() {
    background(0);
 
    float forceX = stiffness * (targetX - x);
    float accelerationX = forceX / mass;
    velocityX = damping * (velocityX + accelerationX);
    x += velocityX;
 
    float forceY = stiffness * (targetY - y);
    forceY += gravity;
    float accelerationY = forceY / mass;
    velocityY = damping * (velocityY + accelerationY);
    y += velocityY;
    noStroke();
    fill(255);
    ellipse(x, y, 40, 40);
 
    stroke(127);
    noFill();
    line(mouseX, mouseY, x, y);
 
    targetX = mouseX;
    targetY = mouseY;
}
