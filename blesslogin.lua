local bless = {0, 1, 2, 3, 4}
local cost = 0

function onLogin(cid, words, param)
    for i = 1, table.maxn(bless) do
        if(getPlayerBlessing(cid, bless[i])) then
            doPlayerSendCancel(cid, "You have already all blessings.")
            return TRUE
        end
    end
   
    if(doPlayerRemoveMoney(cid, cost) == TRUE) then
        for i = 1, table.maxn(bless) do
            doPlayerAddBlessing(cid, bless[i])
        end
        doCreatureSay(cid, "You are now blessed!" ,19)
        doSendMagicEffect(getPlayerPosition(cid), 49)
    else
        doPlayerSendCancel(cid, "You don't have enough money.")
    end
    return TRUE
end