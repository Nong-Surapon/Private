//
//  HomeBord.m
//  Private
//
//  Created by Surapon Thongnen on 2/2/2558 BE.
//  Copyright (c) 2558 Surapon Thongnen. All rights reserved.
//

#import "HomeBord.h"
#import "addMoney.h"
#import "uponReceipt.h"

@interface HomeBord ()

@end

@implementation HomeBord

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addMoney:(id)sender {
//    addMoney *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"addMoney"];
//    detail.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self.navigationController pushViewController:detail animated:NO];
    
    addMoney *viewAcc = [self.storyboard instantiateViewControllerWithIdentifier:@"addMoney"];
    [self.navigationController presentViewController:viewAcc animated:YES completion:Nil];

}
- (IBAction)upon:(id)sender {
    uponReceipt *viewAcc = [self.storyboard instantiateViewControllerWithIdentifier:@"uponReceipt"];
    [self.navigationController pushViewController:viewAcc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
