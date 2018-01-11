//
//  LevelSevenViewController.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 25/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "PickerView.h"

@interface LevelSevenViewController : UIViewController{
    NSTimer *timer;
    int timerCount;
    SystemSoundID whistelSound;
    SystemSoundID unlockingSound;
    SystemSoundID errorSound;
    SystemSoundID successSound;
}

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *busImageView;
@property (weak, nonatomic) IBOutlet UILabel *orderLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *busImageViewConstraint;


//Elementos de Validação de Nivel
@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UIPickerView *codePickerView;
@property (weak, nonatomic) IBOutlet UIButton *checkImageButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeImageViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codePickerViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *checkButtonConstraint;
@property (nonatomic) PickerView *pickerViewInfo;

@end
