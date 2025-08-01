// ~/.config/hypr/shaders/vibrance.glsl
precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

// Adjust this value for desired vibrancy/saturation
// 0.0 = no change, 1.0 = very high saturation
const float VIB_VIBRANCE = 0.8;
const vec3 VIB_RGB_BALANCE = vec3(1.0, 1.0, 1.0); // Keep at 1.0 for normal balance

void main() {
    vec4 color = texture2D(tex, v_texcoord);

    // Calculate luminance
    float luma = dot(color.rgb, vec3(0.2126, 0.7152, 0.0722));

    // Mix between grayscale (luma) and original color based on vibrancy
    vec3 sat_color = mix(vec3(luma), color.rgb, 1.0 + VIB_VIBRANCE);

    gl_FragColor = vec4(sat_color * VIB_RGB_BALANCE, color.a);
}
