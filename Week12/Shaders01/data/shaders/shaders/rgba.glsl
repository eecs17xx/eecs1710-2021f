uniform vec3 iResolution;

uniform sampler2D tex0;
uniform sampler2D tex1;

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec2 uv2 = vec2(uv.x, abs(1.0 - uv.y));

	vec4 t0 = texture2D(tex0, uv2);//2);
	vec4 t1 = texture2D(tex1, uv2);
	vec4 col = vec4(t0.xyz, t1.x);

	fragColor = col;
}

void main() {
	mainImage(gl_FragColor, gl_FragCoord.xy);
}