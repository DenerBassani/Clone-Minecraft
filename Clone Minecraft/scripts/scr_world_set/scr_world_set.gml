function world_set(_x, _y, _z, _block_id)
{
    // ========================================
    // VERIFICAR LIMITES DO MUNDO
    // ========================================

    if (_x < 0 || _x >= global.world_size_x)
    {
        return false;
    }

    if (_y < 0 || _y >= global.world_size_y)
    {
        return false;
    }

    if (_z < 0 || _z >= global.world_size_z)
    {
        return false;
    }


    // ========================================
    // ALTERAR BLOCO
    // ========================================

    global.world[_x][_y][_z] = _block_id;

    return true;
}