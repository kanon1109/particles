package cn.geckos.particles
{
import flash.display.BitmapData;
/**
 * ...粒子数据
 * @author Kanon
 */
public class ParticlesVo 
{
	/*横向速度*/
	public var vx:Number;
	/*纵向速度*/
	public var vy:Number;
	/*x坐标*/
	public var x:Number;
	/*y坐标*/
	public var y:Number;
	//位图数据
	public var bitmapData:BitmapData;
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
	public function updata():void
	{
		this.x += this.vx;
		this.y += this.vy;
	}
}
}