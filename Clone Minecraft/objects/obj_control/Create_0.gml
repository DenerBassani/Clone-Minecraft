// ========================================
// FORMATO DO VÉRTICE
// ========================================

vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_colour();

format = vertex_format_end();


// ========================================
// CRIAR BUFFER DO CUBO
// ========================================

block = vertex_create_buffer();

vertex_begin(block, format);


// ========================================
// FRENTE - Z = 0
// ========================================

// Triângulo 1
vertex_position_3d(block, 0, 0, 0);
vertex_colour(block, c_red, 1);

vertex_position_3d(block, 1, 0, 0);
vertex_colour(block, c_red, 1);

vertex_position_3d(block, 0, 1, 0);
vertex_colour(block, c_red, 1);

// Triângulo 2
vertex_position_3d(block, 1, 0, 0);
vertex_colour(block, c_red, 1);

vertex_position_3d(block, 1, 1, 0);
vertex_colour(block, c_red, 1);

vertex_position_3d(block, 0, 1, 0);
vertex_colour(block, c_red, 1);


// ========================================
// TRÁS - Z = 1
// ========================================

// Triângulo 1
vertex_position_3d(block, 1, 0, 1);
vertex_colour(block, c_green, 1);

vertex_position_3d(block, 0, 0, 1);
vertex_colour(block, c_green, 1);

vertex_position_3d(block, 1, 1, 1);
vertex_colour(block, c_green, 1);

// Triângulo 2
vertex_position_3d(block, 0, 0, 1);
vertex_colour(block, c_green, 1);

vertex_position_3d(block, 0, 1, 1);
vertex_colour(block, c_green, 1);

vertex_position_3d(block, 1, 1, 1);
vertex_colour(block, c_green, 1);


// ========================================
// ESQUERDA - X = 0
// ========================================

// Triângulo 1
vertex_position_3d(block, 0, 0, 1);
vertex_colour(block, c_blue, 1);

vertex_position_3d(block, 0, 0, 0);
vertex_colour(block, c_blue, 1);

vertex_position_3d(block, 0, 1, 1);
vertex_colour(block, c_blue, 1);

// Triângulo 2
vertex_position_3d(block, 0, 0, 0);
vertex_colour(block, c_blue, 1);

vertex_position_3d(block, 0, 1, 0);
vertex_colour(block, c_blue, 1);

vertex_position_3d(block, 0, 1, 1);
vertex_colour(block, c_blue, 1);


// ========================================
// DIREITA - X = 1
// ========================================

// Triângulo 1
vertex_position_3d(block, 1, 0, 0);
vertex_colour(block, c_yellow, 1);

vertex_position_3d(block, 1, 0, 1);
vertex_colour(block, c_yellow, 1);

vertex_position_3d(block, 1, 1, 0);
vertex_colour(block, c_yellow, 1);

// Triângulo 2
vertex_position_3d(block, 1, 0, 1);
vertex_colour(block, c_yellow, 1);

vertex_position_3d(block, 1, 1, 1);
vertex_colour(block, c_yellow, 1);

vertex_position_3d(block, 1, 1, 0);
vertex_colour(block, c_yellow, 1);


// ========================================
// TOPO - Y = 1
// ========================================

// Triângulo 1
vertex_position_3d(block, 0, 1, 0);
vertex_colour(block, c_white, 1);

vertex_position_3d(block, 1, 1, 0);
vertex_colour(block, c_white, 1);

vertex_position_3d(block, 0, 1, 1);
vertex_colour(block, c_white, 1);

// Triângulo 2
vertex_position_3d(block, 1, 1, 0);
vertex_colour(block, c_white, 1);

vertex_position_3d(block, 1, 1, 1);
vertex_colour(block, c_white, 1);

vertex_position_3d(block, 0, 1, 1);
vertex_colour(block, c_white, 1);


// ========================================
// BAIXO - Y = 0
// ========================================

// Triângulo 1
vertex_position_3d(block, 0, 0, 1);
vertex_colour(block, c_gray, 1);

vertex_position_3d(block, 1, 0, 1);
vertex_colour(block, c_gray, 1);

vertex_position_3d(block, 0, 0, 0);
vertex_colour(block, c_gray, 1);

// Triângulo 2
vertex_position_3d(block, 1, 0, 1);
vertex_colour(block, c_gray, 1);

vertex_position_3d(block, 1, 0, 0);
vertex_colour(block, c_gray, 1);

vertex_position_3d(block, 0, 0, 0);
vertex_colour(block, c_gray, 1);


vertex_end(block);


// ========================================
// CONFIGURAÇÃO 3D
// ========================================

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

gpu_set_cullmode(cull_noculling);

// ========================================
// CÂMERA
// ========================================

cam_x = 3;
cam_y = 3;
cam_z = -5;

var target_x = 0.5;
var target_y = 0.5;
var target_z = 0.5;

var dx = target_x - cam_x;
var dy = target_y - cam_y;
var dz = target_z - cam_z;

cam_yaw = radtodeg(arctan2(dx, dz));

var horizontal_distance = sqrt(dx * dx + dz * dz);

cam_pitch = radtodeg(
    arctan2(dy, horizontal_distance)
);

mouse_sensitivity = 0.15;
move_speed = 0.1;

