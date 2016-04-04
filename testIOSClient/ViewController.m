//
//  ViewController.m
//  testIOSClient
//
//  Created by DaiFengyi on 16/3/27.
//  Copyright © 2016年 davidear. All rights
#import "ViewController.h"
#import "WYNetwork.h"
#import "WYtool.h"
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
    if (self.urlField.text.length == 0) {
        [WYTool showMsg:@"url can not be empty"];
        return;
    }
    [WYTool showLoading];
    [[WYNetwork sharedWYNetwork] HttpGet:self.urlField.text parameter:nil success:^(id responseObject) {
        [WYTool showMsg:@"success"];
        self.returnTextView.text = [self stringFormDictionary:responseObject];
    } failure:^(NSError *error) {
        [WYTool showMsg:@"failure"];
        self.returnTextView.text = error.description;
    }];
    
    
}

- (IBAction)startCorrectRequest:(UIButton *)sender {
    [WYTool showLoading];
    [[WYNetwork sharedWYNetwork] HttpGet:@"http://c.m.163.com/nc/article/list/T1348647853363/0-20.html" parameter:nil success:^(id responseObject) {
        [WYTool showMsg:@"success"];
        self.returnTextView.text = [self stringFormDictionary:responseObject];
    } failure:^(NSError *error) {
        [WYTool showMsg:@"failure"];
        self.returnTextView.text = error.description;
    }];
}
#pragma mark - UITextViewDelegate

#pragma mark - helper
- (NSString *)stringFormDictionary:(NSDictionary *)dic {
    NSData *tempData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];//Json数据
    NSString *jsonStr = [[NSString alloc] initWithData:tempData encoding:NSUTF8StringEncoding];  //Json数据的可视化字符串
    return jsonStr;
}
@end
