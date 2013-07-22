package uk.co.dubit.whackamole.models.moles
{
	/**
	 * Fire Type mole
	 * 
	 **/
	public class FireMole extends Mole
	{
        [Embed("/../assets/fire_mole.png")] // Every mole type now holds reference to its Image
        private var _source:Class;

        public function FireMole()
        {
            points = 100;
            showtime = 1800;
            clicksToDie = 2;
            type = 'fire';
            source = _source;
        }
	}
}

