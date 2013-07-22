package uk.co.dubit.whackamole
{
	import mx.events.FlexEvent;
	
	import spark.components.Application;
	import spark.components.Group;
	
	import uk.co.dubit.whackamole.models.MoleGame;
	import uk.co.dubit.whackamole.models.events.MoleGameEvent;
	import uk.co.dubit.whackamole.views.EndGameView;
	import uk.co.dubit.whackamole.views.IntroductionView;
	import uk.co.dubit.whackamole.views.MoleGameView;
	import uk.co.dubit.whackamole.views.events.GameViewsEvent;

	/**
	 * A small whack-a-mole game based around MVC principles
	 * 
	 */
	public class WhackAMoleBase extends Application
	{
		public var viewContainer:Group;
		private var _currentLevel:int;
				
		public function WhackAMoleBase() : void
		{
			super();
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		public function loadIntroduction() : void
		{
			var introductionView:IntroductionView = new IntroductionView();
			introductionView.addEventListener(GameViewsEvent.START, startGame);
			
			loadView(introductionView);
		}
		
		
		// Loading the Game Over screen and sending all the data that needs to be displayed there
		public function loadEndScreen(e:MoleGameEvent) : void
		{
			var endGameView:EndGameView = new EndGameView();
			endGameView.addEventListener(GameViewsEvent.START, startGame);
			
			endGameView.score = e.data.score.toString();
			endGameView.unlockedAchievements = e.data.unlockedAchievements;
			
			loadView(endGameView);
		}
		
		protected function startGame(event:GameViewsEvent):void
		{
			event.target.removeEventListener(event.type, arguments.callee);
			_currentLevel = event.level;
			
			loadMainGame();
		}
		
		public function loadMainGame() : void
		{
			var moleGameView:MoleGameView = new MoleGameView();
			moleGameView.moleGame = new MoleGame(_currentLevel);
			moleGameView.moleGame.addEventListener(MoleGameEvent.GAME_OVER, loadEndScreen); // Listening for the game over

			loadView(moleGameView);
		}
		
		private function loadView(view:Group) : void
		{
			//Clear any previous views in the container and add
			viewContainer.removeAllElements();
			viewContainer.addElement(view);
		}
		
		private function onCreationComplete(event:FlexEvent) : void
		{
			//When the application is first created, we want to show the introductory view 
			loadIntroduction();
		}
		
	}
}