package uk.co.dubit.whackamole.models.achievements
{
	/**
	 * Value objects storring all the parameter for individual achievement.
	 * Every individual Achievement extends this class and sets the parameters
	 * 
	 **/
	
	public class AchievementVO extends Object
	{
		private var _name:String = ''; // ID
		private var _achieved:Boolean = false; // Is it unlocked
		private var _text:String = ''; // Title
		private var _value:int = 0;  // Condition of satisfaction. (killed moles, killed fire molse, misses etc.);
		private var _desc:String = ''; // Description
		
		public function AchievementVO()
		{
		}
		
		[Bindable]
		public function get desc():String
		{
			return _desc;
		}
		
		public function set desc(value:String):void
		{
			_desc = value;
		}
		
		public function get value():int
		{
			return _value;
		}
		
		public function set value(value:int):void
		{
			_value = value;
		}
		
		[Bindable]
		public function get text():String
		{
			return _text;
		}
		
		public function set text(value:String):void
		{
			_text = value;
		}
		
		public function get achieved():Boolean
		{
			return _achieved;
		}
		
		public function set achieved(value:Boolean):void
		{
			_achieved = value;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
	}
}