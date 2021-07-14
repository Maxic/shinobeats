shader_type canvas_item;
uniform sampler2D mask_texture;
uniform vec2 node_size = vec2(256.0, 256.0);

varying vec2 vert;

void vertex(){
    vert = VERTEX;
}

void fragment(){
	COLOR = texture(TEXTURE, UV);
	if (COLOR.a != 0f && COLOR != vec4(0f,0f,0f,1f)) {
		vec2 full_uv = vert/node_size;
		
		vec4 st = texture(mask_texture, full_uv);
		COLOR = vec4(st.x, st.y, st.z, 1.0);
		
		//COLOR = vec4(COLOR.x, COLOR.y, COLOR.z, 0.0);
	}
}
