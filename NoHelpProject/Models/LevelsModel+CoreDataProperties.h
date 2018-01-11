//
//  LevelsModel+CoreDataProperties.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 08/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//
//

#import "LevelsModel+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface LevelsModel (CoreDataProperties)

+(NSFetchRequest<LevelsModel *> *)fetchRequest;

@property (nonatomic) BOOL levelCompleted;
@property (nonatomic) int32_t levelId;

@end

NS_ASSUME_NONNULL_END
