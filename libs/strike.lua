--basic collision by florencio 2022

--function isHit(x, y, width, height, targetx, targety, targetwidth, targetheight)
function isHit(x, y, width, height, targetx, targety, targetwidth, targetheight)
    
    if 
    x < targetx+targetwidth and 
    y < targety+targetheight and
    x+width > targetx and
    y+height > targety
    then
        return true
    else
        return false
    end

end