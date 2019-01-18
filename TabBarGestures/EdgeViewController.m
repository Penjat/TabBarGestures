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

@property (strong ,nonatomic) UIScreenEdgePanGestureRecognizer *edgePan;
@property (strong ,nonatomic) UIPanGestureRecognizer *normPan;

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _menuOpen = NO;
    
    self.edgePan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(panMenu:)];
    [self.edgePan setEdges:UIRectEdgeRight];
    [self.edgeMenu addGestureRecognizer:self.edgePan];
    
    self.normPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMenu:)];
    
    //[self.edgeMenu addGestureRecognizer:self.normPan];
    
    
}


-(void)setMenuOpen:(BOOL)isOpen{
    _menuOpen = isOpen;
    if(isOpen){
        [self.edgeMenu removeGestureRecognizer:self.edgePan];
        [self.edgeMenu addGestureRecognizer:self.normPan];
        
    }else{
        [self.edgeMenu removeGestureRecognizer:self.normPan];
        [self.edgeMenu addGestureRecognizer:self.edgePan];
    }
    
}


- (void)panMenu:(UIScreenEdgePanGestureRecognizer*)sender {
    NSLog(@"menu open = %i ",self.menuOpen);
    //don't use this pan when the menu is open
    
    
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
            [self setMenuOpen:YES];
        }else{
            NSLog(@"menu closes");
            [UIView animateWithDuration:0.7f animations:^{
                self.edgeMenu.frame = CGRectMake(350, 110, 500, 400);
                
            }];
            [self setMenuOpen:NO];
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
