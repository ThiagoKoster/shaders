shader_type canvas_item;
render_mode blend_mix;

const vec3 beige  = vec3(.976, .949, .878);
const vec3 red = vec3(0.725, 0.141, 0.149);
const vec3 yellow = vec3(0.988, 0.784, 0.173);
const vec3 blue   = vec3(0.012, 0.388, 0.624);


const vec3 black  = vec3(0.078, 0.09, 0.114);
const float lineWidth = 0.02;

float line(in float pos, float width){
	float halfWidth = width * 0.5;
    return step(-halfWidth, pos) - step(halfWidth, pos);
}

float rect(vec2 pos, float width, float height){
	return line(pos.x,width) * line(pos.y,height);
}

void fragment(){
	vec2 st = UV.xy;
	vec3 col = beige;
	
	float redRec = rect(st, 0.4,0.5);
	float yellowRec = rect(st - vec2(0.98,0.0), 0.04, 0.5);
	float blueRec = rect(st - vec2(0.98,0.85), 0.04, 0.40);
	//vertical black lines
	float blackLines = line(st.x - 0.2, lineWidth);
	blackLines += line(st.x - 0.96, lineWidth);
	blackLines += line(st.x - 0.75, lineWidth);
	blackLines += rect(st - vec2(0.1,0.0), lineWidth, 1.3);
	//horizontal black lines
	blackLines += line(st.y - 0.25, lineWidth);
	blackLines += line(st.y - 0.65, lineWidth);
	vec3 blackLine = vec3(blackLines);
	vec3 color = mix(col, red, redRec);
	color = mix(color, yellow, yellowRec);
	color = mix(color, blue, blueRec);
	color = mix(color,black,blackLine);

	COLOR = vec4(color,1.0);
}