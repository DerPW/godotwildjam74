shader_type canvas_item;
render_mode unshaded;

uniform float circle_size : hint_range(0.0, 2);
uniform float screen_width;
uniform float screen_height;
uniform vec2 circle_position = vec2(0.5, 0.5);

void fragment() {
	float ratio = screen_width / screen_height;
	vec2 adjusted_uv = vec2(mix(circle_position.x, UV.x, ratio), UV.y);

	// Calculate the distances to the edges of the screen
    float dist_left = circle_position.x;
    float dist_right = 1.0 - circle_position.x;
    float dist_top = circle_position.y;
    float dist_bottom = 1.0 - circle_position.y;

    // Find the minimum distance to any edge
    float min_dist = min(min(dist_left, dist_right), min(dist_top, dist_bottom));

	// Find the maximum distance to any edge (this will define the maximum size of the circle)
    float max_dist = max(max(dist_left, dist_right), max(dist_top, dist_bottom));

	// Use circle_size as a scaling factor (1.0 means circle exactly fills the screen)
    float scaled_size = max_dist * circle_size;


	float dist = distance(circle_position, adjusted_uv);
	COLOR.a = step(scaled_size, dist);
}