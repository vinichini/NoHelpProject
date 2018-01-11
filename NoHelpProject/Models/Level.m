//
//  Level.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 28/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "Level.h"

@implementation Level

+(NSArray*)levelsUnlockedArray {
    Level *level1 = [[Level alloc] init];
    level1.nameLevel = @"LEVEL 1 - HOME";
    level1.completedLevel = NO;
    
    Level *level2 = [[Level alloc] init];
    level2.nameLevel = @"LEVEL 2 - LAKE";
    level2.completedLevel = NO;
    
    Level *level3 = [[Level alloc] init];
    level3.nameLevel = @"LEVEL 3 - BATHROOM";
    level3.completedLevel = NO;
    
    Level *level4 = [[Level alloc] init];
    level4.nameLevel = @"LEVEL 4 - DOMINO";
    level4.completedLevel = NO;
    
    Level *level5 = [[Level alloc] init];
    level5.nameLevel = @"LEVEL 5 - FIELD";
    level5.completedLevel = NO;
    
    Level *level6 = [[Level alloc] init];
    level6.nameLevel = @"LEVEL 6 - THE TREE";
    level6.completedLevel = NO;
    
    Level *level7 = [[Level alloc] init];
    level7.nameLevel = @"LEVEL 7 - BUS STOP";
    level7.completedLevel = NO;
    
    Level *level8 = [[Level alloc] init];
    level8.nameLevel = @"LEVEL 8 - SWITCHES";
    level8.completedLevel = NO;
    
    Level *level9 = [[Level alloc] init];
    level9.nameLevel = @"LEVEL 9 - DESERT";
    level9.completedLevel = NO;
    
    Level *level10 = [[Level alloc] init];
    level10.nameLevel = @"LEVEL 10 - PICTURES";
    level10.completedLevel = NO;
    
    Level *level11 = [[Level alloc] init];
    level11.nameLevel = @"LEVEL 11 - PUZZLE";
    level11.completedLevel = NO;
    
    Level *level12 = [[Level alloc] init];
    level12.nameLevel = @"LEVEL 12 - LOCKS";
    level12.completedLevel = NO;
    
    
    return @[level1, level2, level3, level4, level5, level6, level7, level8, level9, level10, level11, level12];
}

@end
