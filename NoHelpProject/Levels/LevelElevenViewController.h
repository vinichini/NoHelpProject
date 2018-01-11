//
//  LevelElevenViewController.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 15/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface LevelElevenViewController : UIViewController{
    int puzzleNumber1;
    int puzzleNumber2;
    int puzzleNumber3;
    int puzzleNumber4;
    int puzzleNumber5;
    int puzzleNumber6;
    int puzzleNumber7;
    int puzzleNumber8;
    int puzzleNumber9;
    SystemSoundID unlockingSound;
    SystemSoundID errorSound;
    SystemSoundID successSound;
}
@property (weak, nonatomic) IBOutlet UIImageView *lock1ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lock2ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lock3ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lock4ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lock5ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lock6ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lock7ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lock8ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lock9ImageView;

//Elementos de Validação de Nivel
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;
@property (weak, nonatomic) IBOutlet UIPickerView *codePickerView;
@property (weak, nonatomic) IBOutlet UIButton *checkImageButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeImageViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codePickerViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *checkButtonConstraint;
@property (nonatomic) PickerView *pickerViewInfo;

@end
