local blessingStorageValue = 30129 -- The storage value you will use to store a players blessings
local blessConfig = {
    [0] = { -- Experience Loss
        lossPercent = 10, -- % of experience a player will lose when dying WITHOUT blessings
        blessPercent = 0 -- % of experience a player will lose when dying WITH blessings
    },
    [1] = { -- Magic Level Loss
        lossPercent = 10, -- % of magic level a player will lose when dying WITHOUT blessings
        blessPercent = 0-- % of magic level a player will lose when dying WITH blessings
    },
    [2] = { -- Skill Loss
        lossPercent = 10, -- % of skills a player will lose when dying WITHOUT blessings
        blessPercent = 0 -- % of skills a player will lose when dying WITH blessings
    },
    [3] = { -- Container Loss
        lossPercent = 10, -- % chance to lose backpack WITHOUT blessings
        blessPercent = 0 -- % chance to lose backpack WITH blessings
    },
    [4] = { -- Equipment Loss
        lossPercent = 10, -- % chance to lose each individual item equipped on a player WITHOUT blessings
        blessPercent = 0 -- % chance to lose each individual item equipped on a player WITH blessings
    }
}
function onPrepareDeath(cid, deathList)
if getCreatureStorage(cid,blessingStorageValue) > 0 then
 doCreatureSetStorage(cid, blessingStorageValue, 0)
    for i = 0, 4 do
        doPlayerSetLossPercent(cid, i, ((getCreatureStorage(cid, blessingStorageValue) > 0 and blessConfig[i].blessPercent*0) or blessConfig[i].lossPercent*0))
    end
	end
    return true
end