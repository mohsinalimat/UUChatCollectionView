//
//  ViewController.m
//  UUChatCollectionView
//
//  Created by zhangyu on 15/7/5.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "ViewController.h"
#import "UUChatViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"touches";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - life cycle

- (void)configUI{
    
}

- (void)updateConstraint{
    
}

#pragma mark - Delegate

#pragma mark - Custom Deledate

#pragma mark - Event Response

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.navigationController pushViewController:UUChatViewController.new animated:YES];
}

#pragma mark - Public Methods




#pragma mark - Private Methods

#pragma mark - Getters And Setters

@end
