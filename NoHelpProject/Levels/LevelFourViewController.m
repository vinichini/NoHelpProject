//
//  LevelFourViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 15/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "LevelFourViewController.h"
#import "LevelsModelManager.h"
#import "DocumentManager.h"

@interface LevelFourViewController ()
@property (nonatomic) LevelsModelManager *levelsModelManager;

@end

@implementation LevelFourViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelsModelManager = [[LevelsModelManager alloc] initWithContext:[DocumentManager context]];
    self.pickerViewInfo = [[PickerView alloc]init];
    self.codePickerView.dataSource = self.pickerViewInfo;
    self.codePickerView.delegate = self.pickerViewInfo;
    NSURL *unlockingUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"openingStone" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)unlockingUrl, &unlockingSound);
    NSURL *errorUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"error" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)errorUrl, &errorSound);
    NSURL *successUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"success" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)successUrl, &successSound);
}



//Botão de validação voltar ao normal (quando erra no código).
-(void)checkButtonToNormal{
    [self.checkImageButton setImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
}
//Mensagem após completar o nivel
-(void)winnerMessage{
    NSString *title = @"Well Done!";
    NSString *message = @"Wow! You know how to play Domino! \n You also unlocked a new Hero. Check your achievements!";
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
    NSString *message = @"Domino: An old and simple game...";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
    
}
//Animação após concluir nivel
-(void)endLevelAnimation{
    [self.heroImageView setImage:[UIImage imageNamed:@"thor"]];
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
    if([self.pickerViewInfo.inputKey isEqualToString: @"2110"]){
        [self.checkImageButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self endLevelAnimation];
        [self.levelsModelManager insertWithLevelId:4 levelCompleted:YES];
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
