;===========================================================================
; Super Moves
;===========================================================================

;---------------------------------------------------------------------------
; Guardia Soldiers
[Statedef 2000]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2000
poweradd = -1000
sprpriority = 2
juggle = 14

[State 2000, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2000, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2001
ctrl = 0

;Guardia Soldiers Attempt
[Statedef 2001]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2001
sprpriority = 2
facep2 = 1

[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = S7002,3
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 2002
p2stateno = 2003
guard.dist = 0
fall = 1
getpower = 0

[State 2001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; Guardia Soldiers - Hit
[Statedef 2002]
type = S
movetype = A
physics = N
sprpriority = 1

[State 2002, Bind]
type = TargetBind
trigger1 = 1
pos = 0,0

; Guardia Soldiers - Hit
[Statedef 2003]
type = S
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ChangeAnim2
trigger1 = Anim != 2003
value = 2003
ignorehitpause = 1

[State 2022, AllFX]
type = PalFX
trigger1 = !Time
time = 8
sinadd = 64, 64, 64, 16
mul = 256, 256, 256

[State 2023, Anim]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050


; Guardia Soldiers - End
[Statedef 2004]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 2024, Vel]
type = VelSet
trigger1 = !Time
y = -9
x = -2

[State 2024, Vel]
type = VelAdd
trigger1 = 1
y = .56

[State 2024, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2004

[State 2024, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 2005

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= -Vel Y)
value = 5100
ctrl = 0



;---------------------------------------------------------------------------
; Ice II
[Statedef 2010]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2010
poweradd = -1000
sprpriority = 2
juggle = 14

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2010, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
ctrl = 0

;Ice II Summoning
[Statedef 2011]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2011
sprpriority = 2
facep2 = 1

[State 2011, Var]
type = VarSet
trigger1 = !Time
V = 0
value = 0

[State 2011, Dark Matter]
type = Helper
trigger1 = !Time
name = "Ice 2"
ID = 2010
stateno = 2012
pos = -5, -120
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2011, Dark Matter]
type = Helper
trigger1 = Time > 0
trigger1 = !NumHelper(2010)
trigger1 = Var(0) := 1
name = "Ice 2"
ID = 2010
stateno = 2012
pos = -5, -120
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2011, End]
type = ChangeState
trigger1 = Time > 130
trigger2 = Var(0)
trigger2 = !NumHelper(2010) || Helper(2010), StateNo = 2014
value = 0
ctrl = 1

;Ice Block
[Statedef 2012]
type    = A
movetype= A
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3
juggle = 14
anim = 7210
velset = 4, 6

[State 2012, Prevent Undergound Juggles]
type= targetbind
trigger1= movehit=1
trigger1= numtarget=1 && numenemy
trigger1= (target,time<=1) && (target,ID=enemynear,ID); this is just to prevent Simul issues as usual
trigger1= !(target,hitshakeover) && (target, hitfall) && (target, pos y>0)
pos= ceil(p2dist x), ceil(-pos y); keeps P2 at the same horizontal distance, but resets his Y position
ignorehitpause= 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(1) = [0, 8]
trans = addalpha
alpha = 32 * AnimElemTime(1), 256 - 16 * AnimElemTime(1)
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(1) > 8
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2013
time = 1
ignorehitpause = 1

[State 2013, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = !Time 
attr = S, HP
damage = 72,3
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,25
sparkno = -1
hitsound = S7020,5
guardsound = 5,0
ground.type = Low
ground.velocity = 0, 0
ground.hittime = 25
air.hittime = 25
ground.slidetime = 5
guard.velocity = -1
air.velocity = 0,0
airguard.velocity = 0, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4
air.fall = 1
fall = 1
p1sprpriority = 2
p2sprpriority = 0
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.invertall = 0
palfx.color = 0
palfx.add = 80, 80, 180
palfx.time = 26
ignorehitpause = 1

;End
[State 2013, End]
type = ChangeState
trigger1 = Pos Y >= - Vel Y
trigger1 = Vel Y > 0
value = 2014
ignorehitpause = 1

;Ice Block GetHit
[Statedef 2013]
type    = A
movetype= H
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3

[State 2013, End]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 2014, PosFreeze]
trigger1 = 1
type = PosFreeze
value = 1
ignorehitpause = 1

[State 6965]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0)
ignorehitpause=1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2013
time = 1
ignorehitpause = 1

[State 2004, End]
type = ChangeState
trigger1 = Time > GetHitVar(HitTime)
value = 2012
ignorehitpause = 1

;Ice Block End
[Statedef 2014]
type    = A
movetype= H
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 3

[State 2013, NormalScale]
type = EnvShake
trigger1 = !Time
time = 24
ampl = 6
freq = 120
ignorehitpause = 1

[State 2013, NormalScale]
type = ChangeAnim
trigger1 = !Time
value = 7211
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = Time
scale = 0.5, 0.5
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - 16 * AnimElemTime(1), 128 + 8 * AnimElemTime(1)
ignorehitpause = 1


[State 2014, PosFreeze]
trigger1 = 1
type = PosFreeze
value = 1
ignorehitpause = 1

[State 2013, End]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1



;---------------------------------------------------------------------------

;Midnight Blackness
[Statedef 2100]
type=S
physics=N
movetype=A
anim=2100
ctrl=0
velset=0,0
sprpriority=1
poweradd = -3000

[State 3060, nhb]
type = NotHitBy
trigger1 = Time <=45
value = SCA
time = 1
ignorehitpause = 1

[State 2010, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7000,2
p2defmul = 1
darken = 0

[State 2020, Attack]
type = VelSet
trigger1 = AnimElemNo(0) >= 4
X = 2.2

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = AnimElemNo(0) = 4
time = 5
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = AnimElem = 4
length = 10
palbright = 0, 0, 0
palcontrast = 128, 128, 256
paladd = 0,0,0
palmul = 1, 1, 1
timegap  = 2
framegap = 2
trans = add1
time = 2; only 2 ticks!!!
ignorehitpause = 1


[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = M
priority = 1, Miss
sparkno = -1
hitsound = S7002,3
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 2102
p2stateno = 2103
guard.dist = 0
fall = 1
getpower = 0

[State 2020, Attack]
type = ChangeState
trigger1 = Time >= 85 && !MoveHit
value = 2101

;Midnight Blackness Miss
[Statedef 2101]
type = C
physics = C
movetype = I
anim = 2021
ctrl = 0
sprpriority = 1

[State 2021, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Midnight Blackness Success
[Statedef 2102]
type = S
physics = S
movetype = I
anim = 2102
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 2022, Bound]
type = PosAdd
trigger1 = !Time && FrontEdgeBodyDist < 50
X = - (50 - FrontEdgeBodyDist)

[State 200, Explod]
type = Explod
trigger1 = Anim = 2102
trigger1 = AnimElem = 4
anim = 7260
ID = 2100
pos = 30, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 200, Explod]
type = Explod
trigger1 = Anim = 2102
trigger1 = AnimElemNo(0) = 4
trigger1 = !NumExplod(2100)
anim = 7265
ID = 2102
pos = 30, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemTime(4) = 20
trigger2 = Anim = 2104 && AnimElemTime(3) = 60 
ID = 2100
stateno = 2110
name = "Cloud"
pos = 37, Floor(1.3 * (Target, Const(size.mid.pos.y)) + IfElse(Anim = 2104, IfElse(NumHelper(2101), -30, (Target, Const(size.head.pos.y))), 0))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemTime(4) = 20
trigger2 = Anim = 2104 && AnimElemTime(3) = 60
ID = 2100
name = "Cloud"
stateno = 2110
pos = 30, Floor(0.7 * (Target, Const(size.mid.pos.y)) + IfElse(Anim = 2104, IfElse(NumHelper(2101), -30, (Target, Const(size.head.pos.y))), 0))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999

[State 2002, Custom]
type = Helper
triggerall = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemTime(4) = 20
trigger2 = Anim = 2104 && AnimElemTime(3) = 60
ID = 2100
name = "Cloud"
stateno = 2110
pos = 37, Floor(IfElse(Anim = 2104, IfElse(NumHelper(2101), -30, (Target, Const(size.head.pos.y))), 0))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999

[State 2002, Transform]
type = TargetState
trigger1 = NumTarget
trigger1 = Anim = 2102
trigger1 = AnimElemNo(0) = 4 
trigger1 = NumHelper(2100)
value = 2104
persistent = 0

[State 2002, Custom]
type = Helper
trigger1 = NumTarget
trigger1 = !(Target, SelfAnimExist(12000)) || !(Target, SelfAnimExist(12001) )
trigger1 = Target, StateNo = 2104
ID = 2101
name = "Replacement Helper"
stateno = 2108
pos = 30, 0
postype = p1    ;p2,front,back,left,right
facing = -1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2002, Transform]
type = ChangeAnim
trigger1 = NumTarget
trigger1 = Anim = 2102
trigger1 = Target, StateNo = 2104
trigger1 = !NumHelper(2100)
value = 2104
persistent = 0

[State 2002, Transform]
type = TargetState
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElem = 3
value = 2105
persistent = 0

[State 2022, Bound]
type = TargetBind
triggerall = NumTarget
trigger1 = Target, StateNo = [2103, 2104]
pos = 30, 0

[State 2002, Transform]
type = TargetBind
trigger1 = NumTarget
trigger1 = Target, StateNo = 2105
pos = Floor(30 + 1.5*Sin(2*Time)), IfElse(!NumHelper(2101), Floor((Target, Const(size.head.pos.y))), 0)

[State 200, Send to Drain]
type = TargetState
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElemTime(3) = 60
value = 2024
ignorehitpause = 1

[State 2022, Let Target Go]
type = TargetDrop
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElemTime(3) = 60

[State 2022, Absorb Life - Enemy]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElemTime(3) < 60
value = -3

[State 2022, Absorb Life - Self]
type = LifeAdd
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElemTime(3) < 60
value = 1

[State 2022, FX]
type = PalFX
trigger1 = NumTarget
trigger1 = Anim = 2104
trigger1 = AnimElem = 3
time = 60
add = 64, 64, 64
sinadd = 64, 64, 64, 128
mul = 256, 256, 256

[State 2022, FX]
type = PalFX
trigger1 = !NumTarget
time = 1
add = 0, 0, 0
mul = 256, 256, 256

[State 2022, Go Back]
type = ChangeAnim
trigger1 = Anim = 2104
trigger1 = !AnimTime
value = 2105

[State 2022, Go Back]
type = VelSet
trigger1 = Anim = 2105
X = -1.2


[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = Anim = 2105
time = 5
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = Anim = 2105
trigger1 = AnimElemTime(1) = 1
length = 10
palbright = 0, 0, 0
palcontrast = 128, 128, 256
paladd = 0,0,0
palmul = 1, 1, 1
timegap  = 2
framegap = 2
trans = add1
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State 2022, Go Back]
type = ChangeState
trigger1 = Anim = 2105
trigger1 = !AnimTime
value = 0
ctrl = 1

; Midnight Blackness - Hit
[Statedef 2103]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2022, FX]
type = PalFX
trigger1 = !Time
time = 9999
add = -64, -64, -64
sinadd = -64, -64, -64, 128
mul = 256, 256, 256

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 2103
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Midnight Blackness - Transformation
[Statedef 2104]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2022, NoPalFX]
type = PalFX
trigger1 = !Time
time = 1
add = 0, 0, 0
sinadd = 0, 0, 0, 16
mul = 256, 256, 256

[State 2023, Anim]
type = ChangeAnim
triggerall = !Time 
trigger1 = SelfAnimExist(12000) && SelfAnimExist(12001) 
value = 12000
ignorehitpause = 1

[State 2023, Anim]
type = AssertSpecial
trigger1 = !SelfAnimExist(12000) || !SelfAnimExist(12001) 
flag = Invisible
flag2 = NoShadow
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Midnight Blackness - Drained
[Statedef 2105]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2022, FX]
type = PalFX
trigger1 = !Time
time = 60
add = -32, -32, -32
sinadd = -32, -32, -32, 32
mul = 256, 256, 256

[State 2023, Anim]
type = ChangeAnim
triggerall = !Time 
trigger1 = SelfAnimExist(12000) && SelfAnimExist(12001) 
value = 12001
ignorehitpause = 1

[State 2023, Anim]
type = AssertSpecial
trigger1 = !SelfAnimExist(12000) || !SelfAnimExist(12001) 
flag = Invisible
flag2 = NoShadow
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Midnight Blackness - Replacement Helper
[Statedef 2108]
type = A
movetype = I
physics = N
anim = 7261
sprpriority = 1

[State 2108, Change]
type = ChangeState
trigger1 = Parent, Anim = 2104
trigger1 = Parent, AnimElem = 3
value = 2109

[State 802, Exit]
type = DestroySelf
trigger1 = Parent, StateNo != 2102
trigger2 = !(Parent, NumTarget)

; Midnight Blackness - Replacement Helper, Drained
[Statedef 2109]
type = A
movetype = I
physics = N
anim = 7262
sprpriority = 1

[State 2108, Elevation]
type = PosAdd
trigger1 = !Time
Y = - 30

[State 2022, FX]
type = PalFX
trigger1 = !Time
time = 60
add = -64, -64, -64
sinadd = -64, -64, -64, 128
mul = 256, 256, 256

[State 2108, Shake]
type = PosAdd
trigger1 = 1
X = 0.5*Sin(2*Time)

[State 802, Exit]
type = DestroySelf
trigger1 = Parent, StateNo != 2102
trigger2 = !(Parent, NumTarget)

; Transformation Clouds
[Statedef 2110]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0,0
sprpriority = 3

[State 2110, Anim]
type = ChangeAnim
trigger1 = !Time
value = 7263 + (Random % 2)

[State 2110, Scale]
type = AngleDraw
trigger1 = 1
scale = 1 + Time/10.0, 1 + Time/10.0

[State 2110, Scale]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - 16 * (Time), 16 * (Time)

[State 2110, DestroySelf]
type = DestroySelf
trigger1 = Time > 16

;Magic Wall Activation
[Statedef 2200]
type = S
movetype = I
physics = S
anim = 2200
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1


[State 200, Explod]
type = Explod
trigger1 = !Time
anim = 7023
ID = 200
pos = 0, -40
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
supermovetime = 9999999

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2110, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2110, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 60
movetime = 60
anim = -1
pos = 0, -20
sound = S7010,2
p2defmul = 1
darken = 0

[State 2110, Super Pause]
type = Explod
trigger1 = AnimElem = 9
removetime = -2
anim = 7110
pos = 0, -20
ownpal = 1
sprpriority = 3
removeongethit = 1
supermovetime = 99999

[State 2110, VarSet]
type = VarSet
trigger1 = (!AnimTime)
v = 21
value = 1

[State 2110, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000) && Var(21) > 0
value = 0
ctrl = 1