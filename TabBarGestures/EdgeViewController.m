//
//  EdgeViewController.m
//  TabBarGestures
//
//  Created by Spencer Symington on 2019-01-17.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()
@property (weak, nonatomic) IBOutlet UIView *edgeMenu;
@property BOOL menuOpen;
@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _menuOpen = NO;
}
- (IBAction)panNormal:(id)sender {
    
}
- (IBAction)panOnEdge:(UIScreenEdgePanGestureRecognizer*)sender {
    
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x +translationInView.x, oldCenter.y );
    if(sender.state == UIGestureRecognizerStateBegan){
        self.edgeMenu.backgroundColor =UIColor.grayColor;
    }
    if(sender.state == UIGestureRecognizerStateEnded){
        NSLog(@"ending pan");
        self.edgeMenu.backgroundColor =UIColor.whiteColor;
        if(newCenter.x < 400){
            NSLog(@"menu stays open");
            [UIView animateWithDuration:0.7f animations:^{
                self.edgeMenu.frame = CGRectMake(20, 110, 500, 400);
                
            }];
        }else{
            NSLog(@"menu closes");
            [UIView animateWithDuration:0.7f animations:^{
                self.edgeMenu.frame = CGRectMake(350, 110, 500, 400);
                
            }];
        }
        return;
    }
    if(newCenter.x < 300){
        newCenter = CGPointMake(300, oldCenter.y );
    }
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
    NSLog(@"new x is %f" , newCenter.x);
    
    
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
