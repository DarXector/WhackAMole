package uk.co.dubit.whackamole.models.events
{
	/**
	 * Achievement Event dispatched on every unlocked achievement
	 * The Event contains the unlocked Achievement Value Object
	 * 
	 **/
	
	import flash.events.Event;
	
	import uk.co.dubit.whackamole.models.achievements.AchievementVO;
	
	public class AchievementEvent extends Event
	{
		public static const ACHIEVEMENT_UNLOCKED:String = "achievementUnlocked";
		
		private var _achievement:AchievementVO;
		
		public function AchievementEvent(type:String, achievement:AchievementVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_achievement = achievement;
			super(type, bubbles, cancelable);
		}
		
		public function get achievement():AchievementVO
		{
			return _achievement;
		}
	}
}