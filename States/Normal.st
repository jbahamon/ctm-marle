;===========================================================================
; Standing Moves
;===========================================================================

;---------------------------------------------------------------------------
; Standing Light
[Statedef 200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 2                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)
facep2 = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7010
ID = 200
pos = 7, -2
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

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 18                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = M                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7005                      ;Spark anim no (Def: set above)
sparkxy = 0, 0               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S7020, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -1.4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-.8           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Mid
[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 210
sprpriority = 1
facep2 = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7011
ID = 210
pos = 7, -7
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


[State 210, Hit1]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 23
guardflag = M
hitflag = MAF
pausetime = 12,12
sparkno = S7006
sparkxy = -5, -25
hitsound   = S7040,1
guardsound = 6,0
ground.type = High
ground.slidetime = 0
ground.hittime  = 25
ground.velocity = -.5, -4
air.velocity = -.5,-4
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 36, 72)), IfElse(Var(21) > 0, 0, 18)
givepower = 18, 18
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -3;
air.cornerpush.veloff = -3;

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong
[Statedef 220]
type    = S
movetype= A
physics = S
juggle  = 6
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 220
sprpriority = 1
facep2 = 1

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000, 1

[State 220, 2]
type = Projectile
trigger1 = Animelem = 3
attr = S, NP
offset = 16, -15
projID = 220
projanim = 7018
projhitanim = 7019
projremanim = -1
projremovetime = 18
velocity = 4,0
animtype  = Hard
damage    = 42
guardflag = MAF
pausetime = 18,18
sparkno = -1
hitsound   = S7020,3
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 15
ground.velocity = -2
air.velocity = -2,-2
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 7, 100, 128
palfx.mul = 256,256,256
palfx.time = 8
ground.cornerpush.veloff = -2;
air.cornerpush.veloff = -2;

[State 220, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Crouching Moves
;===========================================================================

;---------------------------------------------------------------------------
;Crouching Light
[Statedef 400]
type    = C
movetype= A
physics = C
juggle  = 2
poweradd= 0
ctrl = 0
velset = 0,0
anim = 400
sprpriority = 1
facep2 = 1

[State 400, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7010, 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7013
ID = 200
pos = 7, -7
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

[State 400, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage    = 19
priority  = 3
animtype  = Light
hitflag = MAF
guardflag = M
pausetime = 8, 8
sparkno = S7005
sparkxy = 0,-20
hitsound   = S7040,0
guardsound = 6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 9
ground.velocity = -2
air.velocity = -1.5,-3
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -2
air.cornerpush.veloff = -2

[State 400, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
;Crouching Mid
[Statedef 410]
type    = C
movetype= A
physics = C
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
velset = 0,0
ctrl = 0
anim = 410
sprpriority = 1
facep2 = 1

[State 410, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000, 0

[State 420, Explod]
type = Helper
trigger1 = AnimElem = 2
stateno = 411
ID = 410
pos = 10,-10
postype = p1  ;p2,front,back,left,right
facing = 1
scale = 1,1
sprpriority = 2
ownpal = 1
ignorehitpause = 1

[State 410, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Ice Attack
[Statedef 411]
type = C
physics = N
movetype = A
velset = 0, 0
sprpriority = 2
anim = 7015

[State 410, 2]
type = HitDef
trigger1 = Parent, AnimElem = 3
attr = C, NA
damage    = 34
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 10,23
sparkno = -1
hitsound   = S7020,2
guardsound = 6,0
ground.type = Low
ground.slidetime = 8
ground.hittime  = 10
ground.velocity = -1, -4
air.velocity = -1,-4
getpower = IfElse(Parent, Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Parent, Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.invertall = 0
palfx.color = 0
palfx.add = 80, 80, 180
palfx.time = 18
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 410,Got Hit]
type = NotHitBy
trigger1 = 1
value = , AT
ignorehitpause = 1

[State 410,Got Hit]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 412
ignorehitpause = 1

[State 410,End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = MoveContact
trigger3 = Parent, StateNo != 410
value = 412
ctrl = 0
ignorehitpause = 1


;Destroyed
[Statedef 412]
type = C
physics = N
movetype = A
velset = 0, 0
anim = 7300

[State 412, Angle]
Type = VarSet
Trigger1 = 1
fvar(0) = -(Pi * Random/2000.0)
ignorehitpause = 1

[State 420, Explod]
type = Explod
trigger1 = NumExplod(421) < 4
anim = 7017
ID = 421
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 2 * Cos(FVar(0)), 2 * Sin(FVar(0))
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

[State 420, Explod]
type = DestroySelf
trigger1 = NumExplod(421) = 4
ignorehitpause = 1


;---------------------------------------------------------------------------
;Crouching Strong
; CNS difficulty: easy
[Statedef 420]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= IfElse(Var(21) > 0, 0, 18)
velset = 0,0
ctrl = 0
anim = 420
sprpriority = 1
facep2 = 1

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = S7000,1

[State 220, 2]
type = Projectile
trigger1 = Animelem = 3
attr = C, NP
offset = -3, -25
projID = 220
projanim = 7018
projhitanim = 7019
projremanim = -1
projremovetime = 18
velocity = 2,-7
accel = 0, 0.46
animtype  = Hard
damage    = 42
guardflag = MAF
pausetime = 18,18
sparkno = -1
hitsound   = S7020,3
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 15
ground.velocity = -4
air.velocity = -4,-2
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 7, 100, 128
palfx.mul = 256,256,256
palfx.time = 8
ground.cornerpush.veloff = -2;
air.cornerpush.veloff = -2;

[State 220, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;===========================================================================
; Air Moves
;===========================================================================

;---------------------------------------------------------------------------
;Jump Light
[Statedef 600]
type    = A
movetype= A
physics = N
juggle  = 2
poweradd= 0
ctrl = 0
anim = 600
sprpriority = 1
facep2 = 1

[State 600, 1]
type = PlaySnd
trigger1 = Time = 1
value = 7000, 0

[State 610, Boom]
type = VelAdd
trigger1 = Anim = 600
trigger1 = AnimElem = 3
trigger1 = Vel Y >= -4
Y = -2
persistent = 0

[State 610, Boom]
type = VelAdd
trigger1 = 1
Y = 0.5

[State 600, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7010
ID = 200
pos = 10, -8
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

[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 20
guardflag = HA
priority = 3
pausetime = 7,8
sparkno = S7005 
sparkxy = 0, 0
hitsound   =  S7020,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 8
ground.velocity = -4
air.velocity = -1.3,-3
air.hittime = 14
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 600, 3]
type = CtrlSet
trigger1 = Time = 17
value = 1

[State 610, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 611

;---------------------------------------------------------------------------
;Jump Mid
[Statedef 610]
type    = A
movetype= A
physics = N
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
anim = 610
sprpriority = 1
facep2 = 1

[State 610, Boom]
type = VelSet
trigger1 = !Time
Y = 0.4
X = Vel X * 0.5

[State 610, Boom]
type = VelAdd
trigger1 = Anim = 610
trigger1 = AnimElem = 2
Y = -4

[State 610, Boom]
type = VelAdd
trigger1 = Anim = 610 && AnimElemNo(0) > 1
trigger2 = Anim != 610
Y = 0.4


[State 610, 1]
type = PlaySnd
trigger1 = Anim = 610
trigger1 = AnimElem = 2
value = S7000, 1

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
trigger1 = Anim = 610
anim = 7011
ID = 210
pos = 7, -19
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

[State 610, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 45
guardflag = HA
priority = 3
pausetime = 8,8
sparkno = S7006
sparkxy = -5, -25
hitsound   = S7020,3
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 10
ground.velocity = -0.5, -5
air.velocity = -0.5,-5
air.hittime = 14
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 610, Fall]
type = CtrlSet
trigger1 = Time > 80
value = 1
persistent = 0

[State 610, Fall]
type = ChangeAnim
trigger1 = Anim = 610
trigger1 = !AnimTime
trigger1 = Vel X > 0
value = 42

[State 610, Fall]
type = ChangeAnim
trigger1 = Anim = 610
trigger1 = !AnimTime
trigger1 = Vel X <= 0
value = 41

[State 610, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 611


;Jump Mid Landing
[Statedef 611]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 47
sprpriority = 1
velset = 0,0

[State 611, Pos]
type = PosSet
trigger1 = !Time
Y = 0

[State 611, End]
type = ChangeState
trigger1 = Time > 10
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Jump Strong
; CNS difficulty: easy
[Statedef 620]
type    = A
movetype= A
physics = N
juggle  = 7
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
anim = 620
sprpriority = 1
facep2 = 1


[State 620, VelAdd]
type = VelAdd
trigger1 = AnimElemNo(0) >= 5
trigger2 = Anim != 620
Y = 0.3

[State 620, VelAdd]
type = VelAdd
trigger1 = AnimElem = 5
Y = -3
persistent = 0

[State 620, VelAdd]
type = VelSet
trigger1 = AnimElem = 5
X = -1
persistent = 0

[State 420, Explod]
type = Helper
trigger1 = AnimElem = 2
stateno = 622
ID = 620
pos = 15,-20
postype = p1  ;p2,front,back,left,right
facing = 1
scale = 1,1
sprpriority = 2
ownpal = 1
ignorehitpause = 1

[State 620, VelAdd]
type = VelSet
trigger1 = !Time
X = 0.5 * Vel X
Y = -0.2

[State 620, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 621


;Jump Strong Landing
[Statedef 621]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 47
sprpriority = 1
velset = 0,0

[State 611, Pos]
type = PosSet
trigger1 = !Time
Y = 0

[State 611, End]
type = ChangeState
trigger1 = Time > 15
value = 0
ctrl = 1

;Ice Attack
[Statedef 622]
type = A
physics = N
movetype = A
velset = 0, 0
sprpriority = 2
anim = 7015

[State 611, Pos]
type = PosSet
trigger1 = Parent, AnimElemNo(0) <= 4
X = Parent, Pos X + 15 * Parent, Facing
X = Parent, Pos Y - 20
ignorehitpause = 1

[State 410, 2]
type = HitDef
trigger1 = Parent, AnimElem = 4
attr = C, NA
damage    = 34
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 10,10
sparkno = -1
hitsound   = S7020,2
guardsound = 6,0
ground.type = Low
ground.slidetime = 8
ground.hittime  = 17
ground.velocity = -2, -4
air.velocity = -3,-4
getpower = IfElse(Parent, Var(21) > 0, 0, ifelse(p2movetype = H, 72, 144)), IfElse(Parent, Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.invertall = 0
palfx.color = 0
palfx.add = 80, 80, 180
palfx.time = 18
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 410,Got Hit]
type = NotHitBy
trigger1 = 1
value = , AT
ignorehitpause = 1

[State 410,Got Hit]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 623
ignorehitpause = 1

[State 410,End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = MoveContact
trigger3 = Parent, StateNo != 620
trigger4 = Parent, AnimElemNo(0) > 5
value = 623
ctrl = 0
ignorehitpause = 1


;Destroyed
[Statedef 623]
type = A
physics = N
movetype = A
velset = 0, 0
anim = 7300

[State 412, Angle]
Type = VarSet
Trigger1 = 1
fvar(0) = (Pi * Random/2000.0)
ignorehitpause = 1

[State 420, Explod]
type = Explod
trigger1 = NumExplod(421) < 4
anim = 7017
ID = 421
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 2 * Cos(FVar(0)), 2 * Sin(FVar(0))
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

[State 420, Explod]
type = DestroySelf
trigger1 = NumExplod(421) = 4
ignorehitpause = 1


;---------------------------------------------------------------------------
; Magic Bind
[Statedef 800]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 800
sprpriority = 2
poweradd = IfElse(Var(21) > 0, 0, 18)
facep2 = 1
velset = 0,0

[State 803, Pal]
type = PalFX
trigger1 = 1
add = Floor(64 * Sin(Time * Pi/16.0)), Floor(64 * Sin(Time * Pi/16.0)), Floor(64 * Sin(Time * Pi/16.0))
mul = 256, 256, 256
time = 1

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 800, Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7010,0

[State 800, Hit]
type = hitdef
trigger1 = !time
attr = S, NT 
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = s7000, 0
p1facing = 1
p2facing = var(0)
p1stateno = 801
p2stateno = 802
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Magic Bind - Casting
[Statedef 801]
type    = S
movetype= A
physics = S
juggle  = 3
anim = 801
ctrl = 0
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
velset = 0,0

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemNo(0) = [1, 2]
pos = 15, 0

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemNo(0) = 3
pos = 15 + 2 * AnimElemTime(3), 0

[State 801, Bind]
type = TargetBind
trigger1 = AnimElemNo(0) > 3
pos = 55, 0

[State 801, Throw Enemy]
type = TargetState
trigger1 = Target, StateNo = 802 
trigger1 = NumTarget
trigger1 = AnimElem = 6
value = 803
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = Target, StateNo = 803 
trigger1 = Target, Time = 5 || Target, Time = 15 || Target, Time = 30
trigger1 = Var(22) = 0
trigger1 = !Var(21)
name = "Lightning"
ID = 800
stateno = 806
pos = Floor(Target, ScreenPos X - ScreenPos X) * Facing + (Random % 25) - 12, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 1000, Pawnch]
type = Helper
trigger1 = Target, StateNo = 803 
trigger1 = Target, Time = 5 || Target, Time = 15 || Target, Time = 30
trigger1 = Var(22) = 1
trigger1 = !Var(21)
name = "Water Bubble"
ID = 800
stateno = 807
pos = Floor(Target, ScreenPos X - ScreenPos X) * Facing + (Random % 25) - 12, Floor(Target, Const(size.mid.pos.y) * (0.5 + Random/1000.0))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 1000, Pawnch]
type = Helper
trigger1 = Target, StateNo = 803 
trigger1 = Target, Time = 5 || Target, Time = 15 || Target, Time = 30
trigger1 = Var(22) = 2
trigger1 = !Var(21)
name = "Fire"
ID = 800
stateno = 808
pos = Floor(Target, ScreenPos X - ScreenPos X) * Facing + (Random % 25) - 12, Floor(Target, Const(size.mid.pos.y) * (Random/2000.0))
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 1000, Pawnch]
type = Helper
trigger1 = Target, StateNo = 803 
trigger1 = Target, Time = 5 
trigger1 = Var(21)
name = "Dark Bomb"
ID = 800
stateno = 809
pos = Floor(Target, ScreenPos X - ScreenPos X) * Facing, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 801, Throw Enemy]
type = TargetState
trigger1 = Target, StateNo = 803 
trigger1 = NumTarget
trigger1 = Target, Time > 33
value = 804
persistent = 0

[State 801, End]
type = ChangeState
trigger1 = Target, StateNo = 804
value = 0
ctrl = 1

;Magic Bind - Bound
[Statedef 802]
type = S
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 802, Priority]
type = SprPriority
trigger1 = AnimElem = 3
value = 2

[State 802, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 802

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Magic Bind - Gethit
[Statedef 803]
type = S
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 803, Life]
type = EnvShake
trigger1 = Time = 5
trigger2 = Time = 15
trigger3 = Time = 30
time = 5
freq = 120
ampl = 4

[State 803, Pal]
type = LifeAdd
trigger1 = Time = 5
trigger2 = Time = 15
trigger3 = Time = 30
value = -27
kill = Time > 20

[State 802, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 802

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Magic Bind - End
[Statedef 804]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 803, Vel]
type = VelSet
trigger1 = !Time
y = -9
x = -2

[State 803, Vel]
type = VelAdd
trigger1 = 1
y = .56

[State 803, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 803

[State 803, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 804

[State 803, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= 0)
y = 0

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100
ctrl = 0

;Lightning
[Statedef 806]
type = A
physics = N
movetype= I
anim = 7040
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7105
ID = 200
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1.2, 0.7
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(6), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
ignorehitpause = 1

;Water Bubble
[Statedef 807]
type = A
physics = N
movetype= I
anim = 7041
ctrl = 0
velset = 0,0
sprpriority = 4

[State 1002, Strength]
type = VarSet
trigger1 = !time
var(0) = (root, var(0))

[State 1002, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1010, burst]
type = DestroySelf
trigger1 = !AnimTime

; Fire
[Statedef 808]
type    = A
movetype= I
physics = N
juggle  = 3
ctrl = 0
anim = 7042
sprpriority = 2
velset = 0, -0.4

[State 1002, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1015, assert]
type = Trans
trigger1 = AnimElemNo(0) < 7
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 1015, assert]
type = Trans
trigger1 = AnimElemNo(0) = 7
trans = addalpha
alpha = 256 - AnimElemTime(7) * 16, 128 + AnimElemTime(7) * 8
ignorehitpause = 1

[State 1021, ChangeState]
type = DestroySelf
trigger1 = AnimElemTime(7) >= 16
ignorehitpause = 1


; Dark Bomb
[Statedef 809]
type    = A
movetype= I
physics = N
juggle  = 3
ctrl = 0
anim = 7107
sprpriority = 2
velset = 0, 0

[State 1015, assert]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1


[State 1002, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1021, ChangeState]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1


