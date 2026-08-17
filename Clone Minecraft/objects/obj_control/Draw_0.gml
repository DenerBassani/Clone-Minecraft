var aspect = camera_get_view_width(view_camera[0])
           / camera_get_view_height(view_camera[0]);

var projection = matrix_build_projection_perspective_fov(
    60,
    aspect,
    0.1,
    100
);

var yaw = degtorad(cam_yaw);
var pitch = degtorad(cam_pitch);

var look_x = cam_x + sin(yaw) * cos(pitch);
var look_y = cam_y + sin(pitch);
var look_z = cam_z + cos(yaw) * cos(pitch);

var view = matrix_build_lookat(
    cam_x,
    cam_y,
    cam_z,
    look_x,
    look_y,
    look_z,
    0,
    1,
    0
);

var world = matrix_build_identity();

matrix_set(matrix_projection, projection);
matrix_set(matrix_view, view);
matrix_set(matrix_world, world);

vertex_submit(
    block,
    pr_trianglelist,
    -1
);