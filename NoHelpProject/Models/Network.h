//
//  Network.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 28/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Network : NSObject
-(NSURLSession*)session;
-(NSURL*)fetchHeroWithId:(NSInteger)heroId;
@end

