package cn.geckos.particles
{
import flash.display.BitmapData;
/**
 * ...粒子数据
 * @author Kanon
 */
public class ParticlesVo implements IParticles
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
	public function ParticlesVo() 
	{
		this.initData();
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
	 * 更新数据
	 */
	public function update():void
	{
		this.x += this.vx;
		this.y += this.vy;
		if (this.x > 550)
			this.x = -20;
	}
	
	/**
	 * 销毁粒子数据
	 */
	public function destroy():void
	{
		this.bitmapData.dispose();
		this.bitmapData = null;
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
	public function set bitmapData(value:BitmapData):void 
	{
		_bitmapData = value;
	}
}
}