//Code for the easter egg in the main menu
var ml = new Object();
var glorbable = false;
ml.onMouseWheel = function(d)
//func happends when mousewhell is spun upwards and G is pressed
{
   if(Key.isDown(71))
   //the G key
   {
      singingface._alpha = 100;
      singingface._y = singingface._y - d * 30;
      if(singingface._y < 500 && !glorbable)
      {
         glorbable = true;
         stopAllSounds();
         var _loc2_ = new Sound(_root);
         _loc2_.setVolume(100);
         _loc2_.attachSound("eple");
         _loc2_.start(0,99999999);
      }
      updateAfterEvent();
   }
};
Mouse.addListener(ml);
