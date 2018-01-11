//
//  AppDelegate.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 23/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

