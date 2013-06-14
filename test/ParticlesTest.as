package  
{
import cn.geckos.particles.MovieClipParticles;
import cn.geckos.particles.ParticlesVo;
import cn.geckos.render.ParticlesRenderer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.geom.Rectangle;
import net.hires.debug.Stats;
/**
 * ...粒子测试
 * @author Kanon
 */
public class ParticlesTest extends Sprite 
{
	private var particlesRenderer:ParticlesRenderer;
	private var lastVo:ParticlesVo;
	public function ParticlesTest() 
	{
		this.particlesRenderer = new ParticlesRenderer(this, new Rectangle(0, 0, stage.stageWidth, stage.stageHeight));
		//var vo:ParticlesVo;
		var mcPvo:MovieClipParticles;
		var mc:MovieClip;
		for (var i:int = 0; i < 20; i += 1) 
		{
			/*vo = new ParticlesVo();
			vo.x = Math.random() * (550 + 20) - 20;
			vo.y = Math.random() * 400;
			vo.vx = Math.random() * 10 + 1;
			if (Math.random() < .5) vo.bitmapData = new smoke_clear();
			else vo.bitmapData = new smoke_black();
			this.particlesRenderer.addParticles(vo);*/
			
			mc = new MC();
			mcPvo = new MovieClipParticles(MovieClipParticles.fromMovieClip(mc));
			mcPvo.x = Math.random() * (550 + 20) - 20;
			mcPvo.y = Math.random() * 400;
			mcPvo.vx = -Math.random() * 2;
			this.particlesRenderer.addParticles(mcPvo);
		}
		//lastVo = vo;
		this.addEventListener(Event.ENTER_FRAME, loop);
		this.addChild(new Stats());
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
	}
	
	private function keyDownHandler(event:KeyboardEvent):void 
	{
		//this.particlesRenderer.destroy();
		//this.particlesRenderer.removeParticles(lastVo);
	}
	
	private function loop(event:Event):void 
	{
		this.particlesRenderer.render();
	}
	
}
}