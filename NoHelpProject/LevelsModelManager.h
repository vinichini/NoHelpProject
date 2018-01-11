//
//  LevelsModelManager.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 08/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "LevelsModel+CoreDataClass.h"


@interface LevelsModelManager : NSObject
-(instancetype)initWithContext:(NSManagedObjectContext*)context;
-(NSArray*)fetch;
-(void)insertWithLevelId:(int)levelId levelCompleted:(BOOL)levelCompleted;
-(void)deleteWithLevelId:(LevelsModel *)levelModal;

@end
