SUPData = {};

function supinfo(name, author, version)
    print("Mod Cargado: " .. name .. " por " .. author .. " (v" .. version .. ")");
end
function suplink(link)
	print("Updates de mods?... Visita mi blog: " .. link );
end

Events.OnGameBoot.Add(supinfo("Snake Utils Pack", "Snake", "1.35"));
Events.OnGameBoot.Add(suplink("http://pzmodding.blogspot.com/"));