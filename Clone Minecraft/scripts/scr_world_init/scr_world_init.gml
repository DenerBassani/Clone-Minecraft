function world_init()
{
    // ========================================
    // TAMANHO DO MUNDO
    // ========================================

    global.world_size_x = 8;
    global.world_size_y = 10;
    global.world_size_z = 8;


    // ========================================
    // CRIAR MUNDO
    // ========================================

    global.world = array_create(
        global.world_size_x
    );


    for (var ix = 0; ix < global.world_size_x; ix++)
    {
        global.world[ix] = array_create(
            global.world_size_y
        );

        for (var iy = 0; iy < global.world_size_y; iy++)
        {
            global.world[ix][iy] = array_create(
                global.world_size_z,
                0
            );
        }
    }


    // ========================================
	// CRIAR TERRENO COM ALTURA VARIÁVEL
	// ========================================

	for (var ix = 0; ix < global.world_size_x; ix++)
	{
	    for (var iz = 0; iz < global.world_size_z; iz++)
	    {
	        // Altura simples de teste
	        var height = 2;

	        // Criar uma área mais alta no centro
	        if (ix >= 2 && ix <= 5 && iz >= 2 && iz <= 5)
	        {
	            height = 3;
	        }

	        // Preencher do chão até a altura
	        for (var iy = 0; iy <= height; iy++)
	        {
	            // Último bloco = GRAMA
	            if (iy == height)
	            {
	                global.world[ix][iy][iz] = 1;
	            }
	            // Penúltimo = TERRA
	            else if (iy >= height - 1)
	            {
	                global.world[ix][iy][iz] = 2;
	            }
	            // Restante = PEDRA
	            else
	            {
	                global.world[ix][iy][iz] = 3;
	            }
	        }
	    }
	}


    // ========================================
    // TESTE
    // ========================================

    show_debug_message(
        "BLOCO [0,0,0] = "
        + string(global.world[0][0][0])
    );
}