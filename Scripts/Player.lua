
function scriptLua(entity)

    --print("scriptLua called")
    movementManager(entity)
    boss(entity)
end


function boss(entity)
    local clock2 = getElapsedTime2(entity)

    if clock2 > 15 then
        bossSpawn(entity)
    end
end


function movementManager(entity)
    local transformComponent = getComponentTransform(entity)
    local movableComponent = getComponentMovable(entity)
    local fireRate = getFireRate(entity)
    local controlComponent = getComponentControl(entity)
    local clock = getElapsedTime(entity)

    local MOVE_LEFT = 10
    local MOVE_RIGHT = 11
    local MOVE_UP = 12
    local MOVE_DOWN = 13
    local SHOOT = 14
    local NONE = 0
    local PRESSED = 1
    local RELEASED = 2

    if getInput(entity, 0) then
        movableComponent.velocity.x = 1.0
    end

    if transformComponent ~= nil and movableComponent ~= nil and controlComponent ~= nil then
        if getInput(entity, 16) then
            playSound()
        end

        if getInput(entity, 71) and controlComponent.left then
            movableComponent.velocity.x = -1.0
            addEvent(MOVE_LEFT, PRESSED);
        elseif getInput(entity, 72) and controlComponent.right then
            movableComponent.velocity.x = 1.0
            addEvent(MOVE_RIGHT, PRESSED);
        else
            movableComponent.velocity.x = 0.0
            addEvent(MOVE_LEFT, RELEASED);
            addEvent(MOVE_RIGHT, RELEASED);
        end

        if getInput(entity, 73) and controlComponent.up then
            movableComponent.velocity.y = -1.0
            addEvent(MOVE_UP, PRESSED);
        elseif getInput(entity, 74) and controlComponent.down then
            movableComponent.velocity.y = 1.0
            addEvent(MOVE_DOWN, PRESSED);
        else
            movableComponent.velocity.y = 0.0
            addEvent(MOVE_UP, RELEASED);
            addEvent(MOVE_DOWN, RELEASED);
        end

        if getInput(entity, 57) and controlComponent.shoot then
            if clock > fireRate then
                restartClock(entity)
                createBullet(entity, transformComponent)
                addEvent(SHOOT, PRESSED);
            end
        else
            if getEventState(SHOOT, PRESSED) then
                addEvent(SHOOT, RELEASED);
            else
                addEvent(SHOOT, NONE);
            end
        end
    end
end
