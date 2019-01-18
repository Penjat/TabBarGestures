//
//  RotateViewController.m
//  TabBarGestures
//
//  Created by Spencer Symington on 2019-01-17.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewToMove;

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Rotate controller loaded");
}

- (IBAction)rotate:(UIRotationGestureRecognizer*)sender {
    sender.view.transform = CGAffineTransformMakeRotation(sender.rotation);
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
