//
//  HomeViewController.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 30/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface HomeViewController : UIViewController{
    SystemSoundID fallSound;
}
@property (weak, nonatomic) IBOutlet UIButton *levelsOutletButton;
@property (weak, nonatomic) IBOutlet UIButton *achievementsOutletButton;
@property (weak, nonatomic) IBOutlet UIButton *infoOutletButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nLabelConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewConstraint;

@property (weak, nonatomic) IBOutlet UILabel *nLabel;
@property (weak, nonatomic) IBOutlet UILabel *helpLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@end
