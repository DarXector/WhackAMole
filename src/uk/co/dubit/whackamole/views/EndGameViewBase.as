package uk.co.dubit.whackamole.views
{
	/**
	 * Game Over View with score display, unlocked achievements, 
	 * and Play Again section with difficulty selection
	 * 
	 **/
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.Group;
	import spark.components.Label;
	
	import uk.co.dubit.whackamole.models.GameLevels;
	import uk.co.dubit.whackamole.models.GameResultsVO;
	import uk.co.dubit.whackamole.views.events.GameViewsEvent;

	
	[Event(name="GameStart", type="uk.co.dubit.whackamole.views.events.GameViewsEvent")]
	public class EndGameViewBase extends Group
	{
		public var playerScore:Label;
		private var _level:int;
		private var _score:String;
		private var _gameResults:GameResultsVO;
		
		private var _unlockedAchievements:ArrayCollection;
		
		
		//Unlocked achievements for End Game Screen display

		public function set gameResults(value:GameResultsVO):void
		{
			_gameResults = value;
		}

		public function get unlockedAchievements():ArrayCollection
		{
			return _gameResults.unlockedAchievements;
		}
		
		public function get score():String
		{
			return _gameResults.score.toString();
		}
		
		// Restarting the game with new difficulty level
		protected function onEasyButtonClick(e:MouseEvent) : void
		{
			dispatchEvent(new GameViewsEvent(GameViewsEvent.START, GameLevels.EASY));
		}
		
		protected function onMediumButtonClick(e:MouseEvent) : void
		{
			dispatchEvent(new GameViewsEvent(GameViewsEvent.START, GameLevels.MEDIUM));
		}
		
		protected function onHardButtonClick(e:MouseEvent) : void
		{
			dispatchEvent(new GameViewsEvent(GameViewsEvent.START, GameLevels.HARD));
		}
	}
}