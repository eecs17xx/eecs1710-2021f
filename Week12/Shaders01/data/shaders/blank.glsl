uniform vec3 resolution;

uniform sampler2D tex0;

void main() {
	vec2 uv = gl_FragCoord.xy / resolution.xy;

	vec4 col = texture2D(tex0, uv);

	gl_FragColor = col;
}

