// ========================================
// CROSSHAIR
// ========================================

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var cx = gui_w * 0.5;
var cy = gui_h * 0.5;

var crosshair_size = 6;
var crosshair_gap = 3;


// Cor do crosshair
draw_set_colour(c_white);


// ESQUERDA
draw_line(
    cx - crosshair_gap - crosshair_size,
    cy,
    cx - crosshair_gap,
    cy
);


// DIREITA
draw_line(
    cx + crosshair_gap,
    cy,
    cx + crosshair_gap + crosshair_size,
    cy
);


// CIMA
draw_line(
    cx,
    cy - crosshair_gap - crosshair_size,
    cx,
    cy - crosshair_gap
);


// BAIXO
draw_line(
    cx,
    cy + crosshair_gap,
    cx,
    cy + crosshair_gap + crosshair_size
);


// ========================================
// DEBUG DO BLOCO MIRADO
// ========================================

draw_set_colour(c_white);

if (target_block_found)
{
    draw_text(
        20,
        20,
        "Bloco: "
        + string(target_block_x)
        + ", "
        + string(target_block_y)
        + ", "
        + string(target_block_z)
    );
}
else
{
    draw_text(
        20,
        20,
        "Nenhum bloco"
    );
}