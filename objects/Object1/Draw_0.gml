if (keyboard_check(vk_up)) tile_count += 0.01;
if (keyboard_check(vk_down)) tile_count -= 0.01;

if (keyboard_check(vk_left)) tile_padding += 0.001;
if (keyboard_check(vk_right)) tile_padding -= 0.001;

gpu_set_texfilter(true);

shader_set(shd_mosaic);
var uniform_resolution = shader_get_uniform(shd_mosaic, "resolution");
var uniform_tile_count = shader_get_uniform(shd_mosaic, "tile_count");
var uniform_tile_padding = shader_get_uniform(shd_mosaic, "tile_padding");
shader_set_uniform_f(uniform_resolution, sprite_get_width(images[index]), sprite_get_height(images[index]));
shader_set_uniform_f(uniform_tile_count, tile_count);
shader_set_uniform_f(uniform_tile_padding, tile_padding);
draw_sprite(images[index], 0, 0, 0);
shader_reset();

draw_rectangle_colour(0, 0, 400, 88, c_white, c_white, c_white, c_white, false);
draw_text_colour(32, 12, $"FPS: {fps}", c_black, c_black, c_black, c_black, 1);
draw_text_colour(32, 28, $"Tile count: {tile_count}", c_black, c_black, c_black, c_black, 1);
draw_text_colour(32, 44, $"Tile padding: {tile_padding}", c_black, c_black, c_black, c_black, 1);