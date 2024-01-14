
function scriptLua(entity)

    --print("scriptLua called")
    movementManager(entity)
end


function movementManager(entity)
    local transformComponent = getComponentTransform(entity)
    local movableComponent = getComponentMovable(entity)
    local fireRate = getFireRate(entity)
    local controlComponent = getComponentControl(entity)
    local clock = getElapsedTime(entity)

    local SHOOT = 14
    local PRESSED = 1
    local RELEASED = 2

    if getInput(entity, 0) then
        movableComponent.velocity.x = 1.0
    end
    --print("movementManager called")

    if transformComponent ~= nil and movableComponent ~= nil and controlComponent ~= nil then
        if getInput(entity, 16) then
            playSound()
        end

        if getInput(entity, 71) and controlComponent.left then
            movableComponent.velocity.x = -1.0
        elseif getInput(entity, 72) and controlComponent.right then
            movableComponent.velocity.x = 1.0
        else
            movableComponent.velocity.x = 0.0
        end

        if getInput(entity, 73) and controlComponent.up then
            movableComponent.velocity.y = -1.0
        elseif getInput(entity, 74) and controlComponent.down then
            movableComponent.velocity.y = 1.0
        else
            movableComponent.velocity.y = 0.0
        end

        if getInput(entity, 57) then
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
