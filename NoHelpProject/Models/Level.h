//
//  Level.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 28/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject

@property (nonatomic, strong) NSString *nameLevel;
@property (nonatomic) BOOL completedLevel;
+(NSArray*)levelsUnlockedArray;
@property (nonatomic, strong)  NSArray *pickerWheelArray;
@end
