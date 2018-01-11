//
//  Hero.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 28/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

-(instancetype)initWithDictionary:(NSDictionary *) dictionary;
@property (nonatomic) NSString *imageHeroPath;
@property (nonatomic) NSString *nameHero;
@property (nonatomic) NSString *descriptionHero;
@property (nonatomic) NSInteger heroId;



@end
