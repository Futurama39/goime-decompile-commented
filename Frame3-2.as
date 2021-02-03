var goime = SharedObject.getLocal("goime2");
function timeToText(f, g)
//Looks like time is handled in some base unit and is converted to time format here
//most probably for displaying the "your time section"
{
   f = f * 20;
   var _loc2_ = [0,0,0,0,0,0,0,0,0];
   _loc2_[0] = Math.round(f % 10);
   _loc2_[1] = Math.round(Math.floor(f / 10) % 10);
   _loc2_[2] = Math.round(Math.floor(f / 100) % 10);
   _loc2_[3] = Math.round(Math.floor(f / 1000) % 10);
   _loc2_[4] = Math.round(Math.floor(f / 10000) % 6);
   _loc2_[5] = Math.round(Math.floor(f / 60000) % 10);
   _loc2_[6] = Math.round(Math.floor(f / 600000) % 6);
   _loc2_[7] = Math.round(Math.floor(f / 3600000) % 10);
   _loc2_[8] = Math.round(Math.floor(f / 36000000) % 10);
   var _loc4_ = false;
   var _loc3_ = "";
   var _loc1_ = 8;
   while(_loc1_ >= 0)
   {
      if((_loc2_[_loc1_] >= 1 || _loc1_ <= g) && !_loc4_)
      {
         _loc4_ = true;
      }
      if(_loc4_)
      {
         _loc3_ = _loc3_ + (_loc2_[_loc1_] + "").substring(0,1);
         if(_loc1_ == 3)
         {
            _loc3_ = _loc3_ + ".";
         }
         if(_loc1_ == 5 || _loc1_ == 7)
         {
            _loc3_ = _loc3_ + ":";
         }
      }
      _loc1_ = _loc1_ - 1;
   }
   return _loc3_;
}
if(goime.data.timer == undefined || goime.data.timer <= 0)
{
   butts.gotoAndStop(1);
}
else
{
   butts.gotoAndStop(2);
}
if(goime.data.recordtime == undefined)
{
   recordmm.gotoAndStop(1);
   var recordtime = 100000000000;
}
else
{
   recordtime = goime.data.recordtime;
   recordmm.gotoAndStop(2);
   recordmm.besttext.text = timeToText(recordtime,5);
}
var music = new Sound(_root);
music.setVolume(100);
var sound = true;
var sp = false; //Sound mute bool
var qp = false; //Quality bool
var hp = false;
var mp = false;
stop();
onEnterFrame = function()
{
   if(Key.isDown(81))
   {
      if(!qp)
      {
         if(_quality == "HIGH")
         {
            _quality = "LOW";
         }
         else
         {
            _quality = "HIGH";
         }
      }
      qp = true;
   }
   else
   {
      qp = false;
   }
   if(Key.isDown(83))
   {
      if(!sp)
      {
         if(sound)
         {
            sound = false;
            music.setVolume(0);
         }
         else
         {
            sound = true;
            music.setVolume(100);
         }
      }
      sp = true;
   }
   else
   {
      sp = false;
   }
};
