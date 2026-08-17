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
// CRIAR TRIÂNGULO
// ========================================

vertex_begin(
    global.triangle_buffer,
    global.vertex_format
);


// Vértice 1
vertex_position_3d(
    global.triangle_buffer,
    -1,
    -1,
    0
);

vertex_colour(
    global.triangle_buffer,
    c_red,
    1
);


// Vértice 2
vertex_position_3d(
    global.triangle_buffer,
    1,
    -1,
    0
);

vertex_colour(
    global.triangle_buffer,
    c_green,
    1
);


// Vértice 3
vertex_position_3d(
    global.triangle_buffer,
    0,
    1,
    0
);

vertex_colour(
    global.triangle_buffer,
    c_blue,
    1
);


// Finalizar buffer
vertex_end(
    global.triangle_buffer
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