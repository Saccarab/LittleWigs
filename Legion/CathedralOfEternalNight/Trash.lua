
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Cathedral of Eternal Night Trash", 1146)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(
	118704, -- Dul'zak
	119952, -- Felguard Destroyer
	119923, -- Helblaze Soulmender
	118703, -- Felborne Botanist
	118714, -- Hellblaze Temptress
	118713, -- Felstrider Orbcaster
	120713, -- Wa'glur
	118723, -- Gazerax
	121569  -- Vilebark Walker
)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.dulzak = "Dul'zak"
	L.felguard = "Felguard Destroyer"
	L.soulmender = "Helblaze Soulmender"
	L.botanist = "Felborne Botanist"
	L.temptress = "Hellblaze Temptress"
	L.orbcaster = "Felstrider Orbcaster"
	L.waglur = "Wa'glur"
	L.gazerax = "Gazerax"
	L.vilebark = "Vilebark Walker"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- Dul'zak
		238653, -- Shadow Wave
		-- Felguard Destroyer
		241598, -- Shadow Wall
		-- Helblaze Soulmender
		238543, -- Demonic Mending
		-- Felborne Botanist
		237565, -- Blistering Rain
		-- Hellblaze Temptress
		237391, -- Alluring Aroma
		-- Felstrider Orbcaster
		239320, -- Felblaze Orb
		-- Wa'glur
		241772, -- Unearthy Howl
		-- Gazerax
		239232, -- Blinding Glare
		-- Vilebark Walker
		242760, -- Lumbering Crash
	}, {
		[238653] = L.dulzak,
		[241598] = L.felguard,
		[238543] = L.soulmender,
		[237565] = L.botanist,
		[237391] = L.temptress,
		[239320] = L.orbcaster,
		[241772] = L.waglur,
		[239232] = L.gazerax,
		[242760] = L.vilebark
	}
end

function mod:OnBossEnable()
	self:RegisterMessage("BigWigs_OnBossEngage", "Disable")
	self:RegisterEvent("UNIT_SPELLCAST_START", "ShadowWave") -- Shadow Wave
	self:Log("SPELL_CAST_START", "ShadowWall", 241598) -- Shadow Wall
	self:Log("SPELL_CAST_START", "DemonicMending", 238543) -- Demonic Mending
	self:Log("SPELL_CAST_START", "BlisteringRain", 237565) -- Blistering Rain
	self:Log("SPELL_CAST_START", "AlluringAroma", 237391) -- Alluring Aroma
	self:Log("SPELL_CAST_START", "FelblazeOrb", 239320) -- Felblaze Orb
	self:Log("SPELL_CAST_START", "UnearthyHowl", 241772) -- Unearthy Howl
	self:Log("SPELL_CAST_START", "BlindingGlare", 239232) -- Blinding Glare
	self:Log("SPELL_CAST_START", "LumberingCrash", 121569) -- Lumbering Crash
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Dul'zak
do
	local prev = nil
	function mod:ShadowWave(_, _, spellName, _, castGUID, spellId)
		if spellId == 238653 and castGUID ~= prev then -- Shadow Wave
			prev = castGUID
			self:Message(spellId, "Urgent", "Alarm", CL.incoming:format(spellName))
			self:Bar(spellId, 23.2)
		end
	end
end

-- Felguard Destroyer
function mod:ShadowWall(args)
	self:Message(args.spellId, "Attention", "Long", CL.casting:format(args.spellName))
end

-- Helblaze Soulmender
function mod:DemonicMending(args)
	self:Message(args.spellId, "Urgent", "Warning", CL.casting:format(args.spellName))
end

-- Felborne Botanist
function mod:BlisteringRain(args)
	self:Message(args.spellId, "Attention", "Long", CL.casting:format(args.spellName))
end

-- Hellblaze Temptress
function mod:AlluringAroma(args)
	self:Message(args.spellId, "Urgent", "Warning", CL.casting:format(args.spellName))
end

-- Felstrider Orbcaster
function mod:FelblazeOrb(args)
	self:Message(args.spellId, "Urgent", "Warning", CL.casting:format(args.spellName))
end

-- Wa'glur
function mod:UnearthyHowl(args)
	self:Message(args.spellId, "Urgent", "Warning", CL.casting:format(args.spellName))
end

-- Gazerax
function mod:BlindingGlare(args)
	self:Message(args.spellId, "Urgent", "Warning", CL.casting:format(args.spellName))
end

-- Vilebark Walker
function mod:LumberingCrash(args)
	self:Message(args.spellId, "Important", "Alarm", CL.casting:format(args.spellName))
end
