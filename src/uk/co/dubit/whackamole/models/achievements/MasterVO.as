package uk.co.dubit.whackamole.models.achievements
{
	public class MasterVO extends AchievementVO
	{
		public function MasterVO()
		{
			name = 'master';
			text = 'Master';
			value = 40;
			desc = 'Kill more than 40 zombie moles in a single game';
		}
	}
}