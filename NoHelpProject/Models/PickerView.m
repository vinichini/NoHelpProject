//
//  PickerView.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 28/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "PickerView.h"

@implementation PickerView

-(instancetype)init{
    self = [super init];
    pickerWheel = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    return self;
}
//CÓDIGO CADEADO
// Número de colunas
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
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
    
    NSInteger value1 = [pickerView selectedRowInComponent:0];
    NSInteger value2 = [pickerView selectedRowInComponent:1];
    NSInteger value3 = [pickerView selectedRowInComponent:2];
    NSInteger value4 = [pickerView selectedRowInComponent:3];
    
    //concatenar os 4 valores:
    self.inputKey = [NSString stringWithFormat:@"%ld%ld%ld%ld", (long)value1, (long)value2, (long)value3, (long)value4];
    
}
@end
