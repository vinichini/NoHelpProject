//
//  LevelsModel+CoreDataProperties.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 08/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//
//

#import "LevelsModel+CoreDataProperties.h"

@implementation LevelsModel (CoreDataProperties)

+ (NSFetchRequest<LevelsModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"LevelsModel"];
}

@dynamic levelCompleted;
@dynamic levelId;

@end
