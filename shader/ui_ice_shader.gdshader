shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 input_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	float color_average = (input_color.r + input_color.g + input_color.b) / 3.0;
	vec4 output_color = vec4(color_average, color_average, color_average, input_color.a);
	COLOR = output_color;
}
