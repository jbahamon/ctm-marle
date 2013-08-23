;===========================================================================
; Special Moves
;===========================================================================

;Ice
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1000
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "qcfc", 2, IfElse(command = "qcfb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 5
name = "Ice"
ID = 1000
stateno = 1001
pos = 10, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Ice Flame
[Statedef 1001]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7041
sprpriority = 2

[State 1002, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1021, Strength]
type = VarSet
trigger1 = !Time
var(0) = parent, var(0)

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1002
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1021, Vel]
type = VelSet
trigger1 = !Time
X = 0.8 + 0.4 * Var(0)
persistent = 0

[State 1010, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = A,SP
damage = 60, 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 26
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 10
ground.velocity = -1, -1
air.velocity  = -1, -1
air.fall = 1
p2facing = 1
palfx.invertall = 0
palfx.color = 0
palfx.add = 80, 80, 180
palfx.time = 26
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 1022, Explod]
type = Explod
trigger1 = GameTime % (9 - Var(0)) = 0
trigger1 = !MoveContact
trigger1 = Time < 90
anim = 7040
ID = 1001
pos = 7 + Random % 3, 0
postype = p1 ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0, 0
accel = 0,0
removetime = -2
scale = 1 , 1
sprpriority = 2
ontop = 0
ownpal = 1
removeongethit = 0

[State 1021, ChangeState]
type = DestroySelf
trigger1 = Time > 100
ignorehitpause = 1

[State 1021, ChangeState]
type = ChangeState
trigger1 = MoveContact
trigger2 = MoveReversed
value = 1002
ignorehitpause = 1

;Ice Fading
[Statedef 1002]
type = S
physics = N
movetype = I
velset = 0,0
ctrl = 0
anim = 7042
sprpriority = 4


[State 1000, Fade]
type = RemoveExplod
trigger1 = !Time
ID = 1001
ignorehitpause = 1

[State 1000, Fade]
type = AngleDraw
trigger1 = 1
scale = 0.5, 0.5
ignorehitpause = 1

[State 1000, Fade]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 - 8 * Time, 256
ignorehitpause = 1

[State 1001, End]
type = DestroySelf
trigger1 = Time > 32
ignorehitpause = 1

;---------------------------------------------------------------------------
; Aura
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1010
sprpriority = 1
poweradd = -50
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "dbc", 2, ifelse(command = "dbb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7110
ID = 1010
pos = 0, 2
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1010, Remove Aura]
type = RemoveExplod
trigger1 = AnimElemNo(0) != 3
ID = 1010

[State 220, Explod]
type = Explod
trigger1 = AnimElemNo(0) = 4
anim = 7111
ID = 1011
pos = -12, -24
random = 3,3
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0, 0.2
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 220, Explod]
type = Explod
trigger1 = AnimElemNo(0) = 4
anim = 7111
ID = 1011
pos = 3, -29
postype = p1  ;p2,front,back,left,right
random = 3,3
bindtime = 1
vel = 0, 0.15
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 220, Explod]
type = Explod
trigger1 = AnimElemNo(0) = 4
anim = 7111
ID = 1011
pos = 10, -22
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0, 0.1
random = 3,3
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 1040, End]
type = LifeAdd
trigger1 = AnimElemNo(0) = 4
value = 100
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Shadow Walk
[Statedef 1020]
type    = S
movetype= I
physics = S
juggle  = 3
poweradd= 72
ctrl = 0
anim = 1020
sprpriority = -1
facep2 = 1
velset = 0,0


[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = Command = "dfbc" || Command = "dbbc"

[State 1010, Direction]
type = VarSet
trigger1 = !Time
var(1) = IfElse(Command = "dfab" || Command = "dfbc", 1, -1)

[State 1020, Strength]
type = NotHitBy
trigger1 = AnimElemNo(0) >= 2
value = , AA, AP

[State 1020, Strength]
type = NotHitBy
trigger1 = AnimElemNo(0) >= 2
value = , AA, AP

[State 1020, Strength]
type = PlayerPush
trigger1 = AnimElemNo(0) >= 2
value = 0

[State 1020, Strength]
type = VelSet
trigger1 = AnimElemNo(0) >= 2
trigger1 = Anim = 1020 || Anim = 1022
X = IfElse(Var(1) > 0, 1.4 * Const(velocity.run.fwd.x), 1.4 * Const(velocity.run.back.x) )

[State 1020, Strength]
type = ChangeAnim
trigger1 = AnimElemNo(0) = 2
trigger1 = Var(1) < 0
value = 1022

[State 1020, Afterimage]
type = PalFX
trigger1 = Time = [0, 16]
add = -4 * Time, -4 * Time, -4 * Time
color = 16 * (16 - Time )
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 256 - 8 * Time, 4 * Time
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = Time > 16
add = -64, -64, -64
color = 0
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = Trans
trigger1 = Time > 16
trans = addalpha
alpha = 128, 64
ignorehitpause = 1

[State 1020, End]
type = ChangeState
trigger1 = Time > (15 * Var(0) + 25)
value = 1021

;Shadow Walk End
[Statedef 1021]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 1021
sprpriority = 1
facep2 = 1

[State 1020, Afterimage]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 128 + 8 * Time, 64 - 4 * Time
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = 1
add = -4 * (16 - Time), -4 * (16 - Time),-4 * (16 - Time)
color = 16 * Time
time = 1
ignorehitpause = 1

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Siren
[Statedef 1030]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1030
sprpriority = 2
facep2 = 1
velset = 0,0
poweradd = -500

[State 1030, Jump]
type = PlaySnd
trigger1 = !Time
value = 7010,1

[State 1030, Wave]
type = Helper
trigger1 = AnimElem = 4
name = "Siren Shot"
ID = 1030
stateno = 1031
pos = 20, -12
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Siren Shot
[Statedef 1031]
type = A
physics = N
movetype = A
anim = 7130
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

[State 1002, Vertical Speed]
type = VelSet
trigger1 = !Time
X = 3

[State 1010, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = A,SP
damage = 10, 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4,4
sparkno = S7131
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 0, 0
air.velocity = 0, 0
air.fall = 1
fall.recover = 1
hitonce = 1
p2facing = 1
p1stateno = 1033
p2stateno = 1034
palfx.add = 120, 120, 120
palfx.time = 8
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1032
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1010, burst]
type = null;ChangeState
trigger1 = MoveContact && !MoveHit
value = 1032
ignorehitpause = 1

;Siren Shot Fade
[Statedef 1032]
type = A
physics = N
movetype = I
anim = 7130
ctrl = 0
velset = 0,0
sprpriority = 4

[State 1032]
type = DestroySelf
trigger1 = !Time
ignorehitpause = 1

;Stop Clock
[Statedef 1033]
type = A
physics = N
movetype = A
anim = 7132
ctrl = 0
velset = 0,0
sprpriority = 4

[State 1032]
type = VarSet
trigger1 = !Time
FV = 0
value = Target, Pos X
ignorehitpause = 1

[State 1032]
type = VarSet
trigger1 = !Time
FV = 1
value = Target, Pos Y
ignorehitpause = 1

[State 0, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "%f, %f"
params = fvar(0), fvar(1)

[State 1032]
type = PosAdd
trigger1 = !Time
Y = FVar(1) + Target, Const(size.head.pos.y) - 15 - Pos Y
ignorehitpause = 1


[State 1032]
type = PosSet
trigger1 = !Time
X = FVar(0)
ignorehitpause = 1


[State 1032]
type = TargetBind
trigger1 = Time > 2
pos = 0, - Target, Const(size.head.pos.y) + 15
ignorehitpause = 1


[State 1032]
type = TargetState
trigger1 = Target, StateNo != 1034 
trigger1 = Target, Life
trigger1 = Time < 200
value = 1034
ignorehitpause = 1

[State 1032]
type = TargetState
trigger1 = Time > 200 || !(Target, Life)
value = 1035
ignorehitpause = 1

[State 1032]
type = DestroySelf
trigger1 = Time > 200 || !(Target, Life)
ignorehitpause = 1

;Stopped
[Statedef 1034]
movetype = H
anim = 5000
ctrl=0
velset=0,0

[State 3100, Freezing]
type=VelSet
trigger1=1
x=0
y=0

[State 3100, 2]
type = Palfx
trigger1 = !Time
time = 12
add = 120, 120, 120
sinadd = 120, 120, 120,12

[State 3100, 2]
type = HitOverride
trigger1 = 1
time = 1
attr = SCA, AA, AP
stateno = 1034


[State 3100, 4] ;Are you dead?
type = SelfState
trigger1 = !Life
value = 5000

[State 3100, :P]
type=ChangeAnim
trigger1=1
value=anim
elem=animelemno(0)

;Stopped - End
[Statedef 1035]
movetype = H
ctrl=0
velset=0,0

[State 3100, End]
type = SelfState
trigger1 = !Time
value = 5050
