//
//  ViewController.m
//  JumpExample
//
//  Created by V Veerabagu Subramanian on 12/08/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+jump.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [myButton jump:2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
