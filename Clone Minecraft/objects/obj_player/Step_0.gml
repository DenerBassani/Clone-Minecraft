// ========================================
// MOVIMENTO
// ========================================

if (keyboard_check(ord("W")))
{
    player_z += move_speed;
}

if (keyboard_check(ord("S")))
{
    player_z -= move_speed;
}

if (keyboard_check(ord("A")))
{
    player_x -= move_speed;
}

if (keyboard_check(ord("D")))
{
    player_x += move_speed;
}