# Projet R-Type Wiki

## Description
- Gameplay part for the R-Type Epitech project.

## Json Configuration (JSON)
- **Configuration file e**

```json
{
    "icon": "../R-Type/assets/iconEngine.png",
    "scenes": [
        { "Game": {
            "textures": [
                { "player": "../R-Type/assets/player.gif" },
                { "enemy": "../R-Type/assets/enemy.gif" },
                { "bullet": "../R-Type/assets/bullet.png" },
                { "background": "../R-Type/assets/gameBackground.png" }
            ],
            "fonts": [
                { "default": "../R-Type/assets/OpenSans-Bold.ttf" }
            ],
            "sounds": [
                { "default": "../R-Type/assets/sound.ogg" }
            ],
            "music": [
                { "default": "../R-Type/assets/music.ogg" }
            ],
            "systems": [
                "position",
                "control",
                "render",
                "handleCollision",
                "update_animation",
                "render_text",
                "rigid_body"
            ],
            "entities": [
                { "background": {
                    "TextureInfo": "background",
                    "FontInfo": "default",
                    "Renderable": 0,
                    "Transform": {
                        "position": {
                            "x": 0,
                            "y": 0
                        },
                        "rotation": 0,
                        "scale": {
                            "x": 1,
                            "y": 1
                        }
                    }
                }},
                { "player": {
                    "TextureInfo": "player",
                    "FontInfo": "default",
                    "Script": "/home/laplace/B-CPP-500-REN-5-2-rtype-mathys.thevenot/NewProject/Scripts/Player.lua",
                    "Renderable": 0,
                    "Tag": "Player",
                    "Control": {
                        "up": true,
                        "down": true,
                        "left": true,
                        "right": true,
                        "shoot": false
                    },
                    "SpriteAnimation" : {
                        "currentFrame": 0,
                        "frameDuration": 0.1,
                        "frameCount": 5,
                        "frameTimer": 0
                    },
                    "Transform": {
                        "position": {
                            "x": 0,
                            "y": 0
                        },
                        "rotation": 0,
                        "scale": {
                            "x": 1,
                            "y": 1
                        }
                    },
                    "Movable": {
                        "velocity": {
                            "x": 0,
                            "y": 0
                        },
                        "acceleration": {
                            "x": 0,
                            "y": 0
                        }
                    }
                }},
                { "enemy": {
                    "TextureInfo": "enemy",
                    "FontInfo": "default",
                    "Script": "/home/laplace/B-CPP-500-REN-5-2-rtype-mathys.thevenot/NewProject/Scripts/Enemy.lua",
                    "Renderable": 0,
                    "Tag": "Enemy",
                    "Transform": {
                        "position": {
                            "x": 500,
                            "y": 150
                        },
                        "rotation": 0,
                        "scale": {
                            "x": 1,
                            "y": 1
                        }
                    },
                    "SpriteAnimation" : {
                        "currentFrame": 0,
                        "frameDuration": 0.1,
                        "frameCount": 8,
                        "frameTimer": 0
                    },
                    "Movable": {
                        "velocity": {
                            "x": 0,
                            "y": 0
                        },
                        "acceleration": {
                            "x": 0,
                            "y": 0
                        }
                    }
                }}
            ]
        }}
    ]
}
```
- icon: Path for icon game.
- scenes: List of the scene of the game.
    - Game: Main scene of the game.
        - textures: List of texture used link with a type.
        - fonts: List of font used.
        - sounds: List of sounds used.
        - music: List of music used.
        - systems: List of system used to handle the game.
        - entities: List of entities in the game, each one is define by a Json.
          Each entity has a type (for exemple, "player", "enemy") and some specific proprieties.
