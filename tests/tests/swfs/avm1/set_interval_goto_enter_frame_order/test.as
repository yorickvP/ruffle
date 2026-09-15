// Root frame 1. "clip" is a 3-frame MovieClip instance without frame scripts,
// placed on the root timeline (the SWF was assembled with JPEXS).
//
// Flash fires setInterval callbacks after the timelines have advanced, but
// before the queued onEnterFrame handlers run: right after a callback calls
// gotoAndPlay(1), the handler sees _currentframe == 1, not 2.
stop();
var ticks = 0;
var timerFired = 0;
clip.onEnterFrame = function()
{
   ticks++;
   trace("tick " + ticks + ": onEnterFrame sees clip._currentframe = " + this._currentframe);
   if(ticks >= 14)
   {
      clearInterval(iv);
      delete clip.onEnterFrame;
      trace("done");
   }
};
iv = setInterval(function()
{
   timerFired++;
   clip.gotoAndPlay(1);
   trace("timer " + timerFired + ": clip.gotoAndPlay(1); clip._currentframe = " + clip._currentframe);
},200);
