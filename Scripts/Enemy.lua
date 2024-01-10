
function scriptLua(entity)

    createEnemyBullet(entity)
end

function createEnemyBullet(entity)

    local transformComponent = getComponentTransform(entity)
    local movableComponent = getComponentMovable(entity)
    local clock = getElapsedTime(entity)

    if clock > 1 then
        restartClock(entity)
        createMobsBullet(entity, transformComponent)
    end
end