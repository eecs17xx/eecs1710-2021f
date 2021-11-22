uniform vec3 iResolution;

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

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec2 uv = fragCoord.xy / iResolution.xy;

	vec4 col = threshFilter(texture2D(tex0, uv).xyz);

	fragColor = col;
}

void main() {
	mainImage(gl_FragColor, gl_FragCoord.xy);
}