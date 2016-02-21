//
//  ViewController.m
//  04MytestThread
//
//  Created by linw on 16/2/21.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(mydownload) object:nil];
    thread.name = @"下载进程";
    [thread start];
}

-(void)mydownload{
    NSString *urlStr = @"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg";
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *date = [[NSData alloc]initWithContentsOfURL:url];
    
    [self performSelectorOnMainThread:@selector(mySetView:) withObject:date waitUntilDone:YES];
    
}

-(void)mySetView:(NSData *)imgDate
{
    UIImage *img = [UIImage imageWithData:imgDate];
    self.myimg.image = img;
}
@end
