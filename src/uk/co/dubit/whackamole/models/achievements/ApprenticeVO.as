package uk.co.dubit.whackamole.models.achievements
{
	public class ApprenticeVO extends AchievementVO
	{
		public function ApprenticeVO()
		{
			name = 'apprentice';
			text = 'Apprentice';
			value = 15;
			desc = 'Kill over 15 moles during a single game';
		}
	}
}