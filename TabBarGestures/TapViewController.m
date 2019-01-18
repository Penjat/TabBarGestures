//
//  TapViewController.m
//  TabBarGestures
//
//  Created by Spencer Symington on 2019-01-17.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()
@property (weak, nonatomic) IBOutlet UIView *colorChangeView;

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeRectColor)];
    [_colorChangeView addGestureRecognizer:tapGestureRecognizer];
}

-(void)changeRectColor{
    NSLog(@"should change color");
    NSArray *colorArray = @[UIColor.greenColor,UIColor.redColor,UIColor.brownColor,UIColor.blueColor,UIColor.grayColor,UIColor.whiteColor];
    
    _colorChangeView.backgroundColor = colorArray[arc4random_uniform(colorArray.count)];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
