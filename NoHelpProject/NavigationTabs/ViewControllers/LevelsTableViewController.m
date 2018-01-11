//
//  LevelsTableViewController.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 23/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "LevelsTableViewController.h"
#import "LevelsTableViewCell.h"
#import "Level.h"
#import "LevelsModelManager.h"
#import "DocumentManager.h"
#import "LevelsModel+CoreDataProperties.h"

@interface LevelsTableViewController ()
@property (nonatomic) LevelsModelManager *levelsModelManager;

@end

@implementation LevelsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Inicializa a váriavel com o context proveniente do AppDelegate
    self.levelsModelManager = [[LevelsModelManager alloc] initWithContext:[DocumentManager context]];
    
    levelsSegue = @[@"level1Segue", @"level2Segue", @"level3Segue", @"level4Segue", @"level5Segue", @"level6Segue", @"level7Segue", @"level8Segue", @"level9Segue", @"level10Segue", @"level11Segue", @"level12Segue"];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self checkCompleted];
}

-(void)checkCompleted {
    levelsMenuArray = [Level levelsUnlockedArray];
    NSArray *completedLevels = [self.levelsModelManager fetch];
    
    for (LevelsModel *savedLevel in completedLevels) {
        Level *level = levelsMenuArray[savedLevel.levelId - 1];
        level.completedLevel = YES;
    }
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return levelsMenuArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LevelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LevelCell" forIndexPath:indexPath];
    Level *level = levelsMenuArray[indexPath.row];
    // Configure the cell...
    cell.levelCellLabel.text = level.nameLevel;
    [cell.levelCellImageView setHidden:!level.completedLevel];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    // space between cells
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [UIView new];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier: levelsSegue[indexPath.row] sender: self];
}
-(UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIContextualAction *addAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"Remove Score" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSArray *completedLevels = [self.levelsModelManager fetch];
        
        for (LevelsModel *savedModels in completedLevels) {
            if (indexPath.row == savedModels.levelId - 1) {
                [self.levelsModelManager deleteWithLevelId:savedModels];
            }
        }
        [self checkCompleted];
    }];
    
    return [UISwipeActionsConfiguration configurationWithActions:@[addAction]];
}

@end
