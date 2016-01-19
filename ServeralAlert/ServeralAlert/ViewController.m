//
//  ViewController.m
//  ServeralAlert
//
//  Created by Dong on 2016/1/19.
//  Copyright © 2016年 Digiwin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) NSMutableArray *alerts;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _alerts = [[NSMutableArray alloc] init];
    
    [_alerts addObject:[self makeAlert:@"1" message:@"hahh"]];
    [_alerts addObject:[self makeAlert:@"2" message:@"hahh"]];
    [_alerts addObject:[self makeAlert:@"3" message:@"hahh"]];
    [_alerts addObject:[self makeAlert:@"4" message:@"hahh"]];
    [_alerts addObject:[self makeAlert:@"5" message:@"hahh"]];
    
    UIButton *show = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    show.center = self.view.center;
    [show setTitle:@"show" forState:UIControlStateNormal];
    [show setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [show addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:show];
}

- (void) show
{
    [self showAlert:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlert:(BOOL)animated
{
    if (self.alerts.count == 0) return;
    
    UIAlertController *alert = _alerts[0];
    [_alerts removeObjectAtIndex:0];
    [self presentViewController:alert animated:animated completion:nil];
}

- (UIAlertController *)makeAlert:(NSString *)title message:(NSString *)message
{
    // alertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // actiom
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
        [self showAlert:NO];
    }];
    [alertController addAction:ok];
    
    // return
    return alertController;
}

@end
