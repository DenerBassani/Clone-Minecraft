// ========================================
// RENDERIZAÇÃO 3D
// ========================================

draw_clear(c_black);


// ========================================
// MATRIZ DO MUNDO
// ========================================

matrix_set(
    matrix_world,
    matrix_build_identity()
);


// ========================================
// DESENHAR TRIÂNGULO
// ========================================

vertex_submit(
    global.triangle_buffer,
    pr_trianglelist,
    -1
);