//
//  uponReceipt.m
//  Private
//
//  Created by Surapon Thongnen on 2/17/2558 BE.
//  Copyright (c) 2558 Surapon Thongnen. All rights reserved.
//

#import "uponReceipt.h"
#import "Config.h"

@interface uponReceipt ()
{
    NSString *get1;
    NSString *get2;
    NSString *get3;
    NSString *get4;
    
    NSString *amount1;
    NSString *amount2;
    NSString *amount3;
    NSString *amount4;
}

@end

@implementation uponReceipt

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Number Format 10,000
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSData *jsonData1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL@"apiTbRevenue.php"]];
    id jsonObjects1 = [NSJSONSerialization JSONObjectWithData:jsonData1 options:NSJSONReadingMutableContainers error:nil];
    
    amount1 = [jsonObjects1 objectForKey:@"amount1"];
    amount2 = [jsonObjects1 objectForKey:@"amount2"];
    amount3 = [jsonObjects1 objectForKey:@"amount3"];
    amount4 = [jsonObjects1 objectForKey:@"amount4"];
    
    //convert string to int
    NSInteger intAmount1  = [amount1 integerValue];
    NSInteger intAmount2  = [amount2 integerValue];
    NSInteger intAmount3  = [amount3 integerValue];
    NSInteger intAmount4  = [amount4 integerValue];
    
    // [sender setTitle:@"Hello" forState:UIControlStateNormal]; //
    [btn1 setTitle:[formatter stringFromNumber:[NSNumber numberWithInteger:intAmount1]] forState:UIControlStateNormal];
    [btn2 setTitle:[formatter stringFromNumber:[NSNumber numberWithInteger:intAmount2]] forState:UIControlStateNormal];
    [btn3 setTitle:[formatter stringFromNumber:[NSNumber numberWithInteger:intAmount3]] forState:UIControlStateNormal];
    [btn4 setTitle:[formatter stringFromNumber:[NSNumber numberWithInteger:intAmount4]] forState:UIControlStateNormal];
    
    // ################################ //
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL@"apiGetMoney.php"]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    get1 = [jsonObjects objectForKey:@"get1"];
    get2 = [jsonObjects objectForKey:@"get2"];
    get3 = [jsonObjects objectForKey:@"get3"];
    get4 = [jsonObjects objectForKey:@"get4"];
    
    NSInteger intGet1  = [get1 integerValue];
    NSInteger intGet2  = [get2 integerValue];
    NSInteger intGet3  = [get3 integerValue];
    NSInteger intGet4  = [get4 integerValue];
    
    if (intGet1 > 0) {
        [btn1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }else{
        [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    if (intGet2 > 0) {
        [btn2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }else{
        [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    if (intGet3 > 0) {
        [btn3 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }else{
        [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    if (intGet4 > 0) {
        [btn4 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }else{
        [btn4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }

}


- (IBAction)nong1:(id)sender {
    
    NSLog(@"btn=nong1&amount=%@",get1);
    
    NSString *post =[NSString stringWithFormat:@"btn=nong1&amount=%@",amount1];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL@"ajaxAddMoney2.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *str=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    
    lblRes.text=str;
    
    [self viewDidLoad];
    
}

- (IBAction)nong2:(id)sender {
    NSLog(@"btn=nong2&amount=%@",get2);
    
    NSString *post =[NSString stringWithFormat:@"btn=nong2&amount=%@",amount2];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL@"ajaxAddMoney2.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *str=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    
    lblRes.text=str;
    
    [self viewDidLoad];
}
- (IBAction)nong3:(id)sender {
    NSLog(@"btn=nong3&amount=%@",get3);
    
    NSString *post =[NSString stringWithFormat:@"btn=nong3&amount=%@",amount3];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL@"ajaxAddMoney2.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *str=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    
    lblRes.text=str;
    
    [self viewDidLoad];
}
- (IBAction)nong4:(id)sender {
    NSLog(@"btn=nong4&amount=%@",get4);
    
    NSString *post =[NSString stringWithFormat:@"btn=nong4&amount=%@",amount4];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL@"ajaxAddMoney2.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *str=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    
    lblRes.text=str;
    
    [self viewDidLoad];
}




- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
