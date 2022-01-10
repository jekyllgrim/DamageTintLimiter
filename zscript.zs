version "4.4.0"

class JGP_TintHandler : EventHandler 
{
	transient CVar maxIntensity;
	transient CVar limiterEnabled;
	
	override void WorldTick()
	{
		PlayerInfo plr = players[consoleplayer];
		if (!plr || !plr.mo)
			return;
	
		if (!limiterEnabled)
			limiterEnabled = CVar.GetCvar('cl_damageTintLimit', plr);
		if (limiterEnabled.GetBool() == false)
			return;		
		if (!maxIntensity)
			maxIntensity = CVar.GetCvar('cl_damageTintIntensity', plr);
		
		plr.damagecount = Clamp(plr.damagecount, 0, maxIntensity.GetFloat());
	}
}
