package uk.co.dubit.whackamole.models.events
{
	import flash.events.Event;
	
	public class MoleGameEvent extends Event
	{
		public static const GAME_OVER:String = "gameOver";
		
		private var _data:Object; // Since now we are sending Unlocked Achievements with Score, this is now an object class
		
		public function MoleGameEvent(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_data = data;
			super(type, bubbles, cancelable);
		}

		public function get data():Object
		{
			return _data;
		}

	}
}