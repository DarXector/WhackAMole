package uk.co.dubit.whackamole.views.events
{
	import flash.events.Event;
	
	public class GameViewsEvent extends Event
	{
		public static const START:String = "GameStart";
		private var _level:int;
		
		public function GameViewsEvent(type:String, level:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_level = level;
			super(type, bubbles, cancelable);
		}

		public function get level():int
		{
			return _level;
		}

	}
}