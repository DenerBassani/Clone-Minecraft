// ========================================
// PLAYER
// ========================================

player_x = 4;
player_y = 15;
player_z = 4;


// ========================================
// ROTAÇÃO
// ========================================

yaw = 0;
pitch = 0;


// ========================================
// MOVIMENTO
// ========================================

move_speed = 0.05;


// ========================================
// PLAYER LOCAL
// ========================================

global.local_player = id;


// ========================================
// MOUSE
// ========================================

mouse_sensitivity = 0.15;

mouse_center_x = window_get_width() * 0.5;
mouse_center_y = window_get_height() * 0.5;

window_mouse_set(
    mouse_center_x,
    mouse_center_y
);

// ========================================
// FÍSICA VERTICAL
// ========================================

player_height = 1.7;
player_radius = 0.30;

vertical_velocity = 0;
gravity = 0.01;
jump_force = 0.18;
grounded = false;

target_block_found = false;

target_block_x = -1;
target_block_y = -1;
target_block_z = -1;

place_block_x = -1;
place_block_y = -1;
place_block_z = -1;

ray_distance = 5;
ray_step = 0.05;

// ========================================
// HUD INVENTARIO
// ========================================

selected_block = 1;
selected_slot = 0;
