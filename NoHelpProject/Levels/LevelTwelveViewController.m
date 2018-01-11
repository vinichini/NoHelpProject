//
//  LevelTwelveViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 15/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "LevelTwelveViewController.h"
#import "LevelsModelManager.h"
#import "DocumentManager.h"

@interface LevelTwelveViewController ()
@property (nonatomic) LevelsModelManager *levelsModelManager;
@end

@implementation LevelTwelveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelsModelManager = [[LevelsModelManager alloc] initWithContext:[DocumentManager context]];
    self.pickerViewInfo = [[PickerView alloc]init];
    self.codePickerView.dataSource = self.pickerViewInfo;
    self.codePickerView.delegate = self.pickerViewInfo;
    self.yellowPickerView.dataSource = self;
    self.yellowPickerView.delegate = self;
    self.bluePickerView.dataSource = self;
    self.bluePickerView.delegate = self;
    self.redPickerView.dataSource = self;
    self.redPickerView.delegate = self;
    self.greenPickerView.dataSource = self;
    self.greenPickerView.delegate = self;
    pickerWheel = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    yellowCompleted=NO;
    blueCompleted = NO;
    redCompleted = NO;
    greenCompleted = NO;
    NSURL *unlockingUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"openingStone" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)unlockingUrl, &unlockingSound);
    NSURL *errorUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"error" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)errorUrl, &errorSound);
    NSURL *successUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"success" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)successUrl, &successSound);
    NSURL *woodUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"wood" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)woodUrl, &woodSound);
    
}




//CÓDIGO CADEADO
// Número de colunas
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 4;
}

// Número de Linhas
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0: return [pickerWheel count];
        case 1: return [pickerWheel count];
        case 2: return [pickerWheel count];
        case 3: return [pickerWheel count];
            
    }
    return 0;
}
// A chave seleccionada
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0: return [pickerWheel objectAtIndex:row];
        case 1: return [pickerWheel objectAtIndex:row];
        case 2: return [pickerWheel objectAtIndex:row];
        case 3: return [pickerWheel objectAtIndex:row];
    }
    return 0;
    
}
//Atribuir valores à selecção
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    valueYellow1 = [self.yellowPickerView selectedRowInComponent:0];
    valueYellow2 = [self.yellowPickerView selectedRowInComponent:1];
    valueYellow3 = [self.yellowPickerView selectedRowInComponent:2];
    valueYellow4 = [self.yellowPickerView selectedRowInComponent:3];
    inputKeyYellow = [NSString stringWithFormat:@"%ld%ld%ld%ld", (long)valueYellow1, (long)valueYellow2, (long)valueYellow3, (long)valueYellow4];
    valueBlue1 = [self.bluePickerView selectedRowInComponent:0];
    valueBlue2 = [self.bluePickerView selectedRowInComponent:1];
    valueBlue3 = [self.bluePickerView selectedRowInComponent:2];
    valueBlue4 = [self.bluePickerView selectedRowInComponent:3];
    inputKeyBlue = [NSString stringWithFormat:@"%ld%ld%ld%ld", (long)valueBlue1, (long)valueBlue2, (long)valueBlue3, (long)valueBlue4];
    valueRed1 = [self.redPickerView selectedRowInComponent:0];
    valueRed2 = [self.redPickerView selectedRowInComponent:1];
    valueRed3 = [self.redPickerView selectedRowInComponent:2];
    valueRed4 = [self.redPickerView selectedRowInComponent:3];
    inputKeyRed = [NSString stringWithFormat:@"%ld%ld%ld%ld", (long)valueRed1, (long)valueRed2, (long)valueRed3, (long)valueRed4];
    valueGreen1 = [self.greenPickerView selectedRowInComponent:0];
    valueGreen2 = [self.greenPickerView selectedRowInComponent:1];
    valueGreen3 = [self.greenPickerView selectedRowInComponent:2];
    valueGreen4 = [self.greenPickerView selectedRowInComponent:3];
    inputKeyGreen = [NSString stringWithFormat:@"%ld%ld%ld%ld", (long)valueGreen1, (long)valueGreen2, (long)valueGreen3, (long)valueGreen4];
    
    //as posições correctas de cada cor para a chave certa
    inputLevelKey =[NSString stringWithFormat:@"%ld%ld%ld%ld", (long)valueRed2, (long)valueGreen3, (long)valueBlue4, (long)valueYellow4];
    //converter para inteiro cada chave para comparar com numeros
    keyYellow = [inputKeyYellow integerValue];
    keyBlue = [inputKeyBlue integerValue];
    keyRed = [inputKeyRed integerValue];
    keyGreen = [inputKeyGreen integerValue];
    
}
//quando se erra fica vermelho um tempo e passa para normal
-(void)checkButtonToNormal:(UIButton*)checkButton{
    [checkButton setImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
}
//fazer desaparecer a cor (para caso acerteno código)
-(void) fadeOutImage:(UIImageView*)image{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:4.0];
    [image setAlpha:0];
    [UIImageView commitAnimations];
}
- (IBAction)yellowButton:(id)sender {
    if(valueYellow2+valueYellow4 == 10-valueYellow1 && 10-valueYellow1 == valueYellow3*3){
        [self.imageYellowButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self fadeOutImage:self.yellowImageView];
        //bloquear "cadeado" após acertar
        [self.yellowPickerView setUserInteractionEnabled:NO];
        [self.yellowPickerView setAlpha:.6];
        if (!yellowCompleted){
            AudioServicesPlaySystemSound(woodSound);
        }
        yellowCompleted = YES;
    } else {
        [self.imageYellowButton setImage:[UIImage imageNamed:@"buttonRed"] forState:UIControlStateNormal];
        [self performSelector:@selector(checkButtonToNormal:) withObject:self.imageYellowButton afterDelay:2.0];
        AudioServicesPlaySystemSound(errorSound);
    }
}
- (IBAction)blueButton:(id)sender {
    [self.imageBlueButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
    [self fadeOutImage:self.blueImageView];
    [self.bluePickerView setUserInteractionEnabled:NO];
    [self.bluePickerView setAlpha:.6];
    if (!blueCompleted){
        AudioServicesPlaySystemSound(woodSound);
    }
    blueCompleted = YES;
}
- (IBAction)redButton:(id)sender {
    if(keyRed > 959 && keyRed < 6722){
        [self.imageRedButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self fadeOutImage:self.redImageView];
        [self.redPickerView setUserInteractionEnabled:NO];
        [self.redPickerView setAlpha:.6];
        if (!redCompleted){
            AudioServicesPlaySystemSound(woodSound);
        }
        redCompleted = YES;
    }else {
        [self.imageRedButton setImage:[UIImage imageNamed:@"buttonRed"] forState:UIControlStateNormal];
        [self performSelector:@selector(checkButtonToNormal:) withObject:self.imageRedButton afterDelay:2.0];
        AudioServicesPlaySystemSound(errorSound);
    }
}
- (IBAction)greenButton:(id)sender {
    if(valueGreen2 == 27 - valueGreen1 - valueGreen4 && valueGreen2 == valueGreen3 + 4){
        [self.imageGreenButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self fadeOutImage:self.greenImageView];
        //bloquear "cadeado" após acertar
        [self.greenPickerView setUserInteractionEnabled:NO];
        [self.greenPickerView setAlpha:.6];
        if (!greenCompleted){
            AudioServicesPlaySystemSound(woodSound);
        }
        greenCompleted = YES;
    } else {
        [self.imageGreenButton setImage:[UIImage imageNamed:@"buttonRed"] forState:UIControlStateNormal];
        [self performSelector:@selector(checkButtonToNormal:) withObject:self.imageGreenButton afterDelay:2.0];
        AudioServicesPlaySystemSound(errorSound);
    }
}
//Botão de validação voltar ao normal (quando erra no código).
-(void)checkButtonToNormal{
    [self.checkImageButton setImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
}
//Mensagem após completar o nivel
-(void)winnerMessage{
    NSString *title = @"Well Done!";
    NSString *message = @"You really unclocked everything!!! \n You also unlocked a new hero. Check your achievements!";
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
    NSString *message = @"Unclock, unclock and keep unlocking...";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
    
}

//Animação após concluir nivel
-(void)endLevelAnimation{
    [self.heroImageView setImage:[UIImage imageNamed:@"speed"]];
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
    if(self.pickerViewInfo.inputKey == inputLevelKey && yellowCompleted && blueCompleted && redCompleted && greenCompleted){
        [self.checkImageButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self endLevelAnimation];
        [self.levelsModelManager insertWithLevelId:12 levelCompleted:YES];
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
