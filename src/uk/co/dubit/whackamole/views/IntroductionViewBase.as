package uk.co.dubit.whackamole.views
{
	import flash.events.MouseEvent;
	
	import spark.components.Group;
	
	import uk.co.dubit.whackamole.models.GameLevels;
	import uk.co.dubit.whackamole.views.events.GameViewsEvent;
	
	[Event(name="GameStart", type="uk.co.dubit.whackamole.views.events.GameViewsEvent")]
	public class IntroductionViewBase extends Group
	{
		// On level button click seting the difficulty parameter according to which button was pressed
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