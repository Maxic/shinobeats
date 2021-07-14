shader_type canvas_item;
uniform bool transparent = false;
uniform bool dead = false;
uniform vec4 filter_color_1 : hint_color;
uniform vec4 filter_color_2 : hint_color;

void fragment(){
	COLOR = texture(TEXTURE, UV);
	
	// Transparent should never be replaced, only set alpha to 0 if flag is set
	if (COLOR.a != 0f && transparent) {
		// Filter these colors:
		if (COLOR == vec4(0.345, 0.552, 0.745, 1.0)){
			COLOR.a = 0.0
		}
		
		if (dead){
			//COLOR = vec4(1.0, 0.0, 0.0, 1.0);
		}
	}
}

//uniform sampler2D mask_texture;
// uniform vec2 node_size = vec2(256.0, 256.0);

//varying vec2 vert;

//void vertex(){
//    vert = VERTEX;
//}

// Get UV from source
//		vec2 full_uv = vert/node_size;
//
		// Static pattern shader
//		vec4 st = texture(mask_texture, full_uv);
//		COLOR = vec4(st.x, st.y, st.z, 1.0);
		
		