//
//  DocumentManager.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 29/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "DocumentManager.h"
#import "AppDelegate.h"

@implementation DocumentManager

+(NSManagedObjectContext*)context{
    AppDelegate *delegate = (AppDelegate*) UIApplication.sharedApplication.delegate;
    return delegate.persistentContainer.viewContext;
}
@end
