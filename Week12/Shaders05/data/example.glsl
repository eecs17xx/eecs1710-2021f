uniform vec2 resolution;
uniform float time;
uniform float rate;
uniform sampler2D tex0;

void main() {
	vec2 v = (gl_FragCoord.xy - (resolution * 0.5)) / min(resolution.y, resolution.x) * 10.0;
	vec2 uv = gl_FragCoord.xy / resolution.xy;
	vec2 uv2 = vec2(uv.x, abs(1.0 - uv.y));

	float t = time * 0.3;
	float r = 2.0;
	int N = 16;

	for (int i = 1; i < N; i++) {
		float d = (3.14159265 / float(N)) * (float(i) * 14.0);
		r += length(vec2(rate * v.y,rate * v.x)) + 1.21;
		v = vec2(v.x + cos(v.y + cos(r) + d) + cos(t), v.y - sin(v.x + cos(r) + d) + sin(t));
	}

	vec4 col = texture2D(tex0, mix(uv2, v, 0.01));

	gl_FragColor = col;
}
