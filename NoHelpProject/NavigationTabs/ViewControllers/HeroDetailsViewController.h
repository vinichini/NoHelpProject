//
//  HeroDetailsViewController.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 09/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Achievements.h"

@interface HeroDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *heroDetailsNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *heroDetailsImageView;
@property (weak, nonatomic) IBOutlet UITextView *heroDetailsDescriptionTextView;
@property (strong, nonatomic) Achievements *achievement;

@end
