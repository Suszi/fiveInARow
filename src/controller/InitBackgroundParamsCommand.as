package controller
{
	import constant.CBackground;
	import flash.geom.Rectangle;
	import model.ApplicationModel;
	import robotlegs.bender.bundles.mvcs.Command;
	import vo.BackgroundVO;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class InitBackgroundParamsCommand extends Command
	{
		[Inject]
		public var applicationModel:ApplicationModel;
		
		override public function execute():void
		{
			var backgroundVO:BackgroundVO = new BackgroundVO();
			backgroundVO.columnNumber = CBackground.COLUMN_NUMBER;
			backgroundVO.rowNumber = CBackground.ROW_NUMBER;
			var squareParams:Rectangle = new Rectangle( 0, 0, CBackground.CELL_WIDTH, CBackground.CELL_HEIGHT );
			backgroundVO.squareParams = squareParams;
			this.applicationModel.backgroundVO = backgroundVO;
		}
	
	}

}