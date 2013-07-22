package uk.co.dubit.whackamole.models.moles
{
	/**
	 * The only type of mole at the moment;
	 * one hit kills it
	 * 
	 **/
	public class Mole
	{
		private var _points:int = 60;
		private var _showtime:int = 1000;
		private var _clicksToDie:int = 1;
		private var _dead:Boolean;
		private var _clicks:int = 0;
		private var _type:String = 'standard';

        [Embed("/../assets/standard_mole.png")] // Every mole type now holds reference to its Image
        private var _source:Class;
		
		public function get points():int
		{
			return _points;
		}
		
		public function set points(value:int):void
		{
			_points = value;
		}
		
		public function get showtime():int
		{
			return _showtime;
		}
		
		public function set showtime(value:int):void
		{
			_showtime = value;
		}

		[Bindable]
		public function get dead():Boolean
		{
			return _dead;
		}

		public function set dead(value:Boolean):void
		{
			_dead = value;
		}

		public function hit() : void
		{
			_clicks++;
			
			// If Mole has been clicked the set amount of times kill it
			if(_clicks >= _clicksToDie){
				dead = true;
			}
		}
		
        public function get type():String
        {
            return _type;
        }
		
		public function set type(value:String):void
		{
			_type = value;
		}

        public function get clicksToDie():int
        {
            return _clicksToDie;
        }
		
		public function set clicksToDie(value:int):void
		{
			_clicksToDie = value;
		}
		
		[Bindable]
        public function get source():Class
        {
            return _source;
        }
		
		public function set source(value:Class):void
		{
			_source = value;
		}
    }
}