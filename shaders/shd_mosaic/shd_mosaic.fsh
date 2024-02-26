varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 resolution;
uniform float tile_count;

void main() {
    //float tile_size = 1.0 / tile_count;
    vec2 tile_size = vec2(1.0 / tile_count, resolution.x / resolution.y / tile_count);
    vec2 mosaic_tile_uv = v_vTexcoord - mod(v_vTexcoord, tile_size);
    
    gl_FragColor = texture2D(gm_BaseTexture, mosaic_tile_uv);
}
