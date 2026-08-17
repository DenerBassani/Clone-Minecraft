// ========================================
// FORMATO DO VÉRTICE
// ========================================

vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_texcoord();

format = vertex_format_end();


// ========================================
// CRIAR BUFFER
// ========================================

block = vertex_create_buffer();

vertex_begin(block, format);


// ========================================
// QUADRADO - TRIÂNGULO 1
// ========================================

vertex_position_3d(block, 0, 0, 0);
vertex_texcoord(block, 0, 0);

vertex_position_3d(block, 1, 0, 0);
vertex_texcoord(block, 1, 0);

vertex_position_3d(block, 0, 1, 0);
vertex_texcoord(block, 0, 1);


// ========================================
// QUADRADO - TRIÂNGULO 2
// ========================================

vertex_position_3d(block, 1, 0, 0);
vertex_texcoord(block, 1, 0);

vertex_position_3d(block, 1, 1, 0);
vertex_texcoord(block, 1, 1);

vertex_position_3d(block, 0, 1, 0);
vertex_texcoord(block, 0, 1);


vertex_end(block);

// ========================================
// CONFIGURAÇÃO 3D
// ========================================

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

// Desabilita o corte das faces
// enquanto estamos testando
gpu_set_cullmode(cull_noculling);