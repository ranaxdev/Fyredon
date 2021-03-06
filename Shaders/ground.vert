// Copyright Fyredon. All Rights Reserved.
/*=============================================================================
	ground.vert : Vertex Shader for Ground Plane Grid : Niall
=============================================================================*/

#version 400 core 

// Input 
layout (location = 0) in vec3 v_P;
layout (location = 1) in vec3 v_N;
layout (location = 2) in vec3 v_C;
layout (location = 3) in vec2 v_UV;

uniform mat4 model;
uniform mat4 view;
uniform mat4 proj;
uniform mat3 model_normal; 

out vec3 colour; 
out vec2 uv; 
out vec3 poscol; 
out vec3 normal_world; 


void main()
{
	vec4 pos = proj * view * model * vec4(v_P, 1.0);
	gl_Position = pos; 
	
	normal_world = model_normal * v_N; 
	poscol = vec3(pos.x, pos.y, pos.z);
	colour = v_C;
	uv = v_UV;
}

