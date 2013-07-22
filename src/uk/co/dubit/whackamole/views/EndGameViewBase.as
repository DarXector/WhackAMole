package uk.co.dubit.whackamole.views
{
	/**
	 * Game Over View with score display, unlocked achievements, 
	 * and Play Again section with difficulty selection
	 * 
	 **/
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Label;
	
	import uk.co.dubit.whackamole.views.events.GameViewsEvent;
	
	[Event(name="GameStart", type="uk.co.dubit.whackamole.views.events.GameViewsEvent")]
	public class EndGameViewBase extends Group
	{
		public var playerScore:Label;
		public var easyButton:Button;
		public var mediumButton:Button;
		public var hardButton:Button;
		private var _level:int;
		private var _score:String;
		
		private var _unlockedAchievements:ArrayCollection;
		
		public function EndGameViewBase() 
		{
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		//Unlocked achievements for End Game Screen display
		[Bindable]
		public function get unlockedAchievements():ArrayCollection
		{
			return _unlockedAchievements;
		}

		public function set unlockedAchievements(value:ArrayCollection):void
		{
			_unlockedAchievements = value;
		}
		
		// Restarting the game with new difficulty level
		protected function onRestartButtonClick(e:MouseEvent) : void
		{
			var target:Button = e.currentTarget as Button;
			
			switch(target)
			{
				case easyButton:
					_level = 1;
					break;
				case mediumButton: 
					_level = 1.5;
					break;
				case hardButton: 
					_level = 2;
					break;
				
			}
			dispatchEvent(new GameViewsEvent(GameViewsEvent.START, _level));
		}
		
		public function set score(value:String) : void
		{
			_score = value;
		}
		
		protected function onCreationComplete(event:FlexEvent) : void
		{
			playerScore.text = _score; // Displaying the new Score
		}
	}
}