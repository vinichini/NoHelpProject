//
//  HeroDetailsViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 09/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "HeroDetailsViewController.h"
#import "Achievements.h"
#import "Network.h"
#import "Hero.h"
#import "UIImageView+URL.h"


@interface HeroDetailsViewController ()
@property (nonatomic) Network *network;
@property (nonatomic, strong) NSArray *heroesArray;

@end

@implementation HeroDetailsViewController

-(Network *)network {
    if (_network == nil) {
        _network = [[Network alloc] init];
    }
    return _network;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchHero];
}

-(void)fetchHero {
    NSURLSessionDataTask *task = [self.network.session dataTaskWithURL:[self.network fetchHeroWithId:self.achievement.iD] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [self parseHeroes:data];
    }];
    
    [task resume];
}
-(void)parseHeroes:(NSData*)data {
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSArray *heroesJson = json[@"data"][@"results"];
    Hero *hero = [[Hero alloc] initWithDictionary:[heroesJson firstObject]];
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.heroDetailsNameLabel.text = hero.nameHero;
        self.heroDetailsDescriptionTextView.text = hero.descriptionHero;
        [self.heroDetailsImageView setImageWithString:hero.imageHeroPath];
        
        
    });
}

@end
