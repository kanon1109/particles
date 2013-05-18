package cn.geckos.render
{
import cn.geckos.particles.IParticles;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.Dictionary;
/**
 * ...粒子渲染器
 * @author Kanon
 */
public class ParticlesRenderer 
{
	//父容器
	private var parent:DisplayObjectContainer;
	//虚拟的视图窗口
	private var viewPort:Rectangle;
	//画布位图
	private var canvas:Bitmap;
	//位图数据
	private var canvasBmd:BitmapData;
	//存放粒子的字典
	private var particlesDict:Dictionary;
	//缓存粒子位置的point
	private var pos:Point;
	public function ParticlesRenderer(parent:DisplayObjectContainer, viewPort:Rectangle) 
	{
		this.parent = parent;
		this.viewPort = viewPort;
		this.initData();
		this.initBitmap();
	}
	
	/**
	 * 初始化数据
	 */
	private function initData():void
	{
		this.particlesDict = new Dictionary();
		this.pos = new Point();
	}
	
	/**
	 * 初始化位图
	 */
	private function initBitmap():void
	{
		this.canvasBmd = new BitmapData(this.viewPort.width, this.viewPort.height, true, 0x000000);
		this.canvas = new Bitmap(this.canvasBmd, "auto", true);
		this.parent.addChild(this.canvas);
	}
	
	/**
	 * 添加粒子
	 * @param	vo	粒子数据
	 */
	public function addParticles(vo:IParticles):void
	{
		if (!this.particlesDict[vo])
			this.particlesDict[vo] = vo;
	}
	
	/**
	 * 渲染
	 */
	public function render():void
	{
		if (!this.particlesDict) return;
		//重新上色
		this.canvasBmd.fillRect(this.canvasBmd.rect, 0x000000);
		var vo:IParticles;
		for each (vo in this.particlesDict) 
		{
			vo.update();
			pos.x = vo.x;
			pos.y = vo.y;
			this.canvasBmd.copyPixels(vo.bitmapData, vo.bitmapData.rect, pos, null, null, true);
		}
	}
	
	/**
	 * 销毁
	 */
	public function destroy():void
	{
		var vo:IParticles;
		for each (vo in this.particlesDict) 
		{
			vo.destroy();
			vo = null;
			delete this.particlesDict[vo];
		}
		this.particlesDict = null;
		
		this.canvasBmd.dispose();
		this.canvasBmd = null;
		
		if (this.canvas.parent)
			this.canvas.parent.removeChild(this.canvas);
		this.canvas = null;
		
		this.pos = null;
		this.viewPort = null;
		this.parent = null;
	}
}
}