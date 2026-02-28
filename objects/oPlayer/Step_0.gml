var _x_input = keyboard_check(vk_right) - keyboard_check(vk_left);
var _y_input = keyboard_check(vk_down) - keyboard_check(vk_up);

x_speed = _x_input * movement_speed;
y_speed = _y_input * movement_speed;

if (place_meeting(x + x_speed, y, oSolid)) {
    while (!place_meeting(x + sign(x_speed), y, oSolid)) {
        x += sign(x_speed);
    }
    x_speed = 0;
}
x += x_speed;

if (place_meeting(x, y + y_speed, oSolid)) {
    while (!place_meeting(x, y + sign(y_speed), oSolid)) {
        y += sign(y_speed);
    }
    y_speed = 0;
}
y += y_speed;
if (place_meeting(x, y, oGaint)) {
    room_restart();
}
if (place_meeting(x, y, oFlag)) {
    if (has_won == false) {
        has_won = true;
        show_message("CONGRATULATIONS! You escaped the barrier and mastered the underground maze!");
        room_restart(); 
    }
}