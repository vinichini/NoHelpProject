//
//  LevelSevenViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 25/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "LevelSevenViewController.h"
#import "LevelsModelManager.h"
#import "DocumentManager.h"

@interface LevelSevenViewController ()
@property (nonatomic) LevelsModelManager *levelsModelManager;

@end

@implementation LevelSevenViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelsModelManager = [[LevelsModelManager alloc] initWithContext:[DocumentManager context]];
    self.pickerViewInfo = [[PickerView alloc]init];
    self.codePickerView.dataSource = self.pickerViewInfo;
    self.codePickerView.delegate = self.pickerViewInfo;
    //Definir o tempo inicial e introduzi-lo na label
    timerCount = 30;
    timer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    NSURL *soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"whistle" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundUrl, &whistelSound);
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
//voltar a mostrar a mensagem inicial (depois de ver a mensagem clicada por uns segundos)
-(void)changeOrderToNormal{
    self.orderLabel.text = @"Please Wait Quietly";
}
- (IBAction)callBusButton:(id)sender {
    
    [self touched];
    self.orderLabel.text = @"Hey!!! Bus!!";
    [self performSelector:@selector(changeOrderToNormal) withObject:nil afterDelay:4.0];
    
}
- (IBAction)whistleButton:(id)sender {
    [self touched];
    AudioServicesPlaySystemSound(whistelSound);
}
//método para voltar ao inicio (30) se algum touch for feito.
-(void)touched {
    //fazer um reset ao timer para que não reinicie o timer de inicio assim como novo eventual touch evitando sobreposições
    [timer invalidate];
    timerCount = 30;
    self.timerLabel.text = [NSString stringWithFormat:@"%i", timerCount];
    timer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
}

-(void)updateTimer{
    timerCount -= 10;
    self.timerLabel.text = [NSString stringWithFormat:@"%i", timerCount];
    if(timerCount == 0){
        [timer invalidate];
        [self moveBus];
        
    }
    
}
-(void)moveBus{
    [self.view layoutIfNeeded];
    //Alterar ao constraints que impedem o movimento correcto
    [self.busImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bus"]]];
    self.busImageViewConstraint.constant = 10;
    [UIView animateWithDuration:3 animations:^{
        [self.view layoutIfNeeded];
    }];
}


//Botão de validação voltar ao normal (quando erra no código).
-(void)checkButtonToNormal{
    [self.checkImageButton setImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
}
//Mensagem após completar o nivel
-(void)winnerMessage{
    NSString *title = @"Well Done!";
    NSString *message = @"Congratulations for...doing nothing?!?\n You also unlocked a new hero. Check your achievements!";
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
    NSString *message = @"Maybe it's better to walk...";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
//Animação após concluir nivel
-(void)endLevelAnimation{
    [self.heroImageView setImage:[UIImage imageNamed:@"ironMan"]];
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
    if([self.pickerViewInfo.inputKey isEqualToString: @"7132"]){
        [self.checkImageButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self endLevelAnimation];
        [self.levelsModelManager insertWithLevelId:7 levelCompleted:YES];
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
