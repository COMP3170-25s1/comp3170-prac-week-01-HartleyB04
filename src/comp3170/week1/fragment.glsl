#version 410

uniform vec3 u_colour;			// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main() {
   
   vec2 p = gl_FragCoord.xy / u_screenSize;   // scale p into range (0,0) to (1,1)
   vec2 v = abs(p - vec2(0.5, 0.5));  
   
   float d = v.x + v.y;
   
   // float d = max(v.x * 2, v.y * 2);   // make a square 
   
   // float d = distance(p, vec2(0.5, 0.5));    // calculate distance to midpoint makes a circle
   
  
   if (d < 0.4) {
      o_colour = vec4(u_colour, 1);
   }
   else {
      o_colour = vec4(1,1,1,1); // white
   }
}