//
//  LevelEightViewController.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 05/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface LevelEightViewController : UIViewController{
    SystemSoundID unlockingSound;
    SystemSoundID errorSound;
    SystemSoundID successSound;
}

@property (weak, nonatomic) IBOutlet UIImageView *lightOffImageView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lightsLabel;

@property (weak, nonatomic) IBOutlet UIButton *switch1Button;
@property (weak, nonatomic) IBOutlet UIButton *switch2Button;
@property (weak, nonatomic) IBOutlet UIButton *switch3Button;
@property (weak, nonatomic) IBOutlet UIButton *switch4Button;
@property (weak, nonatomic) IBOutlet UIButton *switch5Button;
@property (weak, nonatomic) IBOutlet UIButton *switch6Button;

//Elementos de Validação de Nivel
@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UIPickerView *codePickerView;
@property (weak, nonatomic) IBOutlet UIButton *checkImageButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codePickerViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeImageViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *checkButtonConstraint;
@property (nonatomic) PickerView *pickerViewInfo;



@end
