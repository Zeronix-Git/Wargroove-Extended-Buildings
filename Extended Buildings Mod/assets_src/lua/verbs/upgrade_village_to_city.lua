local Wargroove = require "wargroove/wargroove"
local Verb = require "wargroove/verb"

local UpgradeVillageToCity = Verb:new()
local upgradeCost = 300

function UpgradeVillageToCity:canExecuteAnywhere(unit)
    return (unit.health == 100) and (Wargroove.getMoney(unit.playerId) >= upgradeCost)
end

function UpgradeVillageToCity:getCostAt(unit, endPos, targetPos)
    return upgradeCost
end

function UpgradeVillageToCity:execute(unit, targetPos, strParam, path)
    Wargroove.changeMoney(unit.playerId, -upgradeCost)
    local playerId = unit.playerId
    local unitType = "citadel"
    local turnSpent = true
    local startAnimation = nil
    Wargroove.removeUnit(unit.unitId)
    Wargroove.spawnUnit(unit.playerId, targetPos, unitType, turnSpent, startAnimation)
end

return UpgradeVillageToCity
