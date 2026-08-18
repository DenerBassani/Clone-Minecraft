function world_get(_x, _y, _z)
{
    if (_x < 0 || _x >= global.world_size_x)
        return 0;

    if (_y < 0 || _y >= global.world_size_y)
        return 0;

    if (_z < 0 || _z >= global.world_size_z)
        return 0;

    return global.world[_x][_y][_z];
}