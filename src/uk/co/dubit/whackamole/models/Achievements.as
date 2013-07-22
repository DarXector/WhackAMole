package uk.co.dubit.whackamole.models
{
	/**
	 * Achievements logic
	 * Checking conditions for different achievements
	 * 
	 **/
	
	
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import uk.co.dubit.whackamole.models.achievements.ApocalypticaVO;
	import uk.co.dubit.whackamole.models.achievements.ApprenticeVO;
	import uk.co.dubit.whackamole.models.achievements.FiremanVO;
	import uk.co.dubit.whackamole.models.achievements.MasterVO;
	import uk.co.dubit.whackamole.models.achievements.MoleMassacreVO;
	import uk.co.dubit.whackamole.models.achievements.SoftTouchVO;
	import uk.co.dubit.whackamole.models.events.AchievementEvent;

	public class Achievements extends EventDispatcher
	{
		private var _achievements:Dictionary;
		
		private var _killedMoles:int = 0;
		private var _killedFireMoles:int = 0;
		private var _killedZombieMoles:int = 0;
		private var _miss:int = 0;
		
		private const MISS:String = 'miss';
		private const ZOMBIE:String = 'zombie';
		private const FIRE:String = 'fire';
		private const ANY:String = 'any';
		
		public function Achievements(game:MoleGame)
		{
			// putting achievements into Dictionary for easy reference
			_achievements = new Dictionary();
			_achievements['apocalyptica'] = new ApocalypticaVO();
			_achievements['apprentice'] = new ApprenticeVO();
			_achievements['fireman'] = new FiremanVO();
			_achievements['master'] = new MasterVO();
			_achievements['massacre'] = new MoleMassacreVO();
			_achievements['softtouch'] = new SoftTouchVO();
		}
		
		//Check all achievements by type
		private function _checkAchievements(type:String):void
		{
			switch(type)
			{
				case MISS:
					_checkAchievement(_miss, 'softtouch');
					break;
				case ZOMBIE:
					_checkAchievement(_killedZombieMoles, 'apocalyptica');
					_checkAchievement(_killedZombieMoles, 'master');
					break;
				case FIRE: 
					_checkAchievement(_killedFireMoles, 'fireman');
					break;
				case ANY:
					_checkAchievement(_killedMoles, 'apprentice');
					_checkAchievement(_killedMoles, 'massacre');
					break;
				
			}
		}
		
		// Check achievement and if condition met send the Unlocked Achievement Event
		private function _checkAchievement(value:int, achievement:String):void
		{
			if(value >= _achievements[achievement].value && !_achievements[achievement].achieved) // Is the achievement condition met and is the achievement unlocked. If already unlocked, ignore
			{
				_achievements[achievement].achieved = true;
				dispatchEvent(new AchievementEvent(AchievementEvent.ACHIEVEMENT_UNLOCKED, _achievements[achievement]));
			}
		}
		
		public function get achievements():Dictionary
		{
			return _achievements;
		}
		
		// All the misses
		public function get miss():int
		{
			return _miss;
		}
		
		public function set miss(value:int):void
		{
			_miss = value;
			_checkAchievements(MISS);
		}
		
		// All the killed Zombie moles
		public function get killedZombieMoles():int
		{
			return _killedZombieMoles;
		}
		
		public function set killedZombieMoles(value:int):void
		{
			_killedZombieMoles = value;
			_checkAchievements(ZOMBIE);
		}
		
		// All the killed Fire moles
		public function get killedFireMoles():int
		{
			return _killedFireMoles;
		}
		
		public function set killedFireMoles(value:int):void
		{
			_killedFireMoles = value;
			_checkAchievements(FIRE);
		}
		
		// All the killed moles
		public function get killedMoles():int
		{
			return _killedMoles;
		}
		
		public function set killedMoles(value:int):void
		{
			_killedMoles = value;
			_checkAchievements(ANY);
		}

	}
}