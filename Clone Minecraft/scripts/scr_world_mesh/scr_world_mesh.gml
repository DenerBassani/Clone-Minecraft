function world_build_mesh()
{
    // ========================================
    // CRIAR / LIMPAR BUFFER DO MUNDO
    // ========================================

    if (global.world_buffer != -1)
    {
        vertex_delete_buffer(global.world_buffer);
    }

    global.world_buffer = vertex_create_buffer();


    // ========================================
    // COMEÇAR VERTICES
    // ========================================

    vertex_begin(
        global.world_buffer,
        global.vertex_format
    );


    // ========================================
    // PERCORRER O MUNDO
    // ========================================

    for (var ix = 0; ix < global.world_size_x; ix++)
    {
        for (var iy = 0; iy < global.world_size_y; iy++)
        {
            for (var iz = 0; iz < global.world_size_z; iz++)
            {
                var block_id = global.world[ix][iy][iz];

                // ID 0 = AR
                if (block_id == 0)
                {
                    continue;
                }


                // ========================================
                // POSIÇÃO DO BLOCO
                // ========================================

                var bx = ix;
                var by = iy;
                var bz = iz;


                // ========================================
				// COR DO BLOCO
				// ========================================

				var block_color = c_white;

				if (block_id == 1)
				{
				    // GRAMA
				    block_color = make_colour_rgb(60, 170, 70);
				}
				else if (block_id == 2)
				{
				    // TERRA
				    block_color = make_colour_rgb(120, 75, 45);
				}
				else if (block_id == 3)
				{
				    // PEDRA
				    block_color = make_colour_rgb(120, 120, 120);
				}


                // ========================================
                // CUBO 1x1x1
                // ========================================

                var x0 = bx;
                var x1 = bx + 1;

                var y0 = by;
                var y1 = by + 1;

                var z0 = bz;
                var z1 = bz + 1;


                // ========================================
                // FRENTE
                // ========================================
				if (world_get(ix, iy, iz + 1) == 0)
				{
	                vertex_position_3d(global.world_buffer, x0, y0, z1);
	                vertex_colour(global.world_buffer, block_color, 1);

	                vertex_position_3d(global.world_buffer, x1, y0, z1);
	                vertex_colour(global.world_buffer, block_color, 1);

	                vertex_position_3d(global.world_buffer, x1, y1, z1);
	                vertex_colour(global.world_buffer, block_color, 1);


	                vertex_position_3d(global.world_buffer, x0, y0, z1);
	                vertex_colour(global.world_buffer, block_color, 1);

	                vertex_position_3d(global.world_buffer, x1, y1, z1);
	                vertex_colour(global.world_buffer, block_color, 1);

	                vertex_position_3d(global.world_buffer, x0, y1, z1);
	                vertex_colour(global.world_buffer, block_color, 1);

				}
                // ========================================
				// TRÁS
				// ========================================

				if (world_get(ix, iy, iz - 1) == 0)
				{
				    vertex_position_3d(global.world_buffer, x1, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);


				    vertex_position_3d(global.world_buffer, x1, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);
				}


                // ========================================
				// ESQUERDA
				// ========================================

				if (world_get(ix - 1, iy, iz) == 0)
				{
				    vertex_position_3d(global.world_buffer, x0, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y0, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y1, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y1, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);
				}


               // ========================================
				// DIREITA
				// ========================================

				if (world_get(ix + 1, iy, iz) == 0)
				{
				    vertex_position_3d(global.world_buffer, x1, y0, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y0, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y1, z1);
				    vertex_colour(global.world_buffer, block_color, 1);
				}

				// ========================================
				// CIMA
				// ========================================

				if (world_get(ix, iy + 1, iz) == 0)
				{
				    vertex_position_3d(global.world_buffer, x0, y1, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y1, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);


				    vertex_position_3d(global.world_buffer, x0, y1, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y1, z0);
				    vertex_colour(global.world_buffer, block_color, 1);
				}
				
				// ========================================
				// BAIXO
				// ========================================

				if (world_get(ix, iy - 1, iz) == 0)
				{
				    vertex_position_3d(global.world_buffer, x0, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y0, z1);
				    vertex_colour(global.world_buffer, block_color, 1);


				    vertex_position_3d(global.world_buffer, x0, y0, z0);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x1, y0, z1);
				    vertex_colour(global.world_buffer, block_color, 1);

				    vertex_position_3d(global.world_buffer, x0, y0, z1);
				    vertex_colour(global.world_buffer, block_color, 1);
				}   
				
			}
        }
    }



    // ========================================
    // FINALIZAR BUFFER
    // ========================================

    vertex_end(
        global.world_buffer
    );
}