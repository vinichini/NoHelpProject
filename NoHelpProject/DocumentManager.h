//
//  DocumentManager.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 29/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DocumentManager : NSObject

+(NSManagedObjectContext*)context;

@end
