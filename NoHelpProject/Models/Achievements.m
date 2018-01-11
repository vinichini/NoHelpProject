//
//  Achievements.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 30/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "Achievements.h"
#import "Hero.h"
#import "DocumentManager.h"

@implementation Achievements

+(NSArray*)achievementsUnlockedArray{
    
    Achievements *achievement1 = [[Achievements alloc] init];
    achievement1.level = 1;
    achievement1.nameHero = @"DAREDEVIL";
    achievement1.imageHero=@"daredevil";
    achievement1.completed=NO;
    achievement1.iD= 1009262;
    
    
    Achievements *achievement2 = [[Achievements alloc] init];
    achievement2.level = 2;
    achievement2.nameHero = @"SPIDER-MAN";
    achievement2.imageHero=@"spiderMan";
    achievement2.completed=NO;
    achievement2.iD = 1009610;
    
    Achievements *achievement3 = [[Achievements alloc] init];
    achievement3.level = 3;
    achievement3.nameHero = @"HULK";
    achievement3.imageHero=@"hulk";
    achievement3.completed=NO;
    achievement3.iD = 1009351;
    
    Achievements *achievement4 = [[Achievements alloc] init];
    achievement4.level = 4;
    achievement4.nameHero = @"THOR";
    achievement4.imageHero=@"thor";
    achievement4.completed=NO;
    achievement4.iD = 1009664;
    
    Achievements *achievement5 = [[Achievements alloc] init];
    achievement5.level = 5;
    achievement5.nameHero = @"CAPTAIN AMERICA";
    achievement5.imageHero=@"captainAmerica";
    achievement5.completed=NO;
    achievement5.iD = 1009220;
    
    Achievements *achievement6 = [[Achievements alloc] init];
    achievement6.level = 6;
    achievement6.nameHero = @"Ultron";
    achievement6.imageHero=@"ultron";
    achievement6.completed=NO;
    achievement6.iD = 1009685;
    
    Achievements *achievement7 = [[Achievements alloc] init];
    achievement7.level = 7;
    achievement7.nameHero = @"IRON MAN";
    achievement7.imageHero=@"ironMan";
    achievement7.completed=NO;
    achievement7.iD = 1009368;
    
    Achievements *achievement8 = [[Achievements alloc] init];
    achievement8.level = 8;
    achievement8.nameHero = @"THANOS";
    achievement8.imageHero=@"thanos";
    achievement8.completed=NO;
    achievement8.iD = 1009652;
    
    Achievements *achievement9 = [[Achievements alloc] init];
    achievement9.level = 9;
    achievement9.nameHero = @"FALCON";
    achievement9.imageHero=@"falcon";
    achievement9.completed=NO;
    achievement9.iD = 1009297;
    
    Achievements *achievement10 = [[Achievements alloc] init];
    achievement10.level = 10;
    achievement10.nameHero = @"STORM";
    achievement10.imageHero=@"storm";
    achievement10.completed=NO;
    achievement10.iD = 1009629;
    
    Achievements *achievement11 = [[Achievements alloc] init];
    achievement11.level = 11;
    achievement11.nameHero = @"WOLVERINE";
    achievement11.imageHero=@"wolverine";
    achievement11.completed=NO;
    achievement11.iD = 1009718;
    
    Achievements *achievement12 = [[Achievements alloc] init];
    achievement12.level = 12;
    achievement12.nameHero = @"SPEED";
    achievement12.imageHero=@"speed";
    achievement12.completed=NO;
    achievement12.iD = 1010833;
    
     return @[achievement1, achievement2, achievement3, achievement4, achievement5, achievement6, achievement7, achievement8, achievement9, achievement10, achievement11, achievement12];

 
}


@end
