// ========================================
// MOUSE FPS
// ========================================

var mouse_x_now = window_mouse_get_x();
var mouse_y_now = window_mouse_get_y();

var mouse_dx = mouse_x_now - mouse_center_x;
var mouse_dy = mouse_y_now - mouse_center_y;

yaw += mouse_dx * mouse_sensitivity;
pitch -= mouse_dy * mouse_sensitivity;

pitch = clamp(pitch, -89, 89);

window_mouse_set(
    mouse_center_x,
    mouse_center_y
);


// ========================================
// DIREÇÕES DA CÂMERA
// ========================================

var forward_x = dcos(yaw);
var forward_z = dsin(yaw);

var right_x = -dsin(yaw);
var right_z = dcos(yaw);


// ========================================
// MOVIMENTO WASD
// ========================================

var move_x = 0;
var move_z = 0;

if (keyboard_check(ord("W")))
{
    move_x += forward_x * move_speed;
    move_z += forward_z * move_speed;
}

if (keyboard_check(ord("S")))
{
    move_x -= forward_x * move_speed;
    move_z -= forward_z * move_speed;
}

if (keyboard_check(ord("A")))
{
    move_x -= right_x * move_speed;
    move_z -= right_z * move_speed;
}

if (keyboard_check(ord("D")))
{
    move_x += right_x * move_speed;
    move_z += right_z * move_speed;
}


// ========================================
// EVITAR MOVIMENTO DIAGONAL MAIS RÁPIDO
// ========================================

var move_length = sqrt(move_x * move_x + move_z * move_z);

if (move_length > move_speed)
{
    move_x = (move_x / move_length) * move_speed;
    move_z = (move_z / move_length) * move_speed;
}


// ========================================
// DADOS DA HITBOX
// ========================================

var epsilon = 0.001;

var feet_y = player_y - player_height;

var min_y = floor(feet_y + epsilon);
var max_y = floor(player_y - epsilon);


// #########################################################################
// COLISÃO X
// #########################################################################

if (move_x != 0)
{
    var next_x = player_x + move_x;

    var min_z = floor(player_z - player_radius + epsilon);
    var max_z = floor(player_z + player_radius - epsilon);

    var hit_x = false;


    // ========================================
    // MOVENDO PARA +X
    // ========================================

    if (move_x > 0)
    {
        var block_x = floor(
            next_x + player_radius
        );

        for (var iy = min_y; iy <= max_y; iy++)
        {
            for (var iz = min_z; iz <= max_z; iz++)
            {
                if (world_get(block_x, iy, iz) != 0)
                {
                    // Colocar exatamente antes da parede
                    player_x =
                        block_x
                        - player_radius
                        - epsilon;

                    hit_x = true;

                    break;
                }
            }

            if (hit_x)
            {
                break;
            }
        }
    }


    // ========================================
    // MOVENDO PARA -X
    // ========================================

    else
    {
        var block_x = floor(
            next_x - player_radius
        );

        for (var iy = min_y; iy <= max_y; iy++)
        {
            for (var iz = min_z; iz <= max_z; iz++)
            {
                if (world_get(block_x, iy, iz) != 0)
                {
                    // Colocar exatamente depois da parede
                    player_x =
                        block_x
                        + 1
                        + player_radius
                        + epsilon;

                    hit_x = true;

                    break;
                }
            }

            if (hit_x)
            {
                break;
            }
        }
    }


    // ========================================
    // NÃO COLIDIU
    // ========================================

    if (!hit_x)
    {
        player_x = next_x;
    }
}


// #########################################################################
// COLISÃO Z
// #########################################################################

if (move_z != 0)
{
    var next_z = player_z + move_z;

    // IMPORTANTE:
    // X já pode ter sido corrigido acima.

    var min_x = floor(player_x - player_radius + epsilon);
    var max_x = floor(player_x + player_radius - epsilon);

    var hit_z = false;


    // ========================================
    // MOVENDO PARA +Z
    // ========================================

    if (move_z > 0)
    {
        var block_z = floor(
            next_z + player_radius
        );

        for (var iy = min_y; iy <= max_y; iy++)
        {
            for (var ix = min_x; ix <= max_x; ix++)
            {
                if (world_get(ix, iy, block_z) != 0)
                {
                    player_z =
                        block_z
                        - player_radius
                        - epsilon;

                    hit_z = true;

                    break;
                }
            }

            if (hit_z)
            {
                break;
            }
        }
    }


    // ========================================
    // MOVENDO PARA -Z
    // ========================================

    else
    {
        var block_z = floor(
            next_z - player_radius
        );

        for (var iy = min_y; iy <= max_y; iy++)
        {
            for (var ix = min_x; ix <= max_x; ix++)
            {
                if (world_get(ix, iy, block_z) != 0)
                {
                    player_z =
                        block_z
                        + 1
                        + player_radius
                        + epsilon;

                    hit_z = true;

                    break;
                }
            }

            if (hit_z)
            {
                break;
            }
        }
    }


    // ========================================
    // NÃO COLIDIU
    // ========================================

    if (!hit_z)
    {
        player_z = next_z;
    }
}


// #########################################################################
// GRAVIDADE
// #########################################################################

vertical_velocity -= gravity;

var old_player_y = player_y;
var old_feet_y = old_player_y - player_height;

var next_player_y = player_y + vertical_velocity;
var next_feet_y = next_player_y - player_height;

grounded = false;


// ========================================
// ÁREA HORIZONTAL DO PLAYER
// ========================================

var min_x = floor(player_x - player_radius + epsilon);
var max_x = floor(player_x + player_radius - epsilon);

var min_z = floor(player_z - player_radius + epsilon);
var max_z = floor(player_z + player_radius - epsilon);


// #########################################################################
// CAINDO
// #########################################################################

if (vertical_velocity <= 0)
{
    var landed = false;

    // Começar pela parte mais alta que os pés podem atravessar
    var start_y = floor(old_feet_y);
    var end_y = floor(next_feet_y);

    for (var iy = start_y; iy >= end_y; iy--)
    {
        var block_top = iy + 1;

        // Os pés realmente cruzaram o topo?
        if (old_feet_y >= block_top &&
            next_feet_y <= block_top)
        {
            var floor_found = false;

            // Verificar a ÁREA INTEIRA embaixo do player
            for (var ix = min_x; ix <= max_x; ix++)
            {
                for (var iz = min_z; iz <= max_z; iz++)
                {
                    if (world_get(ix, iy, iz) != 0)
                    {
                        floor_found = true;
                        break;
                    }
                }

                if (floor_found)
                {
                    break;
                }
            }


            if (floor_found)
            {
                player_y =
                    block_top
                    + player_height;

                vertical_velocity = 0;
                grounded = true;

                landed = true;

                break;
            }
        }
    }


    if (!landed)
    {
        player_y = next_player_y;
    }
}


// #########################################################################
// SUBINDO
// #########################################################################

else
{
    var hit_ceiling = false;

    var old_head_y = old_player_y;
    var next_head_y = next_player_y;

    var start_y = floor(old_head_y);
    var end_y = floor(next_head_y);


    // Verificar se bateu a cabeça
    for (var iy = start_y; iy <= end_y; iy++)
    {
        var block_bottom = iy;

        if (old_head_y <= block_bottom &&
            next_head_y >= block_bottom)
        {
            var ceiling_found = false;

            for (var ix = min_x; ix <= max_x; ix++)
            {
                for (var iz = min_z; iz <= max_z; iz++)
                {
                    if (world_get(ix, iy, iz) != 0)
                    {
                        ceiling_found = true;
                        break;
                    }
                }

                if (ceiling_found)
                {
                    break;
                }
            }


            if (ceiling_found)
            {
                player_y = block_bottom - epsilon;

                vertical_velocity = 0;

                hit_ceiling = true;

                break;
            }
        }
    }


    if (!hit_ceiling)
    {
        player_y = next_player_y;
    }
}


// #########################################################################
// PULO
// #########################################################################

if (keyboard_check_pressed(vk_space))
{
    if (grounded)
    {
        vertical_velocity = jump_force;

        grounded = false;
    }
}