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
// HOTBAR
// ========================================

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var slot_size = 44;
var slot_gap = 4;
var slot_count = 9;

var total_width =
    (slot_size * slot_count)
    + (slot_gap * (slot_count - 1));

var hotbar_x = (gui_w - total_width) * 0.5;
var hotbar_y = gui_h - slot_size - 20;


// ========================================
// DESENHAR SLOTS
// ========================================

for (var i = 0; i < slot_count; i++)
{
    var sx =
        hotbar_x
        + i * (slot_size + slot_gap);

    var sy = hotbar_y;


    // Fundo
    draw_set_alpha(0.65);
    draw_set_colour(c_black);

    draw_rectangle(
        sx,
        sy,
        sx + slot_size,
        sy + slot_size,
        false
    );


    // Borda
    draw_set_alpha(1);

    if (i == selected_slot)
    {
        draw_set_colour(c_white);
    }
    else
    {
        draw_set_colour(c_gray);
    }

    draw_rectangle(
        sx,
        sy,
        sx + slot_size,
        sy + slot_size,
        true
    );


    // Número do slot
    draw_set_colour(c_white);

    draw_text(
        sx + 4,
        sy + 3,
        string(i + 1)
    );
}


// ========================================
// NOMES DOS 3 PRIMEIROS BLOCOS
// ========================================

draw_set_colour(c_white);

draw_text(
    hotbar_x + 5,
    hotbar_y + 22,
    "G"
);

draw_text(
    hotbar_x + slot_size + slot_gap + 5,
    hotbar_y + 22,
    "T"
);

draw_text(
    hotbar_x + (slot_size + slot_gap) * 2 + 5,
    hotbar_y + 22,
    "P"
);


// ========================================
// RESET DE DRAW
// ========================================

draw_set_alpha(1);
draw_set_colour(c_white);


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

// ========================================
// NOME DO BLOCO SELECIONADO
// ========================================

var selected_name = "";

if (selected_block == 1)
{
    selected_name = "Grama";
}
else if (selected_block == 2)
{
    selected_name = "Terra";
}
else if (selected_block == 3)
{
    selected_name = "Pedra";
}

draw_set_colour(c_white);

draw_text(
    gui_w * 0.5 - 40,
    hotbar_y - 22,
    selected_name
);