//
//  UsersDefaultViewController.m
//  iOS_TransferValue_Demo
//
//  Created by TOMO on 16/6/28.
//  Copyright © 2016年 TOMO. All rights reserved.
//

#import "UsersDefaultViewController.h"

@interface UsersDefaultViewController ()

@property(nonatomic,strong)UITextField *textField;

@end

@implementation UsersDefaultViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    self.navigationItem.title = @"UserDefault_传值";
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self createTextField];
    [self createButton];
}
- (void)createTextField
{
    CGFloat x = 10.0f;
    CGFloat y = 150.0f;
    CGFloat height = 100.0f;
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(x, y, self.view.frame.size.width-2*x, height)];
    self.textField.placeholder = @"UserDefault_传值";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.adjustsFontSizeToFitWidth =YES;
    [self.textField becomeFirstResponder];
    
    self.textField.leftViewMode = UITextFieldViewModeWhileEditing;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.backgroundColor = [UIColor grayColor];
    [self.textField setTextColor:[UIColor purpleColor]];
    self.textField.layer.borderWidth = 2.0;//边框画线
    self.textField.layer.cornerRadius = 8.0;
    self.textField.layer.masksToBounds = YES;
    
    //属性传值赋值
    self.textField.text = self.contentText;
    [self.view addSubview:self.textField];
    
}

-(void)createButton
{
    CGFloat width = 200.0f;
    CGFloat y = 400.0f;
    CGFloat height = 50.0f;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-width)/2, y, width, height)];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleShadowColor:[UIColor purpleColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 8.0;
    
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}

- (void)back:(UIButton *)sender
{
    //NSUserDefaults可以用来存储持久化数据，因此也可以用来传值。
    //使用这种方式存储的数据会永久存储在本地文件中。因为这是一种数据持久化的方式，只是正好可以用来传值。
    [[NSUserDefaults standardUserDefaults]setObject:self.textField.text forKey:@"content"];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
