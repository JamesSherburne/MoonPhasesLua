require "CiderDebugger";
local centerX = display.contentCenterX
local centerY = display.contentCenterY

local textGroup = display.newGroup()
local moonGroup = display.newGroup()
moonGroup.x = centerX
moonGroup.y = centerY

local moonTable = {}

moonTable[1] = display.newImageRect( moonGroup, "images/newmoon.png",100,100)
moonTable[1].isVisible = false
moonTable[2] = display.newImageRect( moonGroup, "images/waxingcres.png",100,100)
moonTable[2].isVisible = false
moonTable[3] = display.newImageRect( moonGroup, "images/firstmoon.png",100,100)
moonTable[3].isVisible = false
moonTable[4] = display.newImageRect( moonGroup, "images/waxinggib.png",100,100)
moonTable[4].isVisible = false
moonTable[5] = display.newImageRect( moonGroup, "images/fullmoon.png",100,100)
moonTable[5].isVisible = false
moonTable[6] = display.newImageRect( moonGroup, "images/waninggib.png",100,100)
moonTable[6].isVisible = false
moonTable[7] = display.newImageRect( moonGroup, "images/lastquarter.png",100,100)
moonTable[7].isVisible = false
moonTable[8] = display.newImageRect( moonGroup, "images/waningcres.png",100,100)
moonTable[8].isVisible = false


local moonText = display.newText(textGroup,"Moon phase.",centerX, centerY-200, nil, 20)
moonText:setFillColor(1,0,0)


local function julianDate(d, m, y) 
local mm, yy, k1, k2, k3, j        
        yy = y - math.floor((12 - m) / 10)
        mm = m + 9
        if (mm >= 12) then
            mm = mm - 12
        end
        k1 = math.floor(365.25 * (yy + 4712))
        k2 = math.floor(30.6001 * mm + 0.5)
        k3 = math.floor(math.floor((yy / 100) + 49) * 0.75) - 38
        j = k1 + k2 + d + 59
        if (j > 2299160) then
            j = j - k3  
        end
        return j
    end 
    
    local function  moonAge(d, m, y)
        local j, ip, ag
        j = julianDate(d, m, y)
        ip = (j + 4.867) / 29.53059
        ip = ip - math.floor(ip)
        if (ip < 0.5) then
            ag = ip * 29.53059 + 29.53059 / 2
        else
            ag = ip * 29.53059 - 29.53059 / 2
        end
        print(ag)
        return ag
    end

local day = os.date("%d")
local month = os.date("%m")
local year = os.date("%Y")

local theMoon = moonAge(day,month,year)



print(theMoon)
if  theMoon >=  29  then 
    moonText.text = "New Moon"
    moonTable[1].isVisible = true
    elseif theMoon < 29 and theMoon > 23 then 
    moonTable[8].isVisible = true
    moonText.text = "Waning Crescent"
    elseif theMoon < 23 and theMoon > 22 then
    moonTable[7].isVisible = true
    moonText.text = "Last Quarter"
    elseif theMoon < 22 and theMoon > 15 then 
    moonTable[6].isVisible = true
    moonText.text = "Waning gibbous"
    elseif theMoon < 15 and theMoon > 13 then 
    moonTable[5].isVisible = true
    moonText.text = "Full Moon"
    elseif theMoon < 13 and theMoon > 8 then 
    moonTable[4].isVisible = true
    moonText.text = "Waxing gibbous"
    elseif theMoon < 8 and theMoon > 6 then 
    moonTable[3].isVisible = true
    moonText.text = "First Moon"
    elseif theMoon < 6 and theMoon > 1 then 
    moonTable[2].isVisible = true
    moonText.text = "Waxing crescent"
    else                     
    moonText.text = "New Moon"
end 


