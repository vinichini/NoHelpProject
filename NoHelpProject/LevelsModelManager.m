//
//  LevelsModelManager.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 08/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "LevelsModelManager.h"
#import "LevelsModel+CoreDataClass.h"


@interface LevelsModelManager()
@property (nonatomic) NSManagedObjectContext *context;
@end
@implementation LevelsModelManager

-(instancetype)initWithContext:(NSManagedObjectContext*)context {
    self = [super init];
    self.context = context;
    return self;
}


-(void)insertWithLevelId:(int)levelId levelCompleted:(BOOL)levelCompleted {
    // Criamos e inserimos um novo objecto na BD
    LevelsModel *model = [NSEntityDescription insertNewObjectForEntityForName:@"LevelsModel" inManagedObjectContext:self.context];
    model.levelId = levelId;
    model.levelCompleted = levelCompleted;
}
-(void)deleteWithLevelId:(LevelsModel *)levelModal {
    [self.context deleteObject:levelModal];
    
    
    
}


-(NSArray*)fetch {
    // Criamos um NSFetchRequest para podermos obter dados da BD
    // No construtor temos que indicar o nome da entity, neste caso é o "ProductModel"
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"LevelsModel"];
    
    // NSSortDescriptor é usado para ordenar os dados retornadas da BD
    // Neste caso estamos a ordenar pela propriedade "name"
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"levelId" ascending: YES];
    request.sortDescriptors = @[descriptor];
    
    NSError *error;
    // Vamos buscar a BD os dados com as configurações dadas no NSFetchRequest
    NSArray *levels = [self.context executeFetchRequest:request error:&error];
    
    //Verificamos se houve algum erro ao tentar obter os dados
    if (error != nil) {
        NSLog(@"%@", error.localizedDescription);
    }
    
    //Por fim retornamos os dados obtidos
    return levels;
}
@end
