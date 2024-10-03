#version 330
in vec2 texcoord;				// texture coordinate of the fragment

uniform float dim;				// dim of the window (0.0 - 1.0)
uniform float corner_radius;	// corner radius of the window (pixels)
uniform sampler2D tex;			// texture of the window

// Define tweakable variables
vec4 borderFocused = vec4(0.231,0.259,0.38,1.0);
vec4 border = vec4(0.161,0.18,0.259,1.0);
float borderWidth = 2;
float cornerRadius = corner_radius;

// Default window post-processing:
// 1) invert color
// 2) opacity / transparency
// 3) max-brightness clamping
// 4) rounded corners
vec4 default_post_processing(vec4 c);

// get window size
ivec2 window_size = textureSize(tex, 0);

// Define useful functios
bool corner(bool left, bool top, float cx, float cy) {
    return (
        ((left   && texcoord.x < cx) || (!left && texcoord.x > cx))
        && ((top && texcoord.y < cy) || (!top  && texcoord.y > cy))
        && pow(cx-texcoord.x, 2)
            + pow(cy-texcoord.y, 2)
            > pow(cornerRadius-borderWidth, 2)
    );
}
// Default window shader:
// 1) fetch the specified pixel
// 2) apply default post-processing
vec4 window_shader() {
    vec4 c = texelFetch(tex, ivec2(texcoord), 0);

    if (c.a == 1 && (
        // borders
        texcoord.x < borderWidth
        || texcoord.y < borderWidth
        || texcoord.x > window_size.x - borderWidth
        || texcoord.y > window_size.y - borderWidth
        // rounded corners
        || corner(true,  true,  cornerRadius,               cornerRadius)
        || corner(false, true,  window_size.x-cornerRadius, cornerRadius)
        || corner(false, false, window_size.x-cornerRadius, window_size.y-cornerRadius)
        || corner(true,  false, cornerRadius,               window_size.y-cornerRadius)
    )) {
		if (dim == 0.0) {
			c = borderFocused;
		} else {
			c = border;
		}
	}

    return default_post_processing(c);
}
