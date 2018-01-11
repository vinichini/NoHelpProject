//
//  AchievementsCollectionViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 30/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "AchievementsCollectionViewController.h"
#import "AchievementsCollectionViewCell.h"
#import "Achievements.h"
#import "LevelsModelManager.h"
#import "DocumentManager.h"
#import "LevelsModel+CoreDataProperties.h"
#import "HeroDetailsViewController.h"
#import "Hero.h"

@interface AchievementsCollectionViewController ()
@property (nonatomic) LevelsModelManager *levelsModelManager;

@end

@implementation AchievementsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Inicializa a váriavel com o context proveniente do AppDelegate
    self.levelsModelManager = [[LevelsModelManager alloc] initWithContext:[DocumentManager context]];
    
    achievementsMenuArray = [Achievements achievementsUnlockedArray];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self checkCompleted];
}

-(void)checkCompleted {
    NSArray *completedAchievements = [self.levelsModelManager fetch];
    
    for (LevelsModel *savedAchievement in completedAchievements) {
        Achievements *achievement = achievementsMenuArray[savedAchievement.levelId - 1];
        achievement.completed = YES;
    }
    
    [self.collectionView reloadData];
}
//Métodos do delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//numero de items corresponde ao numero de itens no array
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return achievementsMenuArray.count;
}
-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AchievementsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"heroCell" forIndexPath:indexPath];
    Achievements *achievements = achievementsMenuArray[indexPath.row];
    //adicionar info à cell
    
    
    if (achievements.completed){
        cell.heroImageView.image = [UIImage imageNamed:achievements.imageHero];
        cell.heroLabel.text = achievements.nameHero;
    } else {
        cell.heroImageView.image = [UIImage imageNamed:@"hero"];
        cell.heroLabel.text = @"";
    }
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Achievements *achievement = achievementsMenuArray[indexPath.row];
    if(achievement.completed){
        HeroDetailsViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HeroDetailsIdentifier"];
        viewController.achievement = achievement;
        [self.navigationController pushViewController:viewController animated:true];
    }
}


@end
