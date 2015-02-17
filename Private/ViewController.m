//
//  ViewController.m
//  Private
//
//  Created by Surapon Thongnen on 2/2/2558 BE.
//  Copyright (c) 2558 Surapon Thongnen. All rights reserved.
//

#import "ViewController.h"
#import "HomeBord.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
          
    [NSTimer scheduledTimerWithTimeInterval:3.0
                                     target:self
                                   selector:@selector(NextTo)
                                   userInfo:nil
                                    repeats:NO];
    
}

- (void)NextTo{
    
    NSLog(@"method Nexto");
    
    HomeBord *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeBord"];
    detail.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController pushViewController:detail animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
