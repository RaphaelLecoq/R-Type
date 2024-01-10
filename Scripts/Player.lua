
function scriptLua(entity)

    --print("scriptLua called")
    movementManager(entity)
end


function movementManager(entity)
    local transformComponent = getComponentTransform(entity)
    local movableComponent = getComponentMovable(entity)
    local controlComponent = getComponentControl(entity)
    local clock = getElapsedTime(entity)

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
            if clock > 0.2 then
                restartClock(entity)
                createBullet(entity, transformComponent)
            end
        else
            spaceKeyPressed = false
        end
    end
end

