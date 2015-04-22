package view.tile
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import interfaces.ITile;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class Tile extends MovieClip implements ITile
	{
		private var _background:DisplayObject;
		
		public function Tile()
		{
		
		}
		
		/**
		 * Drawing mthod
		 */
		public function draw():void
		{
			if ( this._background )
			{
				this.addChild( this._background );
			}
		}
		
		/**
		 * Returns the background DisplayObject
		 * @return	DisplayObject
		 */
		public function get background():DisplayObject
		{
			return this._background;
		}
		
		/**
		 * @param	value	:	DisplayObject
		 */
		public function set background( value:DisplayObject ):void
		{
			this._background = value;
			this.draw();
		}
	}
}