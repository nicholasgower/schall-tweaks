local function addPrereq(technology,prerequisite)
    table.insert(data.raw["technology"][technology].prerequisites,prerequisite)
end
if mods["SchallAlienTech"] then
    local function updateTechnology()
        local ecology_techs = 
        {
            "Schall-nauvis-ecology",
            "Schall-gleba-ecology",
        }
        for _,tech in pairs(ecology_techs) do
            data.raw["technology"][tech] = nil
        end


    end

    update_technology()
end

if mods["SchallAmmoTurrets"] then
    local function updateTechnology()
        addPrereq("Schall-rocket-turret","rocket-turret")

        
    end

    update_technology()
end