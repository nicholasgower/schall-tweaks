local rro = require("lib.remove-replace-object")
local function addPrereq(technology,prerequisite)
    table.insert(data.raw["technology"][technology].prerequisites,prerequisite)
end

local function get_technology(name) 
    return data.raw["technology"][name]
end

if mods["SchallAlienTech"] then
    local function update_technology()
        local ecology_techs = 
        {
            "Schall-nauvis-ecology",
            "Schall-gleba-ecology",
        }
        for _,tech in pairs(ecology_techs) do
            data.raw["technology"][tech] = nil
        end
        rro.soft_insert(data.raw["technology"]["Schall-uranium-wall"].unit.ingredients,{"utility-science-pack",1})
        data.raw["technology"]["Schall-alien-biochemistry-1"].unit.ingredients = {
            {"automation-science-pack",1},
            {"logistic-science-pack",1},
            {"alien-science-pack",1}
        }
        
        if mods["space-age"] then
            local electromagnetic_techs = {
                "Schall-energy-shield-equipment-3"
            }
            for _,tech in pairs(electromagnetic_techs) do 
                rro.soft_insert(data.raw["technology"][tech].unit.ingredients,{"space-science-pack",1})
                rro.soft_insert(data.raw["technology"][tech].unit.ingredients,{"electromagnetic-science-pack",1})
            end
            --addPrereq("Schall-energy-shield-equipment-3","")
        end
    end

    update_technology()
end

if mods["SchallAmmoTurrets"] then
    local function update_technology()
        if mods["space-age"] then
            addPrereq("Schall-rocket-turret","rocket-turret")
        end
       

        
    end

    update_technology()
end