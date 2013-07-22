package uk.co.dubit.whackamole.views
{
	import spark.components.supportClasses.ItemRenderer;
	
	import uk.co.dubit.whackamole.models.achievements.AchievementVO;
	
	/**
	 * Item Renderer for Unlocked Achievement Display
	 * 
	 */
	
	public class AchievementItemRendererBase extends ItemRenderer
	{
		public function AchievementItemRendererBase()
		{
			super();
		}
		
		//Achievements info to be displayed. Title and Description
		[Bindable]
		protected var achievement:AchievementVO;
		
		override public function set data(value:AchievementVO) : void
		{
			achievement = value as AchievementVO;
		}
	}
}