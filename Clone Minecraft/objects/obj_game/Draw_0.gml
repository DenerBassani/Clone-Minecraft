// ========================================
// LIMPAR TELA
// ========================================

draw_clear(c_black);


// ========================================
// WORLD MATRIX
// ========================================

matrix_set(
    matrix_world,
    matrix_build_identity()
);


// ========================================
// DESENHAR MUNDO
// ========================================

vertex_submit(
    global.world_buffer,
    pr_trianglelist,
    -1
);


// ========================================
// CONTORNO DO BLOCO SELECIONADO
// ========================================

var player = global.local_player;

if (instance_exists(player))
{
    if (player.target_block_found)
    {
        var bx = player.target_block_x;
        var by = player.target_block_y;
        var bz = player.target_block_z;

        var e = 0.002;

        var x0 = bx - e;
        var x1 = bx + 1 + e;

        var y0 = by - e;
        var y1 = by + 1 + e;

        var z0 = bz - e;
        var z1 = bz + 1 + e;


        // ========================================
        // CRIAR BUFFER TEMPORÁRIO
        // ========================================

        var outline_buffer = vertex_create_buffer();

        vertex_begin(
            outline_buffer,
            global.vertex_format
        );


        // ========================================
        // BASE
        // ========================================

        vertex_position_3d(outline_buffer, x0, y0, z0);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x1, y0, z0);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x1, y0, z0);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x1, y0, z1);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x1, y0, z1);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x0, y0, z1);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x0, y0, z1);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x0, y0, z0);
        vertex_colour(outline_buffer, c_white, 1);


        // ========================================
        // TOPO
        // ========================================

        vertex_position_3d(outline_buffer, x0, y1, z0);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x1, y1, z0);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x1, y1, z0);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x1, y1, z1);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x1, y1, z1);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x0, y1, z1);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x0, y1, z1);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x0, y1, z0);
        vertex_colour(outline_buffer, c_white, 1);


        // ========================================
        // VERTICAIS
        // ========================================

        vertex_position_3d(outline_buffer, x0, y0, z0);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x0, y1, z0);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x1, y0, z0);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x1, y1, z0);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x0, y0, z1);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x0, y1, z1);
        vertex_colour(outline_buffer, c_white, 1);


        vertex_position_3d(outline_buffer, x1, y0, z1);
        vertex_colour(outline_buffer, c_white, 1);

        vertex_position_3d(outline_buffer, x1, y1, z1);
        vertex_colour(outline_buffer, c_white, 1);


        // ========================================
        // FINALIZAR E DESENHAR
        // ========================================

        vertex_end(outline_buffer);

        vertex_submit(
            outline_buffer,
            pr_linelist,
            -1
        );

        vertex_delete_buffer(outline_buffer);
    }
}