package uk.co.dubit.whackamole.views
{
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	
	import uk.co.dubit.whackamole.views.events.GameViewsEvent;
	
	[Event(name="GameStart", type="uk.co.dubit.whackamole.views.events.GameViewsEvent")]
	public class IntroductionViewBase extends Group
	{
		public var easyButton:Button;
		public var mediumButton:Button;
		public var hardButton:Button;
		private var _level:int;
		
		// On level button click seting the difficulty parameter according to which button was pressed
		protected function onStartButtonClick(e:MouseEvent) : void
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
	}
}