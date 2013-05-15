package  
{
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;
/**
 * ...粒子测试
 * @author Kanon
 */
public class ParticlesTest extends Sprite 
{
	private var particlesRenderer:ParticlesRenderer;
	public function ParticlesTest() 
	{
		this.particlesRenderer = new ParticlesRenderer(this, new Rectangle(0, 0, stage.stageWidth, stage.stageHeight));
		
		var vo:ParticlesVo;
		for (var i:int = 0; i < 4000; i++) 
		{
			vo = new ParticlesVo();
			vo.bitmapData = new BitmapData(
			this.particlesRenderer.addParticles(vo);
		}
		
		this.addEventListener(Event.ENTER_FRAME, loop);
	}
	
	private function loop(event:Event):void 
	{
		this.particlesRenderer.render();
	}
	
}
}