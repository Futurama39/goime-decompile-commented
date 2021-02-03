delete onEnterFrame;
var mapgrid = [[false,false,false,true,true,true,true,true,true,false],[false,true,true,true,true,true,true,true,true,false],[false,true,true,true,true,true,true,true,true,false],[false,true,true,true,true,true,true,true,true,false],[false,true,true,true,true,true,true,true,true,false],[true,true,true,true,true,true,true,true,true,true],[true,true,true,true,true,true,true,true,true,true],[true,true,false,true,true,true,true,true,true,true],[true,true,false,false,false,false,false,false,false,false],[true,true,false,false,false,false,false,false,false,false]];
var vx = 0;
var vy = 0;
var ox = 0;
var oy = 0;
var onob = false;
var onoby = false;
var realonob = false;
var pan = false;
var achtold = 5679;
var testscore = 0;
var achesSeen = 0;
var GUY_WIDTH = 7;
var swap = [46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,196,76,254,224,469,28,110,395,242,125,310,212,13,86,208,39,305,367,267,181,442,441,429,209,222,387,134,274,189,226,498,203,377,102,386,404,66,32,31,213,78,445,417,107,416,383,244,67,216,354,180,190,440,424,171,373,494,87,88,89,90,91,109,421,418,73,18,438,345,344,121,312,374,460,451,450,298,75,296,35,446,342,341,321,99,100,245,277,449,150,452,175,337,192,413,430,381,9,19,265,131,492,403,467,398,401,230,246,273,388,382,149,166,82,380,432,178,118,261,45,412,308,30,455,456,461,462,465,459,81,210,479,195,223,202,152,26,167,169,168,164,114,22,1,161,104,327,275,120,92,96,414,411,415,94,410,299,262,163,237,250,357,3,361,8,491,165,368,103,42,324,43,496,177,113,234,95,115,393,392,362,340,425,20,21,122,289,290,435,375,427,372,371,128,126,172,282,130,293,129,378,138,184,268,146,25,231,157,478,394,281,269,363,370,284,285,402,464,292,243,400,291,335,241,233,477,434,499,329,258,206,84,422,453,186,214,353,426,143,431,428,270,249,311,315,316,314,320,123,205,276,358,365,328,266,313,6,229,137,34,288,309,350,235,303,44,201,348,369,200,72,433,227,466,278,397,333,379,263,251,111,187,334,420,79,448,155,384,326,145,252,40,211,396,302,188,221,218,220,247,160,255,253,141,140,142,16,436,443,472,306,194,488,339,69,70,68,217,347,15,295,33,17,271,408,485,352,207,85,490,24,139,170,419,407,132,23,176,470,106,112,423,391,366,364,147,359,486,199,101,154,93,437,264,444,325,148,174,283,323,454,153,36,495,29,286,133,236,37,38,457,124,127,156,257,248,27,480,484,483,482,481,476,489,487,471,475,474,355,385,136,14,389,191,0,4,463,11,162,409,193,279,7,338,322,351,119,2,135,182,183,439,98,173,406,151,240,159,225,77,83,74,215,319,317,108,71,318,287,390,41,307,376,12,97,272,116,204,260,259,399,468,117,493,360,179,497,232,144,280,473,239,5,458,80,346,304,294,105,238,197,10,256,332,336,158,330,447,343,356,219,228,331,405,300,297,185,349,301,198];
var completeMapping = new Array(500);
var i = 0;
while(i < 500)
{
   completeMapping[i] = swap[i];
   i++;
}
function achget(num, con)
{
   if(!a[num] && con)
   {
      a[num] = true;
      doit = true;
      acht++;
      std.push(num);
      completeMapping[acht - 1] = num;
      var _loc1_ = 0;
      while(_loc1_ < acht)
      {
         completeMapping[_loc1_] = std[_loc1_];
         _loc1_ = _loc1_ + 1;
      }
      var _loc2_ = acht;
      _loc1_ = 0;
      while(_loc1_ < 500)
      {
         if(!a[swap[_loc1_]])
         {
            completeMapping[_loc2_] = swap[_loc1_];
            _loc2_ = _loc2_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
      return true;
   }
   return false;
}
function updateLandGuyPosition()
{
   if(ending._currentframe < 160)
   {
      inback._x = land._x = paint._x = - camerax;
      inback._y = land._y = paint._y = - cameray;
      guy._x = realx - camerax;
      guy._y = realy - cameray;
      bg._x = (- camerax) / 2;
      bg._y = (- cameray) / 2;
   }
}
function standingOnLand(offset, type)
{
   updateLandGuyPosition();
   if(type == 0)
   {
      return land2.hitTest(realx - GUY_WIDTH,realy + offset,true) || land2.hitTest(realx,realy + offset,true) || land2.hitTest(realx + GUY_WIDTH,realy + offset,true);
   }
   if(type == -1)
   {
      return land2.hitTest(realx - GUY_WIDTH,realy + offset,true) || land2.hitTest(realx,realy + offset,true);
   }
   if(type == 1)
   {
      return land2.hitTest(realx,realy + offset,true) || land2.hitTest(realx + GUY_WIDTH,realy + offset,true);
   }
}
function setAchievementBoard()
{
   var _loc2_ = 1;
   while(_loc2_ <= 12)
   {
      var _loc3_ = completeMapping[2 * (_loc2_ + Math.round(scroller)) - 2];
      if(a[_loc3_])
      {
         _root["b" + _loc2_].gotoAndStop(2);
         achget(470,true);
      }
      else if(hshow)
      {
         _root["b" + _loc2_].gotoAndStop(3);
      }
      else
      {
         _root["b" + _loc2_].gotoAndStop(1);
      }
      _root["b" + _loc2_].box2.gotoAndStop(_loc3_ + 1);
      _root["b" + _loc2_].box3.gotoAndStop(_loc3_ + 1);
      _loc3_ = completeMapping[2 * (_loc2_ + Math.round(scroller)) - 1];
      if(a[_loc3_])
      {
         _root["p" + _loc2_].gotoAndStop(2);
         achget(470,true);
      }
      else if(hshow)
      {
         _root["p" + _loc2_].gotoAndStop(3);
      }
      else
      {
         _root["p" + _loc2_].gotoAndStop(1);
      }
      _root["p" + _loc2_].box2.gotoAndStop(_loc3_ + 1);
      _root["p" + _loc2_].box3.gotoAndStop(_loc3_ + 1);
      _loc2_ = _loc2_ + 1;
   }
   doit = false;
}
function intersectingLand(yOff)
{
   return ghost == 1 && !standingOnLand(yOff,0) && !standingOnLand(yOff - 8,0) && !standingOnLand(yOff - 16,0);
}
function headBangNumber()
{
   var _loc1_ = 1;
   while(_loc1_ <= 13)
   {
      if(land["butt" + _loc1_]._currentframe == 1 || _loc1_ >= 11)
      {
         if(_loc1_ <= 5)
         {
            if(realx > 815 + 100 * _loc1_ && realx < 885 + 100 * _loc1_ && realy > 100 - Math.abs(vy * moveSpeed * 1.25) && realy < 100 + Math.abs(vy * moveSpeed * 1.25))
            {
               if(numon != _loc1_)
               {
                  numon = _loc1_;
                  paint.num1.text = paint.num1.text + numon;
                  paint.num2.text = paint.num2.text + numon;
                  typings++;
                  land["butt" + _loc1_].gotoAndPlay(2);
                  if(achget(190 + _loc1_,true))
                  {
                     keys++;
                  }
               }
               ph = true;
            }
         }
         else if(_loc1_ <= 10)
         {
            if(realx > 315 + 100 * _loc1_ && realx < 385 + 100 * _loc1_ && realy > 250 - Math.abs(vy * moveSpeed * 1.25) && realy < 250 + Math.abs(vy * moveSpeed * 1.25))
            {
               if(numon != _loc1_)
               {
                  numon = _loc1_;
                  if(_loc1_ == 10)
                  {
                     paint.num1.text = paint.num1.text + "0";
                     paint.num2.text = paint.num2.text + "0";
                     land.butt10.gotoAndPlay(2);
                  }
                  else
                  {
                     paint.num1.text = paint.num1.text + numon;
                     paint.num2.text = paint.num2.text + numon;
                     land["butt" + _loc1_].gotoAndPlay(2);
                  }
                  if(achget(190 + _loc1_,true))
                  {
                     keys++;
                  }
                  typings++;
               }
               ph = true;
            }
         }
         else if(realx > -525 + _loc1_ * 75 && realx < -475 + _loc1_ * 75 && realy > -660 && realy < -640)
         {
            if(numon != _loc1_ + 10)
            {
               numon = _loc1_ + 10;
               if(land["pipe" + (_loc1_ - 10)]._currentframe == 1)
               {
                  land["pipe" + (_loc1_ - 10)].gotoAndStop(2);
               }
               else
               {
                  land["pipe" + (_loc1_ - 10)].gotoAndStop(1);
               }
               land["col" + (_loc1_ - 10)].gotoAndPlay(2);
               paint.ball.gotoAndPlay(2);
               paint.ball.bally.gotoAndStop(land.pipe1._currentframe * 4 + land.pipe2._currentframe * 2 + land.pipe3._currentframe - 6);
               map.paint.gotoAndStop(land.pipe1._currentframe * 4 + land.pipe2._currentframe * 2 + land.pipe3._currentframe - 6);
               achget(109,true);
               changes[_loc1_ - 11] = true;
            }
            ph = true;
         }
      }
      _loc1_ = _loc1_ + 1;
   }
}
function processLeftRightPresses()
{
   shakeTimer++;
   var _loc1_ = 2;
   if(moveSpeed <= 0.5)
   {
      _loc1_ = 0.7;
   }
   if(Key.isDown(37) && guy._y < 512)
   {
      achget(2,true);
      vx = vx - _loc1_;
      if(vx < 0)
      {
         if(!shakeLeft)
         {
            if(shakeTimer < 10)
            {
               shakeCount++;
            }
            else
            {
               shakeCount = 0;
            }
            shakeTimer = 0;
         }
         shakeLeft = true;
      }
      if(paint.talk2._currentframe == 6)
      {
         paint.guy2.gotoAndPlay(1);
         paint.talk2.gotoAndStop(31);
      }
      achget(313,map._currentframe >= 2);
   }
   if(Key.isDown(39) && guy._y < 512)
   {
      achget(3,true);
      vx = vx + _loc1_;
      if(vx > 0)
      {
         if(shakeLeft)
         {
            if(shakeTimer < 10)
            {
               shakeCount++;
            }
            else
            {
               shakeCount = 0;
            }
            shakeTimer = 0;
         }
         shakeLeft = false;
      }
      if(paint.talk2._currentframe == 6)
      {
         paint.guy2.gotoAndPlay(1);
         paint.talk2.gotoAndStop(31);
      }
      achget(313,map._currentframe >= 2);
   }
   achget(419,shakeCount >= 12 && guy.body._currentframe == 1);
   achget(420,shakeCount >= 12 && guy.body._currentframe == 8);
}
function paintYouColor(colorToBe)
{
   if(achget(99 + colorToBe,true))
   {
      colnum++;
   }
   achget(417,a[100] && a[107]);
   achget(418,a[103] && a[106]);
   achget(421,a[107] && a[106]);
   achget(422,a[102] && a[103]);
   achget(423,a[101] && a[105]);
   achget(424,a[105] && a[104]);
   achget(497,guy.body._currentframe == 7 && colorToBe == 4);
   guy.body.gotoAndStop(colorToBe);
}
function die(wasPink)
{
   achget(30,realx < 620 && realx > 480);
   paint.talk2.gotoAndStop(2);
   achget(143,Math.sqrt(Math.pow(land.starter._x - realx,2) + Math.pow(land.starter._y - realy,2)) > 1600);
   flashy.gotoAndPlay(2);
   if(wasPink)
   {
      achget(391,guy.body._currentframe == 5);
      flashy.white.gotoAndStop(2);
   }
   else
   {
      flashy.white.gotoAndStop(4);
   }
   realx = land.starter._x;
   realy = land.starter._y - 2;
   vy = 0;
   vx = 0;
   deaths++;
   achget(14,true);
   achget(15,true);
   achget(118,guy.body._currentframe != 3);
   timer2 = 0;
   if(ghost == 2)
   {
      ghost = 0;
      guy._alpha = 100;
      achget(94,true);
   }
   achget(403,law);
}
if(goime.data.timer == undefined || timer <= 0 && timer != undefined)
{
   var testtimes = 0;
   var unlock = 0;
   var a = new Array(500);
   var i = 0;
   while(i < 500)
   {
      a[i] = false;
      i++;
   }
   var fanoo = true;
   var places = new Array(10);
   var i = 0;
   while(i < 10)
   {
      places[i] = new Array(10);
      var j = 0;
      while(j < 10)
      {
         places[i][j] = false;
         j++;
      }
      i++;
   }
   var coins = 0;
   var portals = 0;
   var scroller = 0;
   var timer = 0;
   var timer1 = 0;
   var timer2 = 0;
   var timer3 = 0;
   var timer4 = 0;
   var timer5 = 0;
   var timer6 = 0;
   var timer7 = 0;
   var timer8 = 0;
   var timer9 = 0;
   var timer10 = 0;
   var timer11 = 0;
   var ghosts = 0;
   var acht = 0;
   var deaths = 0;
   var coins2 = 0;
   var hits = 0;
   var typings = 0;
   var changes = [false,false,false];
   var colnum = 1;
   var using = 0;
   var keys = 0;
   var ans = 0;
   var ans2 = 0;
   var times = 0;
   var laps = 0;
   var lamped = [false,false,0];
   var jumps = 0;
   var dista = 0;
   var coincol = new Array(10);
   var i = 0;
   while(i < 10)
   {
      coincol[i] = true;
      i++;
   }
   var bought = [false,false,false,false,false];
   var buyings = 0;
   var i = 1;
   while(i <= 5)
   {
      land["buyt" + i].gotoAndStop(2);
      land["buy" + i].gotoAndStop(15);
      i++;
   }
   guy.body.gotoAndStop(3);
   var std = new Array(0);
}
else
{
   guy.body.gotoAndStop(goime.data.colored);
   var testtimes = goime.data.testtimes;
   achesSeen = goime.data.achesSeen;
   var unlock = goime.data.unlock;
   var a = new Array(500);
   var i = 0;
   while(i < 500)
   {
      a[i] = goime.data.a[i];
      i++;
   }
   var i = 0;
   while(i < 500)
   {
      completeMapping[i] = goime.data.completeMapping[i];
      i++;
   }
   var i = 0;
   while(i < st)
   {
      completeMapping[i] = goime.data.completeMapping[i];
      i++;
   }
   var fanoo = goime.data.fanoo;
   if(!fanoo)
   {
      paint.fan.gotoAndStop(2);
      land.offoron.gotoAndStop(2);
   }
   var places = new Array(10);
   var i = 0;
   while(i < 10)
   {
      places[i] = new Array(10);
      var j = 0;
      while(j < 10)
      {
         places[i][j] = goime.data.places[i][j];
         j++;
      }
      i++;
   }
   var std = new Array(goime.data.std.length);
   var i = 0;
   while(i < std.length)
   {
      std[i] = goime.data.std[i];
      i++;
   }
   var coins = goime.data.coins;
   var portals = goime.data.portals;
   var scroller = goime.data.scroller;
   var timer = goime.data.timer;
   var timer1 = goime.data.timer1;
   var timer2 = goime.data.timer2;
   var timer3 = goime.data.timer3;
   var timer4 = goime.data.timer4;
   var timer5 = goime.data.timer5;
   var timer6 = goime.data.timer6;
   var timer7 = goime.data.timer7;
   var timer8 = goime.data.timer8;
   var timer9 = goime.data.timer9;
   var timer10 = goime.data.timer10;
   var timer11 = goime.data.timer11;
   var ghosts = goime.data.ghosts;
   var acht = goime.data.acht;
   var deaths = goime.data.deaths;
   var coins2 = goime.data.coins2;
   var hits = goime.data.hits;
   var typings = goime.data.typings;
   var changes = new Array(3);
   var i = 0;
   while(i < 3)
   {
      changes[i] = goime.data.changes[i];
      i++;
   }
   var colnum = goime.data.colnum;
   var using = goime.data.using;
   var keys = goime.data.keys;
   var ans = goime.data.ans;
   var ans2 = goime.data.ans2;
   var times = goime.data.times;
   var laps = goime.data.laps;
   var lamped = new Array(3);
   var i = 0;
   while(i < 3)
   {
      lamped[i] = goime.data.lamped[i];
      i++;
   }
   if(lamped[2] == 3)
   {
      paint.lamp.gotoAndStop(90);
   }
   var jumps = goime.data.jumps;
   var dista = goime.data.dista;
   var coincol = new Array(10);
   var i = 0;
   while(i < 10)
   {
      coincol[i] = goime.data.coincol[i];
      if(!coincol[i])
      {
         inback["coin" + (i + 1)].gotoAndStop(34);
      }
      i++;
   }
   var bought = new Array(5);
   var i = 0;
   while(i < 5)
   {
      bought[i] = goime.data.bought[i];
      i++;
   }
   var buyings = goime.data.buyings;
   var i = 1;
   while(i <= 5)
   {
      if(a[377 + i])
      {
         land["out" + (i + 1)].gotoAndStop(33);
      }
      i++;
   }
   if(a[357])
   {
      land.out1.gotoAndStop(33);
   }
   achget(351,true);
   achget(352,true);
}
land2._visible = false;
land.l1left.cacheAsBitmap = true;
land.l1right.cacheAsBitmap = true;
bg.cacheAsBitmap = true;
var law = false;
var av = [0,0,0,0,0,0,0];
var i = 1;
while(i <= 10)
{
   inback["coin" + i].num = i;
   i++;
}
var realx = land.starter._x;
var realy = land.starter._y - 2;
var camerax = 0;
var cameray = 0;
var reset = false;
var portal = false;
var oportal = false;
var dist = [0,0];
var moved = 20;
var coor = [0,0];
var mouse = 0;
var gloop = 0;
var doit = true;
var pers = "0%";
var hshow = false;
var numon = 0;
var numon2 = 0;
var ph = false;
var ghost = 0;
var gp = false;
var talk = false;
var key = 0;
var empt = true;
var prices = [2,3,1,1,3];
var poss = [[4,5,18,4,11,9,10,9,5,5,10,15,9,5,10,19,8,28,25,10,24,26,26,10,13,29,8,8,32,17,9,8,11,37,32,35,40,9,24,9],[5,8,13,5,6,21,11,11,10,11,8,17,16,11,11,27,20,21,22,11,11,25,13,25,10,9,26,31,33,16,21,21,8,11,35,39,41,27,10,21],[7,5,6,7,11,13,5,5,12,12,24,11,16,10,16,30,21,24,22,23,11,8,11,27,24,10,12,42,34,10,11,35,36,38,9,37,11,8,40,32]];
var poss2 = [[4,8,10,6,6,11,6,6,6,6,18,6,4,6,24,22,6,21,13,6,6,6,6,27,6,29,6,6,31,34,6,35,38,38,6,6],[6,9,6,6,17,12,4,4,13,6,6,11,16,6,6,25,20,6,14,30,22,6,4,22,28,29,9,29,31,33,4,36,6,6,6,34],[7,5,6,6,6,9,16,6,15,6,14,6,9,9,19,23,11,6,22,23,6,6,26,6,9,6,27,26,31,6,9,37,33,9,6,9]];
var ori = 0;
var pink = false;
paint.num1.text = "";
paint.num2.text = "";
var hint = 0;
paint.guy.gotoAndStop(1);
var shakeTimer = 0;
var shakeLeft = True;
var shakeCount = 0;
var whipTimer = 0;
var whipCount = 0;
var smallestUnit = 0.2;
var moveSpeed = 1;
var pressedShift = false;
flashy._visible = true;
v._x = mask._width = mask2._width = 580;
guy.ring._visible = false;
var i = 0;
while(i < 5)
{
   if(bought[i])
   {
      land["buy" + (i + 1)].gotoAndStop(16);
      land["buyt" + (i + 1)].gotoAndStop(3);
   }
   else if(prices[i] > coins2 + 0.5)
   {
      land["buyt" + (i + 1)].gotoAndStop(2);
      land["buy" + (i + 1)].gotoAndStop(15);
   }
   else if(land["buyt" + (i + 1)]._currentframe != 3)
   {
      land["buyt" + (i + 1)].gotoAndStop(1);
      land["buy" + (i + 1)].gotoAndStop(1);
   }
   i++;
}
if(bought[4])
{
   paint.eguy.gotoAndPlay(47);
}
var lastMillisCheck = getTimer();
var framesToAdd = 0;
onMouseDown = function()
{
   updateLandGuyPosition();
   coor[0] = _xmouse;
   coor[1] = _ymouse;
   achget(16,true);
   if(_xmouse >= 974)
   {
      mouse = 3;
   }
   else if(_xmouse >= 580)
   {
      if(_ymouse <= 56 && scroller >= 1)
      {
         achget(20,true);
         mouse = 1;
         scroller--;
         doit = true;
      }
      else if(_ymouse >= 446 && scroller <= 475)
      {
         achget(21,true);
         mouse = 2;
         scroller++;
         doit = true;
      }
      else
      {
         achget(86,true);
      }
   }
   if(Math.sqrt(Math.pow(_xmouse - guy._x,2) + Math.pow(_ymouse - (guy._y - 10),2)) <= 12)
   {
      guy.facey.gotoAndPlay(2);
      achget(35,true);
      achget(120,ghost == 2);
      achget(121,guy.body._currentframe != 3);
   }
};
onMouseUp = function()
{
   achget(19,Math.sqrt(Math.pow(_xmouse - coor[0],2) + Math.pow(_ymouse - coor[1],2)) > 50);
   achget(17,true);
   achget(18,true);
   mouse = 0;
};
