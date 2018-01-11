//
//  LevelTwelveViewController.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 15/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface LevelTwelveViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    NSArray *pickerWheel;
    NSInteger *value1;
    NSInteger *value2;
    NSInteger *value3;
    NSInteger *value4;
    NSInteger valueYellow1;
    NSInteger valueYellow2;
    NSInteger valueYellow3;
    NSInteger valueYellow4;
    NSInteger valueBlue1;
    NSInteger valueBlue2;
    NSInteger valueBlue3;
    NSInteger valueBlue4;
    NSInteger valueRed1;
    NSInteger valueRed2;
    NSInteger valueRed3;
    NSInteger valueRed4;
    NSInteger valueGreen1;
    NSInteger valueGreen2;
    NSInteger valueGreen3;
    NSInteger valueGreen4;
    NSInteger keyYellow;
    NSInteger keyRed;
    NSInteger keyBlue;
    NSInteger keyGreen;
    NSString *inputKeyYellow;
    NSString *inputKeyBlue;
    NSString *inputKeyRed;
    NSString *inputKeyGreen;
    NSString *inputLevelKey;
    BOOL yellowCompleted;
    BOOL blueCompleted;
    BOOL redCompleted;
    BOOL greenCompleted;
    SystemSoundID unlockingSound;
    SystemSoundID errorSound;
    SystemSoundID successSound;
    SystemSoundID woodSound;
}

    

@property (weak, nonatomic) IBOutlet UIPickerView *yellowPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *bluePickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *redPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *greenPickerView;
@property (weak, nonatomic) IBOutlet UIButton *imageYellowButton;
@property (weak, nonatomic) IBOutlet UIButton *imageBlueButton;
@property (weak, nonatomic) IBOutlet UIButton *imageRedButton;
@property (weak, nonatomic) IBOutlet UIButton *imageGreenButton;
@property (weak, nonatomic) IBOutlet UIImageView *redImageView;
@property (weak, nonatomic) IBOutlet UIImageView *greenImageView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blueImageView;

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
