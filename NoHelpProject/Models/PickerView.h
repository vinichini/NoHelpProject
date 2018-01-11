//
//  PickerView.h
//  NoHelpProject
//
//  Created by Tiago Vinagre on 28/12/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PickerView : NSObject<UIPickerViewDataSource, UIPickerViewDelegate>{
    NSArray *pickerWheel;
    NSInteger value1;
    NSInteger value2;
    NSInteger value3;
    NSInteger value4;
 
}
@property(weak, nonatomic) NSString *inputKey;

@end
