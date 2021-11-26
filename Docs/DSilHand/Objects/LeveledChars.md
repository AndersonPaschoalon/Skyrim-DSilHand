
## DSilHand_LvlWereworlfBoss


(Original)

```
Actor:LvlWerewolfBoss
└── LeveledCharacter:LCharWerewolfBoss
    |
    ├── Lv1/Actor:EncWerewolf02Boss
    ├── Lv6/Actor:EncWerewolf02Boss 
    ├── Lv12/Actor:EncWerewolf02Boss 
    ├── Lv20/Actor:EncWerewolf03Boss 
    ├── Lv28/Actor:EncWerewolf04Boss 
    ├── Lv38/Actor:EncWerewolf05Boss 
    └── Lv48/Actor:EncWerewolf06Boss         
```

(Implementation)

```
Actor:DSilHand_LvlWerewolfBoss
└── LeveledCharacter:DSilHand_LCharWerewolfBoss
    |
    ├── Lv1/Actor:DSilHand_EncWerewolf02Boss (offset:200)
    ├── Lv6/Actor:DSilHand_EncWerewolf02Boss (offset:200) 
    ├── Lv12/Actor:DSilHand_EncWerewolf02Boss (offset:200)
    ├── Lv12/Actor:DSilHand_EncWerewolf02Boss (offset:200)
    ├── Lv20/Actor:DSilHand_EncWerewolf03Boss (offset:200)
    ├── Lv28/Actor:DSilHand_EncWerewolf04Boss (offset:300)
    ├── Lv38/Actor:DSilHand_EncWerewolf05Boss (offset:300)
    └── Lv48/Actor:DSilHand_EncWerewolf06Boss (offset:400)
```

## DSilHand_LvlBeast


```
Actor:DSilHand_LvlBeastBoss
└── LeveledCharacter:DSilHand_LCharBeastBoss
    |
    ├── Lv1/LeveledCharacter:LCharBeastBoss02
    |   ├── Lv1/Actor:DSilHand_EncWerewolf02Boss
    |   ├── Lv1/Actor:EncWolf
    |   ├── Lv1/Actor:EncBear
    |   └── Lv1/Actor:EncTroll
    |
    ├── Lv19/LeveledCharacter:LCharBeastBoss03
    |   ├── Lv1/Actor:DSilHand_EncWerewolf03Boss
    |   ├── Lv1/Actor:EncWolf
    |   ├── Lv1/Actor:EncBear
    |   └── Lv1/Actor:EncTroll 
    |
    ├── Lv27/LeveledCharacter:LCharBeastBoss04
    |   ├── Lv1/Actor:DSilHand_EncWerewolf04Boss
    |   ├── Lv1/Actor:EncWolf
    |   ├── Lv1/Actor:EncBear
    |   └── Lv1/Actor:EncTroll
    |
    ├── Lv36/LeveledCharacter:LCharBeastBoss05
    |   ├── Lv1/Actor:DSilHand_EncWerewolf05Boss
    |   ├── Lv1/Actor:EncWolf
    |   ├── Lv1/Actor:EncBear
    |   └── Lv1/Actor:EncTroll
    |
    └── Lv46/LeveledCharacter:LCharBeastBoss06
        ├── Lv1/Actor:DSilHand_EncWerewolf06Boss
        ├── Lv1/Actor:EncWolf
        ├── Lv1/Actor:EncBear
        └── Lv1/Actor:EncTroll
```


## DSilHand_LvlGlenmorilWitch

### Implementation

```
Actor:DSilHand_LvlGlenmorilWitch
└── LeveledCharacter:DSilHand_LCharGlenmorilWitch
    |
    ├── Lv1/LeveledCharacter:DSilHand_LCharGlenmoril02
    |   ├── Actor:DSilHand_EncGlenmoril02BretonF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02ImpF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02NordF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02Hagraven(::EncHagraven)
    |   └── Actor:DSilHand_EncGlenmoril02HagravenWhite(::EncHagraven)
    |
    ├── Lv6/LeveledCharacter:DSilHand_LCharGlenmoril02
    |   ├── Actor:DSilHand_EncGlenmoril02BretonF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02ImpF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02NordF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02Hagraven(::EncHagraven)
    |   └── Actor:DSilHand_EncGlenmoril02HagravenWhite(::EncHagraven)
    |
    ├── Lv12/LeveledCharacter:DSilHand_LCharGlenmoril02
    |   ├── Actor:DSilHand_EncGlenmoril02BretonF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02ImpF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02NordF(::DSilHand_EncGlenmoril03Template)
    |   ├── Actor:DSilHand_EncGlenmoril02Hagraven(::EncHagraven)
    |   └── Actor:DSilHand_EncGlenmoril02HagravenWhite(::EncHagraven)
    |
    ├── Lv19/LeveledCharacter:DSilHand_LCharGlenmoril04
    |   ├── Actor:DSilHand_EncGlenmoril04BretonF(::DSilHand_EncGlenmoril05Template)
    |   ├── Actor:DSilHand_EncGlenmoril04ImpF(::DSilHand_EncGlenmoril05Template)
    |   ├── Actor:DSilHand_EncGlenmoril04NordF(::DSilHand_EncGlenmoril05Template)
    |   ├── Actor:DSilHand_EncGlenmoril04Hagraven(::EncHagraven)
    |   └── Actor:DSilHand_EncGlenmoril04HagravenWhite(::EncHagraven)
    |
    ├── Lv27/LeveledCharacter:DSilHand_LCharGlenmoril04
    |   ├── Actor:DSilHand_EncGlenmoril04BretonF(::DSilHand_EncGlenmoril05Template)
    |   ├── Actor:DSilHand_EncGlenmoril04ImpF(::DSilHand_EncGlenmoril05Template)
    |   ├── Actor:DSilHand_EncGlenmoril04NordF(::DSilHand_EncGlenmoril05Template)
    |   ├── Actor:DSilHand_EncGlenmoril04Hagraven(::EncHagraven)
    |   └── Actor:DSilHand_EncGlenmoril04HagravenWhite(::EncHagraven)
    |
    ├── Lv36/LeveledCharacter:DSilHand_LCharGlenmoril06
    |   ├── Actor:DSilHand_EncGlenmoril06BretonF(::DSilHand_EncGlenmoril07Template)
    |   ├── Actor:DSilHand_EncGlenmoril06ImpF(::DSilHand_EncGlenmoril07Template)
    |   ├── Actor:DSilHand_EncGlenmoril06NordF(::DSilHand_EncGlenmoril07Template)
    |   ├── Actor:DSilHand_EncGlenmoril06Hagraven(::EncHagraven)
    |   └── Actor:DSilHand_EncGlenmoril06HagravenWhite(::EncHagraven)
    |
    └── Lv46/LeveledCharacter:DSilHand_LCharGlenmoril06
        ├── Actor:DSilHand_EncGlenmoril06BretonF(::DSilHand_EncGlenmoril07Template)
        ├── Actor:DSilHand_EncGlenmoril06ImpF(::DSilHand_EncGlenmoril07Template)
        ├── Actor:DSilHand_EncGlenmoril06NordF(::DSilHand_EncGlenmoril07Template)
        ├── Actor:DSilHand_EncGlenmoril06Hagraven(::EncHagraven)
        └──Actor: DSilHand_EncGlenmoril06HagravenWhite(::EncHagraven)

