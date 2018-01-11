//
//  Achievements.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 30/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Achievements : NSObject

@property (nonatomic, strong) NSString *imageHero;
@property (nonatomic, strong) NSString *nameHero;
@property (nonatomic) NSInteger iD;
@property (nonatomic) NSInteger level;
@property (nonatomic) BOOL completed;

+(NSArray*)achievementsUnlockedArray;
@end
