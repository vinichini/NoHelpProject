//
//  LevelTenViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 15/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "LevelTenViewController.h"
#import "LevelsModelManager.h"
#import "DocumentManager.h"

@interface LevelTenViewController ()
@property (nonatomic) LevelsModelManager *levelsModelManager;

@end

@implementation LevelTenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelsModelManager = [[LevelsModelManager alloc] initWithContext:[DocumentManager context]];
    self.pickerViewInfo = [[PickerView alloc]init];
    self.codePickerView.dataSource = self.pickerViewInfo;
    self.codePickerView.delegate = self.pickerViewInfo;
    imageNumber=1;
    //Para que o button back comece inactivo.
    [self imageCollection];
    self.backButtonOutlet.layer.cornerRadius = 5;
    self.nextButtonOutlet.layer.cornerRadius = 5;
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
- (IBAction)backActionButton:(id)sender {
    imageNumber -= 1;
    [self imageCollection];
}
- (IBAction)nextActionButton:(id)sender {
    imageNumber += 1;
    [self imageCollection];
}
-(void)imageCollection{
    //fazer com que o numero antes da barra varie consoante o numero da imagem
    self.imageNumberLabel.text = [NSString stringWithFormat:@"%i/7", imageNumber];
    //corresponder a imagem ao nome da mesma alterando o seu numero final que muda sequencialmente em todas
    self.imagesImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%i", imageNumber]];
    //desactivar os botões ao chegar aos limites 1 e 7
    if (imageNumber == 1){
        self.backButtonOutlet.enabled = NO;
        self.backButtonOutlet.alpha = 0.5;
    } else if (imageNumber == 7){
        self.nextButtonOutlet.enabled = NO;
        self.nextButtonOutlet.alpha = 0.5;
    } else {
        self.backButtonOutlet.enabled = YES;
        self.nextButtonOutlet.enabled = YES;
        self.backButtonOutlet.alpha = 1.0;
        self.nextButtonOutlet.alpha = 1.0;
    }
}



//Botão de validação voltar ao normal (quando erra no código).
-(void)checkButtonToNormal{
    [self.checkImageButton setImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
}
//Mensagem após completar o nivel
-(void)winnerMessage{
    NSString *title = @"Well Done!";
    NSString *message = @"Enough of playing with images! \n You also unlocked a new hero. Check your achievements!";
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
    NSString *message = @"Mix everything and you''ll get it!";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
//Animação após concluir nivel
-(void)endLevelAnimation{
    [self.heroImageView setImage:[UIImage imageNamed:@"storm"]];
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
    if([self.pickerViewInfo.inputKey isEqualToString: @"5642"]){
        [self.checkImageButton setImage:[UIImage imageNamed:@"buttonGreen"] forState:UIControlStateNormal];
        [self endLevelAnimation];
        [self.levelsModelManager insertWithLevelId:10 levelCompleted:YES];
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
