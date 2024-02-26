varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 resolution;
uniform float tile_count;
uniform float tile_padding;

void main() {
    //float tile_size = 1.0 / tile_count;
    vec2 tile_size = vec2(1.0 / tile_count, resolution.x / resolution.y / tile_count);
    vec2 mosaic_tile_uv = v_vTexcoord - mod(v_vTexcoord, tile_size);
    
    gl_FragColor = texture2D(gm_BaseTexture, mosaic_tile_uv);
    
    vec2 mosaic_center_uv = mosaic_tile_uv + tile_size * 0.5;
    //float distance_to_center = distance(v_vTexcoord, mosaic_center_uv);
    //float tile_half_size = tile_size.x * 0.5;
    
    vec2 uv_to_center = v_vTexcoord - mosaic_center_uv;
    uv_to_center.y *= resolution.y / resolution.x;
    
    float distance_to_center = length(uv_to_center) * tile_padding;
    float tile_half_size = tile_size.x * 0.5;
    
    if (distance_to_center > tile_half_size) {
        gl_FragColor.rgb = vec3(0);
    }
}
