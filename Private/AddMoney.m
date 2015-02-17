//
//  addMoney.m
//  Private
//
//  Created by Surapon Thongnen on 2/13/2558 BE.
//  Copyright (c) 2558 Surapon Thongnen. All rights reserved.
//

#import "addMoney.h"
#import "Config.h"

@interface addMoney ()<NSURLConnectionDelegate, UITextFieldDelegate, UITextViewDelegate>
{
    NSMutableData *_responseData;
}
@end

@implementation addMoney

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Activity Indicator View
    [loading setHidden:TRUE];
    
    // Tap Gesture for Hide Keyboard ## HIDDEN KEYBORD and add method hideKeyboard ##
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    
    // GET JSON URL
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL@"apiAddMoney.php"]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    // value in key name
    NSString *amount1 = [jsonObjects objectForKey:@"amount1"];
    NSString *amount2 = [jsonObjects objectForKey:@"amount2"];
    NSString *amount3 = [jsonObjects objectForKey:@"amount3"];
    NSString *amount4 = [jsonObjects objectForKey:@"amount4"];
    
    //Convert string to int
    NSInteger intAmount1  = [amount1 integerValue];
    NSInteger intAmount2  = [amount2 integerValue];
    NSInteger intAmount3  = [amount3 integerValue];
    NSInteger intAmount4  = [amount4 integerValue];
    
    //Number Format 10,000
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    //UILabel
//    lbl1.text=amount1;
//    lbl2.text=amount2;
//    lbl3.text=amount3;
//    lbl4.text=amount4;
    lbl1.text= [formatter stringFromNumber:[NSNumber numberWithInteger:intAmount1]];
    lbl2.text= [formatter stringFromNumber:[NSNumber numberWithInteger:intAmount2]];
    lbl3.text= [formatter stringFromNumber:[NSNumber numberWithInteger:intAmount3]];
    lbl4.text= [formatter stringFromNumber:[NSNumber numberWithInteger:intAmount4]];
    
    //UITextField
//    txt1.text=amount1;
//    txt2.text=amount2;
//    txt3.text=amount3;
//    txt4.text=amount4;
    txt1.text= [formatter stringFromNumber:[NSNumber numberWithInteger:intAmount1]];
    txt2.text= [formatter stringFromNumber:[NSNumber numberWithInteger:intAmount2]];
    txt3.text= [formatter stringFromNumber:[NSNumber numberWithInteger:intAmount3]];
    txt4.text= [formatter stringFromNumber:[NSNumber numberWithInteger:intAmount4]];
    
    //SUM Int ot output string
    // Convert Int to String //
//    lblTotal.text=[NSString stringWithFormat:@"%d", total];
    NSInteger total=intAmount1+intAmount2+intAmount3+intAmount4;
    lblTotal.text= [formatter stringFromNumber:[NSNumber numberWithInteger:total]];

    //Print Log
    NSLog(@"amount1 = %@",amount1);
    NSLog(@"amount2 = %@",amount2);
    NSLog(@"amount3 = %@",amount3);
    NSLog(@"amount4 = %@",amount4);
    NSLog(@"====================");
    
    //hiddenkeybord on submit
    [self.view endEditing:YES];
}

// Event Gesture for Hide Keyboard
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    
    //[Name_UITextField  resignFirstResponder];
    [txt1 resignFirstResponder];
    [txt2 resignFirstResponder];
    [txt3 resignFirstResponder];
    [txt4 resignFirstResponder];
}

- (IBAction)btnSubmit:(id)sender {


    [loading setHidden:FALSE];
    [loading startAnimating];
    
    
    NSString *post =[NSString stringWithFormat:@"getMoney1=%@&getMoney2=%@&getMoney3=%@&getMoney4=%@",[txt1 text],[txt2 text],[txt3 text],[txt4 text]];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL@"ajaxAddMoney.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *str=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    
    //HEML Response
    lblconn.text = str;
    
    //reload ro refresh.
   [self viewDidLoad];
    
    [loading stopAnimating];
    [loading setHidden:TRUE];
    
}
- (IBAction)btnBack:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:Nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
