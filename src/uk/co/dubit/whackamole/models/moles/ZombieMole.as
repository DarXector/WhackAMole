package uk.co.dubit.whackamole.models.moles
{
	/**
	 * Zombie Type mole
	 * 
	 **/
	public class ZombieMole extends Mole
	{
        [Embed("/../assets/zombie_mole.png")] // Every mole type now holds reference to its Image
        private var _source:Class;

		public function ZombieMole()
        {
            points = 400;
            showtime = 1200;
            clicksToDie = 3;
            type = 'zombie';
            source = _source;
        }
	}
}

