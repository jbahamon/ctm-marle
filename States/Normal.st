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

[State 200, 2]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7011
ID = 200
pos = 7, -10
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
damage = 30,0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7005                      ;Spark anim no (Def: set above)
sparkxy = 0, -20               ;X-offset for the "hit spark" rel. to p2,
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
air.juggle  = 2  
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

[State 220, 2]
type = Projectile
trigger1 = Animelem = 3
attr = S, NP
offset = 10, -25
projID = 210
projanim = 7018
projhitanim = 7019
projremanim = -1
projremovetime = 9
velocity = 5,-5
accel = 0, 0.4
animtype  = Hard
damage    = 45,0
guardflag = MA
pausetime = 0,0
sparkno = -1
hitsound   = S7020,4
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 15
ground.velocity = -2
air.velocity = -2,-2
air.juggle  = 6
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 7, 100, 128
palfx.mul = 256,256,256
palfx.time = 8
ground.cornerpush.veloff = -2;
air.cornerpush.veloff = -2;


[State 200, 2]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I


[State 210, 1]
type = VelSet
trigger1 = AnimElem = 3
X = -2

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

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


[State 210, 1]
type = VelSet
trigger1 = AnimElem = 3
X = -2

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.78
persistent = 0
ignorehitpause = 1

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7010,5

[State 220, 2]
type = Projectile
trigger1 = Animelem = 3
attr = S, NP
offset = 16, -15
projID = 220
projanim = 7018
projhitanim = 7019
projremanim = -1
projremovetime = 10
velocity = 8,0
animtype  = Hard
damage    = 60,0
guardflag = MA
pausetime = 0,0
sparkno = -1
hitsound   = S7020,4
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 15
ground.velocity = -2
air.velocity = -2,-2
air.juggle  = 6
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 7, 100, 128
palfx.mul = 256,256,256
palfx.time = 8
ground.cornerpush.veloff = -2;
air.cornerpush.veloff = -2;

[State 200, 2]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

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
juggle  = 3
poweradd= 0
ctrl = 0
velset = 0,0
anim = 400
sprpriority = 1
facep2 = 1

[State 400, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 200, 2]
type = VelSet
trigger1 = AnimElem = 2 
X = 3

[State 400, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage    = 30,0
priority  = 3
animtype  = Light
hitflag = MAF
guardflag = LA
pausetime = 8, 8
sparkno = S7005
sparkxy = 0, -3
hitsound   = S7020,1
guardsound = 6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 14
guard.hittime = 11
ground.velocity = -2
air.velocity = -1.5,-3
air.juggle  = 3
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -2
air.cornerpush.veloff = -2

[State 200, 2]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

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

[State 400, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage    = 60,0
priority  = 3
animtype  = Light
hitflag = MAF
guardflag = LA
pausetime = 8, 8
sparkno = S7005
sparkxy = 0, -3
hitsound   = S7020,1
guardsound = 6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 17
guard.hittime = 14
ground.velocity = -2
air.velocity = -1.5,-3
air.juggle  = 3
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -2
air.cornerpush.veloff = -2

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 200, 2]
type = VelSet
trigger1 = AnimElem = 2 
X = 3.5

[State 200, 2]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

[State 410, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

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

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.78
persistent = 0
ignorehitpause = 1

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7010,5

[State 400, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage    = 100,0
priority  = 3
animtype  = Light
hitflag = MAF
guardflag = LA
pausetime = 8, 8
sparkno = S7005
sparkxy = 0, -3
hitsound   = S7020,1
guardsound = 6,0
fall = 1
fall.recover = 0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 17
guard.hittime = 18
ground.velocity = -2
air.velocity = -1.5,-3
air.juggle  = 3
getpower = IfElse(Var(21) > 0, 0, 72), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -2
air.cornerpush.veloff = -2

[State 200, 2]
type = VelSet
trigger1 = AnimElem = 2 
X = 4

[State 200, 2]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I


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

[State 420, Explod]
type = Helper
trigger1 = AnimElem = 2
stateno = 601
ID = 600
pos = 15,-20
postype = p1  ;p2,front,back,left,right
facing = 1
sprpriority = 2
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.95
persistent = 0
ignorehitpause = 1

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
Y = 0.35

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
value = 603


; Ice Spike
[Statedef 601]
type    = A
movetype= A
physics = N
juggle  = 10
ctrl = 0
velset = 0, -2
anim = 7140
sprpriority = 2


[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 602
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1010, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 4
priority = 6, Hit
attr = A,SP
damage = Floor(25* parent, fvar(39)), 0
animtype = Hard
hitflag = MAF
hitsound = S7020,5
guardflag = HA
pausetime = 0, 0
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 10
ground.velocity = -2, 0
air.velocity  = -2, 0
air.juggle = 10
fall = 0
p2facing = 1
palfx.invertall = 0
palfx.color = 0
palfx.add = 80, 80, 180
palfx.time = 12
guard.dist = 100
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, fvar(39)*0.95
persistent = 0
ignorehitpause = 1

[State 1021, ChangeState]
type = VelSet
trigger1 = !Time
X = 1 + IfElse(Parent, Vel X > 0, Parent, Vel X, 0)
ignorehitpause = 1

[State 1021, ChangeState]
type = Trans
trigger1 = Time <= 4
trans = addalpha
alpha = Time * 64, 256
ignorehitpause = 1

[State 1021, ChangeState]
type = VelAdd
trigger1 = Time > 0
Y = 1.3
ignorehitpause = 1

[State 1021, ChangeState]
type = AngleSet
trigger1 = Vel X != 0
value = ATan(-Vel Y / Vel X) * 180.0/Pi + 90
ignorehitpause = 1


[State 1021, ChangeState]
type = AngleDraw
trigger1 = 1
scale = 0.3, 0.3
ignorehitpause = 1

[State 1021, ChangeState]
type = Trans
trigger1 = Time > 4
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1021, ChangeState]
type = ChangeState
trigger1 = Pos Y > -Vel Y && Vel Y > 0
value = 602
ignorehitpause = 1

; Ice Spike GetHit
[Statedef 602]
type    = A
movetype= H
physics = N
juggle  = 3
ctrl = 0
anim = 7141
velset = 0, 0
sprpriority = 2

[State 1000, Fade]
type = PlaySnd
trigger1 = !Time
value = S7100,2
channel = 0
ignorehitpause = 1


[State 420, Explod]
type = Explod
trigger1 = NumExplod(600) < 4
trigger1 = Time < 4
anim = 7017
ID = 600
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = -2 * Random/1000.0, -2 - 2 * Random/1000.0
accel = 0,0.4
removetime = -2
shadow = -1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 420, Explod]
type = Explod
trigger1 = Time < 4
trigger1 = NumExplod(600) < 4
anim = 7017
ID = 600
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 2 * Random/1000.0, -2 - 2 * Random/1000.0
accel = 0,0.4
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1021, ChangeState]
type = AngleDraw
trigger1 = Time > 0
scale = 0.3, 0.3
ignorehitpause = 1

[State 1021, ChangeState]
type = Trans
trigger1 = AnimElemNo(0) = 1
trans = addalpha
alpha = 256 - AnimElemTime(1) * 16, 256
ignorehitpause = 1

[State 1021, ChangeState]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1


;Ice Spike Landing
[Statedef 603]
type    = S
movetype= I
physics = N
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
trigger1 = Time > 7
value = 0
ctrl = 1



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

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

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
Y = 0.3

[State 610, 1]
type = PlaySnd
trigger1 = Anim = 610
trigger1 = AnimElem = 2
value = S7000, 1

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7010,5

[State 220, 2]
type = Projectile
trigger1 = Animelem = 3
attr = A, NP
offset = 16, -15
projID = 220
projanim = 7018
projhitanim = 7019
projremanim = -1
projremovetime = 8
velocity = 12,0
animtype  = Hard
damage    = 55, 0
guardflag = HA
pausetime = 18,18
sparkno = -1
hitsound   = S7020,4
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 15
ground.velocity = -2
air.velocity = -2,-2
air.juggle  = 6
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(21) > 0, 0, 36)
givepower = 36, 36
palfx.add = 7, 100, 128
palfx.mul = 256,256,256
palfx.time = 8
ground.cornerpush.veloff = -2;
air.cornerpush.veloff = -2;

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
trigger1 = Time > 12
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
trigger1 = Time > 18
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

[State 200, Dampen]
Type=ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, fvar(39)*0.78
persistent = 0
ignorehitpause = 1

[State 611, Pos]
type = VarSet
trigger1 = !Time
var(0) = 0
ignorehitpause = 1

[State 611, Pos]
type = VarSet
trigger1 = Parent, AnimElem = 4
trigger1 = Parent, StateNo = 620
var(0) = 1
ignorehitpause = 1
persistent = 0

[State 611, Pos]
type = VarAdd
trigger1 = Var(0) > 0
var(0) = 1
ignorehitpause = 1

[State 611, Pos]
type = VelSet
trigger1 = Var(0)
X = 7
Y = 3
ignorehitpause = 1

[State 410, 2]
type = HitDef
trigger1 = Var(0)
attr = A, NP
damage    = 65
animtype  = Medium
hitflag = MAF
guardflag = HA
pausetime = 0,0
sparkno = -1
hitsound   = S7100,2
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
persistent =0

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
trigger1 = Pos Y > 0
trigger2 = MoveContact
trigger3 = !Var(0) && Parent, StateNo != 620
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


[State 411, Snd]
type = PlaySnd
trigger1 = !Time
persistent = 0
value = S7100,2
ignorehitpause = 1

[State 420, Explod]
type = Explod
trigger1 = NumExplod(620) < 4
trigger1 = Time < 4
anim = 7016 + Random % 2
ID = 620
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = -2 * Random/1000.0, -2 - 2 * Random/1000.0
accel = 0,0.4
removetime = -2
shadow = -1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 420, Explod]
type = Explod
trigger1 = Time < 4
trigger1 = NumExplod(620) < 4
anim = 7016 + Random % 2
ID = 620
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 2 * Random/1000.0, -2 - 2 * Random/1000.0
accel = 0,0.4
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 420, Explod]
type = DestroySelf
trigger1 = NumExplod(620) = 4
ignorehitpause = 1


;---------------------------------------------------------------------------
; Freeze
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
add = Floor(32 * Sin(Time * Pi/16.0)) + 32, 32 + Floor(32 * Sin(Time * Pi/16.0)), 32 + Floor(32 * Sin(Time * Pi/16.0))
mul = 256, 256, 256
time = 1

[State 800, Direction]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "holdback", -1, 1)


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
value = S7000,1

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

; Freeze- Push and Cast
[Statedef 801]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 801
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
velset = 0,0

[State 800, Direction]
type = Turn
trigger1 = !Time
trigger1 = Var(0) < 0

[State 801, Bind]
type = VarSet
trigger1 = !Time
trigger1 = NumTarget
V = 1
value = Floor((Target, Pos X - Pos X) * Facing)
ignorehitpause = 1

[State 801, Bind]
type = TargetBind
trigger1 = NumTarget
pos = Var(1), 0


[State 801, Shot]
type = Helper
trigger1 = AnimElemTime(4) = 4
trigger2 = AnimElemTime(4) = 8
trigger3 = AnimElemTime(4) = 12
name = "Freeze Spike"
ID = 800
stateno = 804
postype = p1    ;p2,front,back,left,right
pos = Var(1) + (Random % 40) - 20, (Target, Const(size.height)) - 50 - (Random % 30)
facing = 1
keyctrl = 0
ownpal = 1

[State 802, LifeAdd]
type = PlaySnd
trigger1 = Time = 35
trigger2 = Time = 47
trigger3 = Time = 59
value = S7020,5

[State 801, push]
type = VarAdd
trigger1 = AnimElemNo(0) = 1
var(1) = IfElse(Var(0) < 0, 12, 2)

[State 801, Throw Enemy]
type = TargetState
trigger1 = NumTarget
trigger1 = Time > 60
value = 803

[State 801, Throw Enemy]
type = TargetDrop
trigger1 = Target, StateNo = 803

[State 801, End]
type = ChangeState
trigger1 = !NumTarget
value = 0
ctrl = 1

;Freeze - Gethit
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

[State 802, LifeAdd]
type = LifeAdd
trigger1 = Time = 35
trigger2 = Time = 47
trigger3 = Time = 59
value = -27
kill = Time > 60

[State 802, Shake]
type = EnvShake
trigger1 = Time = 35
trigger2 = Time = 47
trigger3 = Time = 59
time = 5
freq = 120
ampl = 5

[State 802, Shake]
type = PalFX
trigger1 = Time = 35
trigger2 = Time = 47
trigger3 = Time = 59
add = 32, 48, 164
color = 0
time = 12

[State 802, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 802

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;Freeze - Air
[Statedef 803]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 803, Vel]
type = VelSet
trigger1 = !Time
y = -6
x = -4

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

[State 803, Pal]
type = PalFX
trigger1 = (Vel y > 0) && (Pos y >= 0)
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 803, Life]
type = EnvShake
trigger1 = (Vel y > 0) && (Pos y >= 0)
time = 14
freq = 120
ampl = 4

[State 803, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= 0)
y = 0

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100
ctrl = 0

; Ice Spike
[Statedef 804]
type    = A
movetype= A
physics = N
juggle  = 10
ctrl = 0
anim = 7141
sprpriority = 2

[State 1021, Strength]
type = VarSet
trigger1 = !Time
var(0) = parent, var(0)

[State 1021, ChangeState]
type = Trans
trigger1 = Time <= 16
trans = addalpha
alpha = Time * 16, 256
ignorehitpause = 1

[State 1021, ChangeState]
type = VelAdd
trigger1 = Time > 10
Y = 0.2
ignorehitpause = 1

[State 1021, ChangeState]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 1021, ChangeState]
type = Trans
trigger1 = Time > 16
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1021, ChangeState]
type = ChangeState
trigger1 = Pos Y > -Vel Y && Vel Y > 0
value = 805
ignorehitpause = 1

; Ice Spike Landing
[Statedef 805]
type    = A
movetype= I
physics = N
juggle  = 3
ctrl = 0
anim = 7141
velset = 0, 0
sprpriority = 2


[State 1000, Fade]
type = PlaySnd
trigger1 = !Time
value = S7100,2
channel = 0
ignorehitpause = 1

[State 412, Angle]
Type = VarSet
Trigger1 = 1
fvar(0) = -(Pi * Random/1000.0)
ignorehitpause = 1


[State 2013, NormalScale]
type = EnvShake
trigger1 = !Time
time = 8
ampl = 6
freq = 120
ignorehitpause = 1

[State 420, Explod]
type = Explod
trigger1 = NumExplod(1040) < 4
anim = 7016
ID = 1040
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

[State 1021, ChangeState]
type = AngleDraw
trigger1 = Time > 0
scale = 0.5, 0.5
ignorehitpause = 1

[State 1021, ChangeState]
type = Trans
trigger1 = AnimElemNo(0) = 1
trans = addalpha
alpha = 256 - AnimElemTime(1) * 16, 256
ignorehitpause = 1

[State 1021, ChangeState]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1
