//
//  ViewController.m
//  GCD
//
//  Created by Prashanna Raghavan on 8/6/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self start];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)start
{
    dispatch_queue_attr_t qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_CONCURRENT, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t queue = dispatch_queue_create("queue",qos);
    
    dispatch_async(queue, ^{
        for (int i=1; i<=10; i++) {
            NSLog(@"Queue : %d",i);
        }
    });
    
    for (int j=1; j<=10; j++) {
        NSLog(@"Normal : %d",j);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
