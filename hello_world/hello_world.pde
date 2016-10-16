PImage image;
int slices = 32;
float angle = PI / slices;
PShape slice;
float radius;
float offset = 0;

void setup() {
  size(500, 500, P2D);
  
  radius = min(width, height) / 2;
  image = loadImage("rainbow-colored-zebra.jpg");
}

void draw() {
  background(255);
  offset += PI / 180;
  
  slice = createShape();
  slice.beginShape(TRIANGLE);
  slice.texture(image);
  slice.noStroke();
  slice.vertex(0, 0, image.width / 2, image.height / 2);
  slice.vertex(
    cos(angle) * radius,
    sin(angle) * radius,
    cos(angle + offset) * radius + image.width / 2,
    sin(angle + offset) * radius * image.height / 2
    );
    slice.vertex(
      cos(-angle) * radius,
      sin(-angle) * radius,
      cos(-angle + offset) * radius + image.width / 2,
      sin(-angle + offset) * radius + image.height / 2
      );
      slice.endShape();
      
      translate(width/2, height/2);
      for(int i = 0; i < slices; i++) {
        rotate(angle * 2);
        shape(slice);
      }
}