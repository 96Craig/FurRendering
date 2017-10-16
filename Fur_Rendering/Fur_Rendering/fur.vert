// textured.vert
// use textures, but no lighting
#version 330

uniform mat4 modelview;
uniform mat4 projection;

uniform vec3 displacement;

uniform float layer;

in  vec3 in_Position;
in  vec3 in_Normal;

in vec2 in_TexCoord;

out vec2 ex_TexCoord;

out float ex_fragLayer;


// multiply each vertex position by the MVP matrix
void main(void) {

	vec3 shell = in_Position.xyz + ((in_Normal.xyz * layer)*displacement);
	vec4 newPos = vec4(shell, 1.0);

	gl_Position = (projection * modelview * newPos);

	ex_TexCoord = in_TexCoord;

	ex_fragLayer = layer;

}