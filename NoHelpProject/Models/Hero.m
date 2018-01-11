//
//  Hero.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 28/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "Hero.h"

@implementation Hero
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    
    NSString *path = dictionary[@"thumbnail"][@"path"];
    NSString *extension = dictionary[@"thumbnail"][@"extension"];
    self.imageHeroPath = [NSString stringWithFormat:@"%@.%@", path, extension];
    self.nameHero = dictionary[@"name"];
    self.descriptionHero = dictionary[@"description"];
    self.heroId = [dictionary[@"id"] integerValue];
    return self;
}

@end
