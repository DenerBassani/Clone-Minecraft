// ========================================
// CÂMERA DO PLAYER LOCAL
// ========================================

var player = global.local_player;

if (instance_exists(player))
{
    var view_matrix = matrix_build_lookat(
        player.player_x,
        player.player_y,
        player.player_z,

        player.player_x,
        player.player_y,
        player.player_z + 1,

        0,
        1,
        0
    );

    camera_set_view_mat(
        global.camera,
        view_matrix
    );
}