//
//  SwipViewController.m
//  TabBarGestures
//
//  Created by Spencer Symington on 2019-01-17.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "SwipViewController.h"

@interface SwipViewController ()
@property (weak, nonatomic) IBOutlet UIView *swipeView;

@end

@implementation SwipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipeRecognizerR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRightOnView:)];
    swipeRecognizerR.direction = UISwipeGestureRecognizerDirectionRight;
    [_swipeView addGestureRecognizer:swipeRecognizerR];
    
    UISwipeGestureRecognizer *swipeRecognizerL = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeftOnView:)];
    swipeRecognizerL.direction = UISwipeGestureRecognizerDirectionLeft;
    [_swipeView addGestureRecognizer:swipeRecognizerL];
}

-(void)swipeRightOnView:(UIPinchGestureRecognizer*)sender{
    NSLog(@"swiped right");
    [UIView animateWithDuration:0.7f animations:^{
        self.swipeView.frame = CGRectMake(0, 0, 326, 68);
        
    }];
}
-(void)swipeLeftOnView:(UIPinchGestureRecognizer*)sender{
    NSLog(@"swiped left");
    [UIView animateWithDuration:0.7f animations:^{
        self.swipeView.frame = CGRectMake(0, 0, 100, 68);
        
    }];
    
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
