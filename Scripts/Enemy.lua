
function scriptLua(entity)

    createEnemyBullet(entity)
end

function createEnemyBullet(entity)

    local transformComponent = getComponentTransform(entity)
    local movableComponent = getComponentMovable(entity)
    local colliderComponent = getComponentCollider(entity)
    local clock = getElapsedTime(entity)

    if clock > 2 then
        restartClock(entity)
        createMobsBullet(entity, transformComponent, colliderComponent)
    end
end