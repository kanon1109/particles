package cn.geckos.particles 
{
import flash.display.BitmapData;
	
/**
 * ...
 * @author Kanon
 */
public interface IParticles 
{
	/**
	 * x坐标
	 */
	function get x():Number;
	function set x(value:Number):void;
	
	/**
	 * y坐标
	 */
	function get y():Number;
	function set y(value:Number):void;
	
	/**
	 * 位图数据
	 */
	function get bitmapData():BitmapData;
	function set bitmapData(value:BitmapData):void;
	
	/**
	 * 实时更新
	 */
	function update():void;
	/**
	 * 销毁
	 */
	function destroy():void;
}
}