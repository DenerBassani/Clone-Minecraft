// ========================================
// CÂMERA FPS
// ========================================

var player = global.local_player;

if (instance_exists(player))
{
    // Direção horizontal
    var direction_x =
        dcos(player.yaw);

    var direction_z =
        dsin(player.yaw);


    // Direção vertical
    var direction_y =
        dsin(player.pitch);


    // Ponto para onde a câmera olha
    var target_x =
        player.player_x + direction_x;

    var target_y =
        player.player_y + direction_y;

    var target_z =
        player.player_z + direction_z;


    // Criar matriz da câmera
    var view_matrix = matrix_build_lookat(
        player.player_x,
        player.player_y,
        player.player_z,

        target_x,
        target_y,
        target_z,

        0,
        1,
        0
    );


    // Aplicar
    camera_set_view_mat(
        global.camera,
        view_matrix
    );
}