package uk.co.dubit.whackamole.views.events
{
	import flash.events.Event;
	
	public class GameViewsEvent extends Event
	{
		public static const START:String = "GameStart";
		private var _level:String;
		
		public function GameViewsEvent(type:String, level:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_level = level;
			super(type, bubbles, cancelable);
		}

		public function get level():String
		{
			return _level;
		}

	}
}