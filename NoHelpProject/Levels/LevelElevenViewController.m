//
//  LevelElevenViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 15/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "LevelElevenViewController.h"
#import "LevelsModelManager.h"
#import "DocumentManager.h"

@interface LevelElevenViewController ()
@property (nonatomic) LevelsModelManager *levelsModelManager;

@end

@implementation LevelElevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelsModelManager = [[LevelsModelManager alloc] initWithContext:[DocumentManager context]];
    self.pickerViewInfo = [[PickerView alloc]init];
    self.codePickerView.dataSource = self.pickerViewInfo;
    self.codePickerView.delegate = self.pickerViewInfo;
    puzzleNumber1 = 6;
    puzzleNumber2 = 3;
    puzzleNumber3 = 7;
    puzzleNumber4 = 9;
    puzzleNumber5 = 2;
    puzzleNumber6 = 1;
    puzzleNumber7 = 8;
    puzzleNumber8 = 5;
    puzzleNumber9 = 4;
    NSURL *unlockingUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"openingStone" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)unlockingUrl, &unlockingSound);
    NSURL *errorUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"error" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)errorUrl, &errorSound);
    NSURL *successUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"success" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)successUrl, &successSound);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//quando chegar à última imagem voltar à primeira
- (IBAction)button1:(id)sender {
    if (puzzleNumber1 < 9){
        puzzleNumber1 +=1;
        
    } else {
        puzzleNumber1 =1;
    }
    self.lock1ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber1]];
}
- (IBAction)button2:(id)sender {
    if (puzzleNumber2 < 9){
        puzzleNumber2 +=1;
        
    } else {
        puzzleNumber2 =1;
    }
    self.lock2ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber2]];
}
- (IBAction)button3:(id)sender {
    if (puzzleNumber3 < 9){
        puzzleNumber3 +=1;
        
    } else {
        puzzleNumber3 =1;
    }
    self.lock3ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber3]];
}
- (IBAction)button4:(id)sender {
    if (puzzleNumber4 < 9){
        puzzleNumber4 +=1;
        
    } else {
        puzzleNumber4 =1;
    }
    self.lock4ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber4]];
}
- (IBAction)button5:(id)sender {
    if (puzzleNumber5 < 9){
        puzzleNumber5 +=1;
        
    } else {
        puzzleNumber5 =1;
    }
    self.lock5ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber5]];
}
- (IBAction)button6:(id)sender {
    if (puzzleNumber6 < 9){
        puzzleNumber6 +=1;
        
    } else {
        puzzleNumber6 =1;
    }
    self.lock6ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber6]];
}
- (IBAction)button7:(id)sender {
    if (puzzleNumber7 < 9){
        puzzleNumber7 +=1;
        
    } else {
        puzzleNumber7 =1;
    }
    self.lock7ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber7]];
}
- (IBAction)button8:(id)sender {
    if (puzzleNumber8 < 9){
        puzzleNumber8 +=1;
        
    } else {
        puzzleNumber8 =1;
    }
    self.lock8ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber8]];
}
- (IBAction)button9:(id)sender {
    if (puzzleNumber9 < 9){
        puzzleNumber9 +=1;
        
    } else {
        puzzleNumber9 =1;
    }
    self.lock9ImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lock%i", puzzleNumber9]];
}



//Botão de validação voltar ao normal (quando erra no código).
-(void)checkButtonToNormal{
    [self.checkImageButton setImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
}
//Mensagem após completar o nivel
-(void)winnerMessage{
    NSString *title = @"Well Done!";
    NSString *message = @"This was a real puzzle, wasn't it?\n You also unlocked a new hero. Check your achievements!";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
    AudioServicesPlaySystemSound(successSound);
}
//Mensagem quando se carrega no "HELP"
- (IBAction)helpMessage:(id)sender {
    NSString *title = @"HELP";
    NSString *message = @"Just puzzle!!!";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
//Animação após concluir nivel
-(void)endLevelAnimation{
    [self.heroImageView setImage:[UIImage imageNamed:@"wolverine"]];
    [self.view layoutIfNeeded];
    //Alterar ao constraints que impedem o movimento correcto
    self.codeImageViewConstraint.constant = -146;
    self.codePickerViewConstraint.constant = -146;
    self.checkButtonConstraint.constant = 166;
    [UIView animateWithDuration:5 animations:^{
        [self.view layoutIfNeeded];
    }];
}
//Acções ao pressionar o botão de validação
- (IBAction)checkButton:(id)sender {
    if([self.pickerViewInfo.inputKey isEqualToString: @"1593"]){
        [self.checkImageButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self endLevelAnimation];
        [self.levelsModelManager insertWithLevelId:11 levelCompleted:YES];
        [self performSelector:@selector(winnerMessage) withObject:nil afterDelay:5.0];
        AudioServicesPlaySystemSound(unlockingSound);
    } else {
        self.codeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"key"]];
        [self.checkImageButton setImage:[UIImage imageNamed:@"buttonRed"] forState:UIControlStateNormal];
        AudioServicesPlaySystemSound(errorSound);
        [self performSelector:@selector(checkButtonToNormal) withObject:nil afterDelay:2.0];
    }
}



@end
