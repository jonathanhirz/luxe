
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;

import phoenix.utils.Maths;

class Main extends luxe.Game {

    var sprite : Sprite;
    var hsv_blue : Sprite;
    var hsl_pink : Sprite;

    var hsb_strip_top : Sprite;
    var hsb_strip_bottom : Sprite;

    var sprite_test_pad : Sprite;
    var mouse : Vector;
    var bar_color : ColorHSV;

    public function ready() {

        sprite = new Sprite({
            pos : new Vector(480,320),
            size : new Vector(128,128),
            color : new Color(),
            depth : 2
        });

        hsv_blue = new Sprite({
            pos : new Vector(100,100),
            size : new Vector(128,128),
            color : new ColorHSV(200, 0.61, 1),
            depth : 0,
            centered : false
        });

        hsl_pink = new Sprite({
            pos : new Vector(356,100),
            size : new Vector(128,128),
            color : new ColorHSL(330, 1, 0.48),
            depth : 0,
            centered : false
        });

        hsb_strip_top = new Sprite({
            pos : new Vector(0,0),
            size : new Vector(Luxe.screen.w,Luxe.screen.h*0.1),
            color : new ColorHSV(0, 0.5, 1),
            depth : 0,
            centered : false
        });        

        hsb_strip_bottom = new Sprite({
            pos : new Vector(0,Luxe.screen.h-(Luxe.screen.h*0.1)),
            size : new Vector(Luxe.screen.w, Luxe.screen.h*0.1),
            color : new ColorHSV(0, 0.5, 1),
            depth : 0,
            centered : false
        });

        sprite_test_pad = new Sprite({
            centered : false,
            pos : new Vector(100,100),
            texture : Luxe.loadTexture('assets/test.png'),
            depth : 1
        });

        mouse = new Vector(480,320);
        bar_color = new ColorHSV(0,0.5,1);

    } //ready
    
    
    public function onmousemove(e) {
        mouse.set(e.x, e.y);
        sprite.pos = mouse;

        bar_color.h = 360 * (mouse.x/Luxe.screen.w);
        bar_color.v = 1.0 - (mouse.y/Luxe.screen.h);

        hsb_strip_top.color = bar_color;        
        hsb_strip_bottom.color = bar_color;

    }

    public function onmousedown(e) {
        
        sprite.color.tween(1.5, { 
            r:Math.random(), 
            g:Math.random(), 
            b:Math.random(), 
            a: Maths.clamp(0.5+(Math.random()),0,1) 
        }); //tween

    }

    public function onkeyup(e) {
        
        if(e.value == Input.Keys.space) {

            // 

            var c : Color = bar_color;

            trace( c.r + ' ' + c.g + ' ' + c.b  );

        }

        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}

