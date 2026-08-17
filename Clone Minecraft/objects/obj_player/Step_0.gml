// ========================================
// MOUSE FPS
// ========================================

var mouse_x_now = window_mouse_get_x();
var mouse_y_now = window_mouse_get_y();

var mouse_dx = mouse_x_now - mouse_center_x;
var mouse_dy = mouse_y_now - mouse_center_y;


// Rotação horizontal
yaw += mouse_dx * mouse_sensitivity;


// Rotação vertical
pitch -= mouse_dy * mouse_sensitivity;


// Limitar olhar para cima/baixo
pitch = clamp(pitch, -89, 89);


// Reposicionar mouse no centro
window_mouse_set(
    mouse_center_x,
    mouse_center_y
);

// ========================================
// MOVIMENTO RELATIVO À CÂMERA
// ========================================

var forward_x = dcos(yaw);
var forward_z = dsin(yaw);


// Direção lateral
var right_x = -dsin(yaw);
var right_z = dcos(yaw);


// ========================================
// FRENTE / TRÁS
// ========================================

if (keyboard_check(ord("W")))
{
    player_x += forward_x * move_speed;
    player_z += forward_z * move_speed;
}

if (keyboard_check(ord("S")))
{
    player_x -= forward_x * move_speed;
    player_z -= forward_z * move_speed;
}


// ========================================
// ESQUERDA / DIREITA
// ========================================

if (keyboard_check(ord("A")))
{
    player_x -= right_x * move_speed;
    player_z -= right_z * move_speed;
}

if (keyboard_check(ord("D")))
{
    player_x += right_x * move_speed;
    player_z += right_z * move_speed;
}