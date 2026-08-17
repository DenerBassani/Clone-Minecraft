// ========================================
// PROJEÇÃO
// ========================================

var aspect = display_get_width() / display_get_height();

var projection = matrix_build_projection_perspective_fov(
    60,
    aspect,
    0.1,
    100
);


// ========================================
// CÂMERA
// ========================================

var view = matrix_build_lookat(
    0, 0, -5,
    0, 0, 0,
    0, 1, 0
);


// ========================================
// MUNDO
// ========================================

var world = matrix_build_identity();


// ========================================
// APLICAR MATRIZES
// ========================================

matrix_set(matrix_projection, projection);
matrix_set(matrix_view, view);
matrix_set(matrix_world, world);


// ========================================
// DESENHAR
// ========================================

vertex_submit(
    block,
    pr_trianglelist,
    -1
);