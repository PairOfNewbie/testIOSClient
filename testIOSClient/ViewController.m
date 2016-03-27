//
//  ViewController.m
//  testIOSClient
//
//  Created by DaiFengyi on 16/3/27.
//  Copyright © 2016年 davidear. All rights

//#define kWYNetworkBaseURLStr @"http://112.74.106.192:2345"
#define kStyleGet @"http://webapp.styleai.cn/"
#import "ViewController.h"
#import "WYNetwork.h"
@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UITextView *returnTextView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [WYNetwork startEngine];

}

- (IBAction)StartWebRequest:(UIButton *)sender {
    [[WYNetwork sharedWYNetwork] HttpGet:@"" parameter:nil success:^(id responseObject) {
        NSLog(@"success");
    } failure:^(NSError *error) {
        NSLog(@"failure is %@", error.description);
    }];
    
    
}

- (IBAction)startCorrectRequest:(UIButton *)sender {
    [[WYNetwork sharedWYNetwork] HttpGet:@"http://c.m.163.com/nc/article/list/T1348647853363/0-20.html" parameter:nil success:^(id responseObject) {
        NSLog(@"success");
    } failure:^(NSError *error) {
        NSLog(@"failure is %@", error.description);
    }];
}
#pragma mark - UITextViewDelegate
@end
