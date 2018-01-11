//
//  HomeViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 30/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
- (IBAction)levelsButton:(id)sender {
    [(UITabBarController *)self.tabBarController setSelectedIndex:1];
}
- (IBAction)achievementsButton:(id)sender {
    [(UITabBarController *)self.tabBarController setSelectedIndex:2];
}
- (IBAction)info:(id)sender {
    [(UITabBarController *)self.tabBarController setSelectedIndex:3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelsOutletButton.layer.cornerRadius = 5;
    self.achievementsOutletButton.layer.cornerRadius = 5;
    self.infoOutletButton.layer.cornerRadius = 5;
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    NSURL *fallingUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"fall" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)fallingUrl, &fallSound);
    [self helpAnimation];
    [self performSelector:@selector(logoAnimation) withObject:nil afterDelay:4.0];
    [self performSelector:@selector(nAnimation) withObject:nil afterDelay:7.0];
    [self performSelector:@selector(soundAnimation) withObject:nil afterDelay:7.4];
    
}
-(void)logoAnimation{
    [self.view layoutIfNeeded];
    //Alterar ao constraints que impedem o movimento correcto
    [self.logoImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"logo"]]];
    self.logoImageViewConstraint.constant = 0;
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
        
    }];
}
-(void)nAnimation{
    [self.view layoutIfNeeded];
    //Alterar ao constraints que impedem o movimento correcto
    [self.nLabel setAlpha:1.0];
    self.nLabelConstraint.constant = 0;
    [UIView animateWithDuration:0.4 animations:^{
        [self.view layoutIfNeeded];
    }];
}
-(void)helpAnimation{
    [UILabel beginAnimations:NULL context:nil];
    [UILabel setAnimationDuration:6.0];
    [self.helpLabel setAlpha:1];
    [UIImageView commitAnimations];
}
-(void)soundAnimation{
    AudioServicesPlaySystemSound(fallSound);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
