//animations
switch (state){
    case PS_IDLE:
    sprite_index = sprite_get("idle");
    image_index = state_timer * 0.12;
    break;
    
    case PS_WALK:
    sprite_index = sprite_get("walk");
    image_index = state_timer * 0.15;
    break;
    
    case PS_WALK_TURN:
    sprite_index = sprite_get("walkturn");
    image_index = state_timer * 0.33;
    break;
    
    case PS_DASH_START:
    sprite_index = sprite_get("dashstart");
    image_index = state_timer * 0.25;
    break;
    
    case PS_DASH:
    sprite_index = sprite_get("dash");
    image_index = state_timer * 0.5;
    break;
    
    case PS_DASH_TURN:
    sprite_index = sprite_get("dashturn");
    image_index = state_timer * 0.25;
    break;
    
    case PS_DASH_STOP:
    sprite_index = sprite_get("dashstop");
    image_index = state_timer * 0.33;
    break;
    
    case PS_CROUCH:
    sprite_index = sprite_get("crouch");
    break;
    
    case PS_IDLE_AIR:
    sprite_index = sprite_get("pratfall"); //to change
    image_index = state_timer * 0.25;
    break;
    
    case PS_JUMPSQUAT:
    sprite_index = sprite_get("jumpstart");
    image_index = state_timer * 0.5;
    break;
    
    case PS_FIRST_JUMP:
    sprite_index = sprite_get("jump");
    var image_indexer = state_timer / 3;
    image_index = (image_indexer < 5? state_timer / 3: 5);
    break;
    
    case PS_DOUBLE_JUMP:
    sprite_index = sprite_get("doublejump");
    image_index = state_timer * 0.5;
    break;
    
    case PS_WALL_JUMP:
    sprite_index = sprite_get("walljump");
    image_index = state_timer / 2;
    break;
    
    case PS_PRATFALL:
    sprite_index = sprite_get("pratfall");
    image_index = state_timer / 2;
    break;
    
    case PS_HITSTUN:
    switch(hurt_img){
        case 0: //hurt
        sprite_index = sprite_get("hurt");
        break;
        case 1: //bighurt
        sprite_index = sprite_get("bighurt");
        break;
        case 2: //hurtground change
        sprite_index = sprite_get("hurtground");
        break;
        case 3: //bouncehurt change
        sprite_index = sprite_get("bouncehurt");
        break;
        case 4: //spinhurt
        sprite_index = sprite_get("spinhurt");
        break;
        case 5: //uphurt
        sprite_index = sprite_get("uphurt");
        break;
        case 6: //downhurt change
        sprite_index = sprite_get("downhurt");
        break;
    }
    break;
    
    case PS_HITSTUN_LAND:
    sprite_index = sprite_get("land");
    image_index = state_timer * 0.5;
    break;
    
    case PS_WAVELAND:
    sprite_index = sprite_get("land");
    image_index = 0;
    break;
    
    case PS_LAND:
    sprite_index = sprite_get("land");
    image_index = state_timer * 0.5;
    break;
    
    case PS_LANDING_LAG:
    sprite_index = sprite_get("landinglag");
    image_index = state_timer / 3;
    break;
    
    case PS_PRATLAND:
    sprite_index = sprite_get("land");
    image_index = 0;
    break;
    
    case PS_SPAWN:
    sprite_index = sprite_get("intro");
    image_index = (state_timer / 130) * 33;
    break;
    
    case PS_RESPAWN:
    sprite_index = sprite_get("idle");
    image_index = state_timer * 0.12;
    break;
    
    case PS_AIR_DODGE:
    sprite_index = sprite_get("airdodge");
    break;
    
    default:
    break;
}

/*


PS_TECH_GROUND
PS_TECH_BACKWARD
PS_TECH_FORWARD
PS_WALL_TECH