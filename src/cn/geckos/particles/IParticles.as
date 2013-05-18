package cn.geckos.particles 
{
import flash.display.BitmapData;
import flash.geom.Rectangle;
	
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
	 * 位图的范围 用于缓存bitmapData的 范围
	 */
	function get rect():Rectangle;
	function set rect(value:Rectangle):void;
	
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