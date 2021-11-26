uniform vec3 resolution;

uniform sampler2D tex0;

uniform float threshold;

vec4 threshFilter(vec3 v) {
	float avg = (v.x + v.y + v.z) / 3.0;
    if (avg <= threshold / 255.0) {
      return vec4(1,1,1,1);
    } else {
      return vec4(0,0,0,1);
    }
}

void main() {
	vec2 uv = gl_FragCoord.xy / resolution.xy;
	vec2 uv2 = vec2(uv.x, abs(1.0 - uv.y));

	vec4 col = threshFilter(texture2D(tex0, uv).xyz);

	gl_FragColor = col;
}
