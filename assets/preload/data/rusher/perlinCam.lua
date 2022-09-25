-----------SETTINGS-----------

local perlinMult = 50 -- recommended value is 16, go lower if you don't want noticeable shit

-- Which direction to allow perlin values to go
local enableX = true
local enableY = true

------------------------------

-- Perlin Camera Implementation by EyeDaleHim
-- Perlin Implementation by Maru

local p = {}
local permutation = {}

function newSeed()
    permutation = {}
    for i = 1, 256 do
        table.insert(permutation, getRandomInt(0,255))
    end
    for i=0,255 do
        p[i] = permutation[i+1]
        p[256+i] = permutation[i+1]
    end
end

function onCreate()
    newSeed()
end

local totalElapsedX = 0
local totalElapsedY = 0

function onUpdatePost(elapsed)
    totalElapsedX = (totalElapsedX + (elapsed * (getRandomInt(1, 255) / 255)))
    totalElapsedY = (totalElapsedY + (elapsed * (getRandomInt(1, 255) / 255)))

    local camTarget = {
        [0] = 'flixel.FlxG',
        [1] = 'camera.targetOffset'
    }

    if enableX then
        setPropertyFromClass(camTarget[0], camTarget[1]..'.x', noise(totalElapsedX, 0, 0) * perlinMult)
    end
    if enableY then
        setPropertyFromClass(camTarget[0], camTarget[1]..'.y', noise(0, totalElapsedY, 0) * perlinMult)
    end
end


function noise(x, y, z)
    X = math.floor(x % 255)
    Y = math.floor(y % 255)
    Z = math.floor(z % 255)

    x = x - math.floor(x)
    y = y - math.floor(y)
    z = z - math.floor(z)

    u = fade(x)
    v = fade(y)
    w = fade(z)

    A   = p[X  ]+Y
    AA  = p[A]+Z
    AB  = p[A+1]+Z
    B   = p[X+1]+Y
    BA  = p[B]+Z
    BB  = p[B+1]+Z

    return lerp(w, lerp(v, lerp(u, grad(p[AA], x, y, z),
    grad(p[BA], x-1, y, z)),lerp(u, grad(p[AB], x, y-1, z),
    grad(p[BB], x-1, y-1, z))),lerp(v, lerp(u, grad(p[AA+1], x, y, z-1 ),
    grad(p[BA+1], x-1, y, z-1)),lerp(u, grad(p[AB+1], x, y-1, z-1 ),grad(p[BB+1], x-1, y-1, z-1 ))))
end


function fade(t)
    return t * t * t * (t * (t * 6 - 15) + 10)
end

function lerp(t,a,b)
    return a + t * (b - a)
end

function grad(hash,x,y,z)
    local h = hash % 16
    local u
    local v

    if (h<8) then u = x else u = y end
    if (h<4) then v = y elseif (h==12 or h==14) then v=x else v=z end
    local r

    if ((h%2) == 0) then r=u else r=-u end
    if ((h%4) == 0) then r=r+v else r=r-v end
    return r
end