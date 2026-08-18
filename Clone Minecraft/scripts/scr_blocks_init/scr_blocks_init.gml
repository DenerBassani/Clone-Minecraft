function blocks_init()
{
    global.blocks = [];

    global.blocks[0] = block_create(
        0,
        "air",
        false
    );

    global.blocks[1] = block_create(
        1,
        "grass",
        true
    );

    global.blocks[2] = block_create(
        2,
        "dirt",
        true
    );

    global.blocks[3] = block_create(
        3,
        "stone",
        true
    );
}