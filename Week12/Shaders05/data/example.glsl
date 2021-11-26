uniform vec2 resolution;
uniform float time;
uniform float rate;
uniform sampler2D texture;

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec2 v = (fragCoord.xy - (resolution * 0.5)) / min(resolution.y, resolution.x) * 10.0;
	vec2 uv = fragCoord.xy / resolution.xy;

	float t = time * 0.3;
	float r = 2.0;
	int N = 16;

	for (int i = 1; i < N; i++) {
		float d = (3.14159265 / float(N)) * (float(i) * 14.0);
		r += length(vec2(rate * v.y,rate * v.x)) + 1.21;
		v = vec2(v.x + cos(v.y + cos(r) + d) + cos(t), v.y - sin(v.x + cos(r) + d) + sin(t));
	}

	vec4 col = texture2D(texture, mix(uv, v, 0.01));

	fragColor = col;
}

void main() {
	mainImage(gl_FragColor, gl_FragCoord.xy);
}