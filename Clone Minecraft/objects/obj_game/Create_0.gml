// ========================================
// MINECRAFT CLONE
// RENDERER 3D - VERSÃO FUNCIONAL
// ========================================


// ========================================
// CONFIGURAÇÕES
// ========================================

global.fov = 70;
global.znear = 0.1;
global.zfar = 1000;


// ========================================
// VERTEX FORMAT
// ========================================

vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_colour();

global.vertex_format = vertex_format_end();


// ========================================
// VERTEX BUFFER
// ========================================

global.triangle_buffer = vertex_create_buffer();

// ========================================
// INICIALIZAR BLOCOS
// ========================================

blocks_init()
world_init()

global.world_buffer = -1;

world_build_mesh();

// ========================================
// CRIAR CUBO
// ========================================

global.cube_buffer = vertex_create_buffer();

vertex_begin(
    global.cube_buffer,
    global.vertex_format
);


// ========================================
// FACE DA FRENTE
// ========================================

// Triângulo 1
vertex_position_3d(global.cube_buffer, -1, -1,  1);
vertex_colour(global.cube_buffer, c_red, 1);

vertex_position_3d(global.cube_buffer,  1, -1,  1);
vertex_colour(global.cube_buffer, c_red, 1);

vertex_position_3d(global.cube_buffer,  1,  1,  1);
vertex_colour(global.cube_buffer, c_red, 1);


// Triângulo 2
vertex_position_3d(global.cube_buffer, -1, -1,  1);
vertex_colour(global.cube_buffer, c_red, 1);

vertex_position_3d(global.cube_buffer,  1,  1,  1);
vertex_colour(global.cube_buffer, c_red, 1);

vertex_position_3d(global.cube_buffer, -1,  1,  1);
vertex_colour(global.cube_buffer, c_red, 1);


// ========================================
// FACE DE TRÁS
// ========================================

// Triângulo 1
vertex_position_3d(global.cube_buffer,  1, -1, -1);
vertex_colour(global.cube_buffer, c_green, 1);

vertex_position_3d(global.cube_buffer, -1, -1, -1);
vertex_colour(global.cube_buffer, c_green, 1);

vertex_position_3d(global.cube_buffer, -1,  1, -1);
vertex_colour(global.cube_buffer, c_green, 1);


// Triângulo 2
vertex_position_3d(global.cube_buffer,  1, -1, -1);
vertex_colour(global.cube_buffer, c_green, 1);

vertex_position_3d(global.cube_buffer, -1,  1, -1);
vertex_colour(global.cube_buffer, c_green, 1);

vertex_position_3d(global.cube_buffer,  1,  1, -1);
vertex_colour(global.cube_buffer, c_green, 1);


// ========================================
// FACE ESQUERDA
// ========================================

vertex_position_3d(global.cube_buffer, -1, -1, -1);
vertex_colour(global.cube_buffer, c_blue, 1);

vertex_position_3d(global.cube_buffer, -1, -1,  1);
vertex_colour(global.cube_buffer, c_blue, 1);

vertex_position_3d(global.cube_buffer, -1,  1,  1);
vertex_colour(global.cube_buffer, c_blue, 1);


vertex_position_3d(global.cube_buffer, -1, -1, -1);
vertex_colour(global.cube_buffer, c_blue, 1);

vertex_position_3d(global.cube_buffer, -1,  1,  1);
vertex_colour(global.cube_buffer, c_blue, 1);

vertex_position_3d(global.cube_buffer, -1,  1, -1);
vertex_colour(global.cube_buffer, c_blue, 1);


// ========================================
// FACE DIREITA
// ========================================

vertex_position_3d(global.cube_buffer, 1, -1,  1);
vertex_colour(global.cube_buffer, c_yellow, 1);

vertex_position_3d(global.cube_buffer, 1, -1, -1);
vertex_colour(global.cube_buffer, c_yellow, 1);

vertex_position_3d(global.cube_buffer, 1,  1, -1);
vertex_colour(global.cube_buffer, c_yellow, 1);


vertex_position_3d(global.cube_buffer, 1, -1,  1);
vertex_colour(global.cube_buffer, c_yellow, 1);

vertex_position_3d(global.cube_buffer, 1,  1, -1);
vertex_colour(global.cube_buffer, c_yellow, 1);

vertex_position_3d(global.cube_buffer, 1,  1,  1);
vertex_colour(global.cube_buffer, c_yellow, 1);


// ========================================
// FACE DE CIMA
// ========================================

vertex_position_3d(global.cube_buffer, -1, 1,  1);
vertex_colour(global.cube_buffer, c_white, 1);

vertex_position_3d(global.cube_buffer, 1, 1,  1);
vertex_colour(global.cube_buffer, c_white, 1);

vertex_position_3d(global.cube_buffer, 1, 1, -1);
vertex_colour(global.cube_buffer, c_white, 1);


vertex_position_3d(global.cube_buffer, -1, 1,  1);
vertex_colour(global.cube_buffer, c_white, 1);

vertex_position_3d(global.cube_buffer, 1, 1, -1);
vertex_colour(global.cube_buffer, c_white, 1);

vertex_position_3d(global.cube_buffer, -1, 1, -1);
vertex_colour(global.cube_buffer, c_white, 1);


// ========================================
// FACE DE BAIXO
// ========================================

vertex_position_3d(global.cube_buffer, -1, -1, -1);
vertex_colour(global.cube_buffer, c_black, 1);

vertex_position_3d(global.cube_buffer, 1, -1, -1);
vertex_colour(global.cube_buffer, c_black, 1);

vertex_position_3d(global.cube_buffer, 1, -1,  1);
vertex_colour(global.cube_buffer, c_black, 1);


vertex_position_3d(global.cube_buffer, -1, -1, -1);
vertex_colour(global.cube_buffer, c_black, 1);

vertex_position_3d(global.cube_buffer, 1, -1,  1);
vertex_colour(global.cube_buffer, c_black, 1);

vertex_position_3d(global.cube_buffer, -1, -1,  1);
vertex_colour(global.cube_buffer, c_black, 1);


vertex_end(
    global.cube_buffer
);


// ========================================
// CÂMERA
// ========================================

global.camera = camera_create();


// ========================================
// MATRIZ DE VISÃO
// ========================================

var view_matrix = matrix_build_lookat(
    0, 0, -5,
    0, 0, 0,
    0, 1, 0
);


// ========================================
// PROPORÇÃO DA VIEWPORT
// ========================================

var aspect =
    view_wport[0] / view_hport[0];


// ========================================
// MATRIZ DE PROJEÇÃO
// ========================================

var projection_matrix =
    matrix_build_projection_perspective_fov(
        -global.fov,
        aspect,
        global.znear,
        global.zfar
    );


// ========================================
// CONFIGURAR CÂMERA
// ========================================

camera_set_view_mat(
    global.camera,
    view_matrix
);

camera_set_proj_mat(
    global.camera,
    projection_matrix
);


// ========================================
// ATIVAR CÂMERA
// ========================================

view_camera[0] = global.camera;


// ========================================
// Z-BUFFER
// ========================================

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

global.cube_rotation = 0;