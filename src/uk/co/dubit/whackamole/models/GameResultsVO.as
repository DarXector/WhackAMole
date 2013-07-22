package uk.co.dubit.whackamole.models
{
	import mx.collections.ArrayCollection;
	
	
	/**
	 * Value Object containing Results at the end of the game (score, achievements)
	 * 
	 */
	
	public class GameResultsVO
	{
		private var _score:int = 0;
		private var _unlockedAchievements:ArrayCollection = new ArrayCollection();
		
		public function get unlockedAchievements():ArrayCollection
		{
			return _unlockedAchievements;
		}

		public function set unlockedAchievements(value:ArrayCollection):void
		{
			_unlockedAchievements = value;
		}

		public function get score():int
		{
			return _score;
		}

		public function set score(value:int):void
		{
			_score = value;
		}

	}
}