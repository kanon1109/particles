package cn.geckos.particles 
{
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.geom.Matrix;
import flash.geom.Rectangle;
/**
 * ...动画粒子
 * @author Kanon
 */
public class MovieClipParticles implements IParticles 
{
	/*横向速度*/
	public var vx:Number;
	/*纵向速度*/
	public var vy:Number;
	/*x坐标*/
	private var _x:Number;
	/*y坐标*/
	private var _y:Number;
	/*位图数据*/
	private var _bitmapData:BitmapData;
	private var bitmapVector:Vector.<BitmapData>;
	//当前帧
	private var _currentFrame:int = 1;
	//总帧数
	private var _totalFrames:int;
	public function MovieClipParticles(bitmapVector:Vector.<BitmapData>)
	{
		this.initData();
		this.bitmapVector = bitmapVector;
		this._totalFrames = bitmapVector.length;
		this._bitmapData = this.bitmapVector[this._currentFrame - 1];
	}
	
	/**
	 * 初始化数据
	 */
	private function initData():void
	{
		this.vx = 0;
		this.vy = 0;
		this.x = 0;
		this.y = 0;
	}
	
	/**
	 * 将mc转换成bitmapData序列
	 * @param	movieClip	需要转换的mc
	 * @return	位图序列
	 */
	public static function fromMovieClip(movieClip:MovieClip):Vector.<BitmapData>
	{
		var totalFrames:int = movieClip.totalFrames;
		var maxWidth:Number = 0;
		var maxHeight:Number = 0;
		var maxTop:Number = 0;
		var maxLeft:Number = 0;
		var maxRight:Number = 0;
		var maxBottom:Number = 0;
		var rect:Rectangle;
		for (var i:int = 1; i <= totalFrames; i += 1)
		{
			movieClip.gotoAndStop(i);
			//获取最左上角的坐标 用于计算最大高宽
			rect = movieClip.getBounds(movieClip);
			if (rect.left < maxLeft)
				maxLeft = rect.left;
			if (rect.top < maxTop)
				maxTop = rect.top;
			//获取最右下角的坐标 用于计算最大高宽
			if (rect.right > maxRight)
				maxRight = rect.right;
			if (rect.bottom > maxBottom)
				maxBottom = rect.bottom;
		}
		//获取最大的高宽
		maxWidth = maxRight - maxLeft;
		maxHeight = maxBottom - maxTop;
		var vect:Vector.<BitmapData> = new Vector.<BitmapData>();
		var bitmapData:BitmapData;
		var matrix:Matrix = new Matrix(1, 0, 0, 1, -maxLeft, -maxTop);
		for (i = 1; i <= totalFrames; i += 1)
		{
			movieClip.gotoAndStop(i);
			if (!bitmapData)
				bitmapData = new BitmapData(maxWidth, maxHeight, true, 0xFFFFFF);
			else
				bitmapData = bitmapData.clone();
			bitmapData.draw(movieClip, matrix);
			vect.push(bitmapData);
		}
		return vect;
	}
	
	/**
	 * 更新数据
	 */
	public function update():void
	{
		this.x += this.vx;
		this.y += this.vy;
		this.currentFrame++;
	}
	
	/**
	 * 销毁粒子数据
	 */
	public function destroy():void
	{
		var length:int = this.bitmapVector.length;
		var bitmapData:BitmapData;
		for (var i:int = length - 1; i >= 0; i -= 1) 
		{
			bitmapData = this.bitmapVector[i];
			bitmapData.dispose();
			this.bitmapVector.splice(i, 1);
		}
		if (this._bitmapData)
			this._bitmapData.dispose();
		this._bitmapData = null;
		this.bitmapVector = null;
	}
	
	/**
	 * x坐标
	 */
	public function get x():Number{ return _x; }
	public function set x(value:Number):void 
	{
		_x = value;
	}
	
	/**
	 * y坐标
	 */
	public function get y():Number{ return _y; }
	public function set y(value:Number):void 
	{
		_y = value;
	}
	
	/**
	 * 位图数据
	 */
	public function get bitmapData():BitmapData{ return _bitmapData; }
	
	/**
	 * 矩形范围
	 */
	public function get rect():Rectangle { return _bitmapData.rect; }
	
	/**
	 * 当前帧
	 */
	public function get currentFrame():int { return _currentFrame; };
	public function set currentFrame(value:int):void 
	{
		_currentFrame = value;
		if (_currentFrame <= 0) _currentFrame = 1;
		else if (_currentFrame > this._totalFrames) _currentFrame = 1;
		this._bitmapData = this.bitmapVector[_currentFrame -1];
	}
	
	/**
	 * 总帧数
	 */
	public function get totalFrames():int { return _totalFrames; };
}
}