draw_clear(c_black);

matrix_set(
    matrix_world,
    matrix_build_identity()
);

vertex_submit(
    global.world_buffer,
    pr_trianglelist,
    -1
);