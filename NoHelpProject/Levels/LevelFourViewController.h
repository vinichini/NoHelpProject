//
//  LevelFourViewController.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 15/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface LevelFourViewController : UIViewController{
    SystemSoundID unlockingSound;
    SystemSoundID errorSound;
    SystemSoundID successSound;
}

//Elementos de Validação de Nivel
@property (weak, nonatomic) IBOutlet UIPickerView *codePickerView;
@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UIButton *checkImageButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeImageViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codePickerViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *checkButtonConstraint;
@property (nonatomic) PickerView *pickerViewInfo;
@end
