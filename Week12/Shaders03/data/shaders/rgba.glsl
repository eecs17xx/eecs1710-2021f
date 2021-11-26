uniform vec3 resolution;

uniform sampler2D tex0;
uniform sampler2D tex1;

void main() {
	vec2 uv = gl_FragCoord.xy / resolution.xy;
	vec2 uv2 = vec2(uv.x, abs(1.0 - uv.y));

	vec4 t0 = texture2D(tex0, uv2);//2);
	vec4 t1 = texture2D(tex1, uv2);
	vec4 col = vec4(t0.xyz, t1.x);

	gl_FragColor = col;
}

