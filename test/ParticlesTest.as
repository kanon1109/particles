package  
{
import cn.geckos.particles.ParticlesVo;
import cn.geckos.render.ParticlesRenderer;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;
import net.hires.debug.Stats;
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
		for (var i:int = 0; i < 1000; i++) 
		{
			vo = new ParticlesVo();
			vo.x = Math.random() * 550;
			vo.y = Math.random() * 400;
			vo.vx = Math.random() * 10 + 1;
			vo.bitmapData = new Bullet();
			this.particlesRenderer.addParticles(vo);
		}
		this.addEventListener(Event.ENTER_FRAME, loop);
		this.addChild(new Stats());
	}
	
	/**
	 * 判断粒子的位置
	 * @param	vo	粒子
	 */
	private function checkVo(vo:ParticlesVo):void
	{
		if (vo.x > 550)
			vo.x = 0;
	}
	
	private function loop(event:Event):void 
	{
		this.particlesRenderer.render(checkVo);
	}
	
}
}