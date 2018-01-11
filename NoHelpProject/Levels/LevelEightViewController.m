//
//  LevelEightViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 05/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "LevelEightViewController.h"
#import "LevelsModelManager.h"
#import "DocumentManager.h"

@interface LevelEightViewController ()
@property (nonatomic) LevelsModelManager *levelsModelManager;

@end

@implementation LevelEightViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelsModelManager = [[LevelsModelManager alloc] initWithContext:[DocumentManager context]];
    self.pickerViewInfo = [[PickerView alloc]init];
    self.codePickerView.dataSource = self.pickerViewInfo;
    self.codePickerView.delegate = self.pickerViewInfo;
    [self changeLightsColor];
    [self checkIfAllLightsGreen];
    NSURL *unlockingUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"openingStone" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)unlockingUrl, &unlockingSound);
    NSURL *errorUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"error" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)errorUrl, &errorSound);
    NSURL *successUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"success" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)successUrl, &successSound);
}
-(void)changeLightsColor{
    for (UILabel *label in self.lightsLabel) {
        if ([label.text isEqualToString:@"ON"]) {
            label.backgroundColor = [UIColor greenColor];
        }
        else if([label.text isEqualToString:@"OFF"]) {
            label.backgroundColor = [UIColor redColor];
        }
    }
}
-(void)togglePowerLight:(UILabel*)light{
    if ([light.text isEqualToString:@"ON"]) {
        light.text = @"OFF";
    }
    else if([light.text isEqualToString:@"OFF"]) {
        light.text = @"ON";
    }
    
}
-(void)toggleSwitch:(UIButton*)switchLever{
    if ([switchLever.currentImage isEqual:[UIImage imageNamed:@"switchLeverOff"]]){
        [switchLever setImage:[UIImage imageNamed:@"switchLeverOn"] forState:UIControlStateNormal];
    }
    else {
        [switchLever setImage:[UIImage imageNamed:@"switchLeverOff"] forState:UIControlStateNormal];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)firstSwitch:(id)sender {
    [self togglePowerLight:self.lightsLabel[0]];
    [self togglePowerLight:self.lightsLabel[5]];
    [self toggleSwitch:self.switch1Button];
    [self changeLightsColor];
    [self checkIfAllLightsGreen];
}
- (IBAction)secondSwitch:(id)sender {
    [self togglePowerLight:self.lightsLabel[3]];
    [self togglePowerLight:self.lightsLabel[4]];
    [self toggleSwitch:self.switch2Button];
    [self changeLightsColor];
    [self checkIfAllLightsGreen];
}
- (IBAction)thirdSwitch:(id)sender {
    [self togglePowerLight:self.lightsLabel[0]];
    [self togglePowerLight:self.lightsLabel[2]];
    [self togglePowerLight:self.lightsLabel[4]];
    [self toggleSwitch:self.switch3Button];
    [self changeLightsColor];
    [self checkIfAllLightsGreen];
}
- (IBAction)fourthSwitch:(id)sender {
    [self togglePowerLight:self.lightsLabel[1]];
    [self togglePowerLight:self.lightsLabel[3]];
    [self toggleSwitch:self.switch4Button];
    [self changeLightsColor];
    [self checkIfAllLightsGreen];
}
- (IBAction)fifthSwitch:(id)sender {
    [self togglePowerLight:self.lightsLabel[0]];
    [self togglePowerLight:self.lightsLabel[2]];
    [self toggleSwitch:self.switch5Button];
    [self changeLightsColor];
    [self checkIfAllLightsGreen];
}
- (IBAction)sixthSwitch:(id)sender {
    [self togglePowerLight:self.lightsLabel[1]];
    [self togglePowerLight:self.lightsLabel[5]];
    [self toggleSwitch:self.switch6Button];
    [self changeLightsColor];
    [self checkIfAllLightsGreen];
}

-(void)checkIfAllLightsGreen {
    //Utilizar a propriedade text para concatenar o array da labelCollection
    NSString *concactenateLights = [[self.lightsLabel valueForKey:@"text"]
                                    componentsJoinedByString:@""];
    if ([concactenateLights isEqualToString:@"ONONONONONON"])  {
        self.lightOffImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lightsOn"]];
    }
    else{
        self.lightOffImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lightsOff"]];
    }
}
//Botão de validação voltar ao normal (quando erra no código).
-(void)checkButtonToNormal{
    [self.checkImageButton setImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
}
//Mensagem após completar o nivel
-(void)winnerMessage{
    NSString *title = @"Well Done!";
    NSString *message = @"And all turned clear now...\n You also unlocked a new hero. Check your achievements!";
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
    NSString *message = @"There may be some kind of code somewhere...";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
//Animação após concluir nivel
-(void)endLevelAnimation{
    [self.heroImageView setImage:[UIImage imageNamed:@"thanos"]];
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
    if([self.pickerViewInfo.inputKey isEqualToString: @"2531"]){
        [self.checkImageButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self endLevelAnimation];
        [self.levelsModelManager insertWithLevelId:8 levelCompleted:YES];
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
