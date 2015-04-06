package guard
{
	import constant.CBackground;
	import model.ApplicationModel;
	import robotlegs.bender.framework.api.IGuard;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class HasFiveInARowGuard implements IGuard
	{
		[Inject]
		public var applicationModel:ApplicationModel;
		
		public function approve():Boolean
		{
			for ( var r:int = 0; r < CBackground.ROW_NUMBER; r++ )
			{
				for ( var c:int = 0; c < CBackground.COLUMN_NUMBER - 4; c++ )
				{
					if ( this.applicationModel.markerPositions[ r ][ c ] != 0 )
					{
						if ( this.applicationModel.markerPositions[ r ][ c + 1 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r ][ c + 2 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r ][ c + 3 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r ][ c + 4 ] == this.applicationModel.markerPositions[ r ][ c ] )
						{
							return true;
						}
						
						if ( this.applicationModel.markerPositions[ r + 1 ][ c ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r + 2 ][ c ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r + 3 ][ c ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r + 4 ][ c ] == this.applicationModel.markerPositions[ r ][ c ] )
						{
							return true;
						}
						
						if ( r < CBackground.ROW_NUMBER - 4 && c < CBackground.COLUMN_NUMBER - 4 && this.applicationModel.markerPositions[ r + 1 ][ c + 1 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r + 2 ][ c + 2 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r + 3 ][ c + 3 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r + 4 ][ c + 4 ] == this.applicationModel.markerPositions[ r ][ c ] )
						{
							return true;
						}
						
						if ( r > 3 && c < CBackground.COLUMN_NUMBER - 4 && this.applicationModel.markerPositions[ r - 1 ][ c + 1 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r - 2 ][ c + 2 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r - 3 ][ c + 3 ] == this.applicationModel.markerPositions[ r ][ c ] && this.applicationModel.markerPositions[ r - 4 ][ c + 4 ] == this.applicationModel.markerPositions[ r ][ c ] )
						{
							return true;
						}
					}
				}
			}
			
			if ( this.applicationModel.markerCounter == CBackground.ROW_NUMBER * CBackground.COLUMN_NUMBER )
			{
				return true;
			}
			
			return false;
		}
	}

}