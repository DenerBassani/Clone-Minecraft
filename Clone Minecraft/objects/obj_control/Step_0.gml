var center_x = display_get_width() / 2;
var center_y = display_get_height() / 2;

var delta_x = window_mouse_get_x();
var delta_y = window_mouse_get_y();

var dx = delta_x - center_x;
var dy = delta_y - center_y;

cam_yaw += dx * mouse_sensitivity;
cam_pitch -= dy * mouse_sensitivity;

cam_pitch = clamp(cam_pitch, -89, 89);

window_mouse_set(center_x, center_y);

// ========================================
// MOVIMENTO WASD
// ========================================

var move_x = 0;
var move_z = 0;


// W / S
if (keyboard_check(ord("W")))
{
    move_z += 1;
}

if (keyboard_check(ord("S")))
{
    move_z -= 1;
}


// A / D
if (keyboard_check(ord("A")))
{
    move_x -= 1;
}

if (keyboard_check(ord("D")))
{
    move_x += 1;
}


// ========================================
// NORMALIZAR MOVIMENTO
// ========================================

var move_length = sqrt(
    move_x * move_x +
    move_z * move_z
);

if (move_length > 0)
{
    move_x /= move_length;
    move_z /= move_length;
}


// ========================================
// DIREÇÃO DA CÂMERA
// ========================================

var yaw = degtorad(cam_yaw);

var forward_x = sin(yaw);
var forward_z = cos(yaw);

var right_x = cos(yaw);
var right_z = -sin(yaw);


// ========================================
// APLICAR MOVIMENTO
// ========================================

cam_x += (
    forward_x * move_z +
    right_x * move_x
) * move_speed;

cam_z += (
    forward_z * move_z +
    right_z * move_x
) * move_speed;