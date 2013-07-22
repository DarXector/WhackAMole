package uk.co.dubit.whackamole.models
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	
	import uk.co.dubit.whackamole.models.GameLevels;
	import uk.co.dubit.whackamole.models.events.AchievementEvent;
	import uk.co.dubit.whackamole.models.events.MoleGameEvent;
	import uk.co.dubit.whackamole.models.moles.FireMole;
	import uk.co.dubit.whackamole.models.moles.Mole;
	import uk.co.dubit.whackamole.models.moles.ZombieMole;

	/**
	 * Contains all the logic for the game itself; controls
	 * the addition of moles, keeps track of the player's
	 * score
	 * 
	 **/
	
	[Event(name="gameOver", type="uk.co.dubit.whackamole.models.events.MoleGameEvent")]
	public class MoleGame extends EventDispatcher
	{
		
		private var _score:int = 0;
		private var _level:String = 'easy';
		private var _levelIndex:int = 1; // Used to calculate the speed of moles appearing and dissappearing
		private var _moleHoles:ArrayCollection = new ArrayCollection();
		
		private var gameTimer:Timer;
		
		private const GAME_TIMER_DELAY:int = 500;
		private const TOTAL_MOLES:int = 60;
		private var _achievements:Achievements;
		private var _unlockedAchievements:ArrayCollection = new ArrayCollection(); // Storing unlocked achievements for display
		private var _gameResults:GameResultsVO;
		
		public function MoleGame(level:String)
		{
			//Set up the game timer; when it fires a new
			//mole is added
			_level = level;
			
			// Determening game level index according to the game level
			switch(_level)
			{
				case GameLevels.EASY:
					_levelIndex = 1;
					break;
				case GameLevels.MEDIUM: 
					_levelIndex = 1.5;
					break;
				case GameLevels.HARD: 
					_levelIndex = 2;
					break;
				
			}
			
			_gameResults = new GameResultsVO();
			
			// Achievements calculation, condition checking
			_achievements = new Achievements(this);
			_achievements.addEventListener(AchievementEvent.ACHIEVEMENT_UNLOCKED, _onAchievementUnlocked); // Listening for unlocked achievement event
			
			gameTimer = new Timer(GAME_TIMER_DELAY / _levelIndex, TOTAL_MOLES); // Increasing mole frequency with difficulty level
			gameTimer.addEventListener(TimerEvent.TIMER, onGameTimer);
			gameTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onGameTimerComplete);
		}

		public function get levelIndex():int
		{
			return _levelIndex;
		}

		public function get unlockedAchievements():ArrayCollection
		{
			return _unlockedAchievements;
		}

		public function get level():String
		{
			return _level;
		}

		[Bindable]
		public function get score():int
		{
			return _score;
		}

		public function set score(value:int):void
		{
			_score = value;
		}
		
		[Bindable]
		public function get moleHoles():ArrayCollection
		{
			return _moleHoles;
		}

		public function set moleHoles(value:ArrayCollection):void
		{
			_moleHoles = value;
		}

		public function start() : void
		{
			//There are currently nine MoleHoles; create and
			//add them to the moleHoles ArrayCollection
			for(var i:int = 0; i < 9; i++)
			{
				//A moleHole needs a reference to the game
				//so it can react appropriately to clicks
				var moleHole:MoleHole = new MoleHole(this);
				
				moleHoles.addItem(moleHole);
			}
			
			gameTimer.start();
		}
		
		public function addScore(points:int, mole:Mole) : void
		{
			score += points;
			
			// Calculating parameters for achievements
			_achievements.killedMoles++;
			if(mole is FireMole) _achievements.killedFireMoles++;
			if(mole is ZombieMole) _achievements.killedZombieMoles++;
		}
		
		public function miss() : void
		{
			// Calculating misses for achievements
			_achievements.miss++;
		}
		
		// Storing unlocked achievement
		private function _onAchievementUnlocked(event:AchievementEvent):void
		{
			_unlockedAchievements.addItem(event.achievement);
		}
			
		private function getFreeMoleHole() : MoleHole
		{
			//Pick a random hole until we find one without
			//an mole already in there
			var moleHole:MoleHole = null;
			
			while(moleHole == null || moleHole.mole)
			{
				moleHole = moleHoles[ Math.floor(Math.random() * moleHoles.length) ];
			}
			
			return moleHole;
		}
		
		private function onGameTimer(event:TimerEvent) : void
		{
			//Every time the timer fires, add a new mole
			var moleHole:MoleHole = getFreeMoleHole();
			
			// Populating mole holes with different moles with 60%, 25%, 15% chances
			var rand:Number = Math.random();
			if(rand <= 0.6)
			{
				moleHole.populate(new Mole());
			}else if(rand > 0.6 && rand <= 0.85)
			{
				moleHole.populate(new FireMole());
			}else
			{
				moleHole.populate(new ZombieMole());
			}
		}
		
		private function onGameTimerComplete(event:TimerEvent) : void
		{
			_gameResults.score = score;
			_gameResults.unlockedAchievements = unlockedAchievements;
			dispatchEvent(new MoleGameEvent(MoleGameEvent.GAME_OVER, _gameResults));
		}
	}
}