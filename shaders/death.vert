#version 120
#extension GL_EXT_gpu_shader4 : enable

uniform vec2 position; // 2D offset (X, Y)
uniform float scale;   // 1D size multiplier

varying vec2 tex;

const vec2 VERTICES[4] = vec2[] (
    vec2(-1.0, -1.0), // Bottom-Left
    vec2( 1.0, -1.0), // Bottom-Right
    vec2(-1.0,  1.0), // Top-Left
    vec2( 1.0,  1.0) // Top-Right
);

const vec2 TEXCOORDS[4] = vec2[] (
    vec2(0.0, 0.0), // Bottom-Left
    vec2( 1.0, 0.0), // Bottom-Right
    vec2( 0.0,  1.0), // Top-Left
    vec2( 1.0,  1.0) // Top-Right
);

void main() {
    vec2 pos = VERTICES[gl_VertexID];

    // TO DO: Scale the quad size relative to its center
    // ...
    pos *= 1.5*scale;
    
    // TO DO: Shift the quad to the desired 2D position
    // 
    pos += position;

    
    gl_Position = vec4(pos, 0.0, 1.0);
    tex = TEXCOORDS[gl_VertexID];
}
