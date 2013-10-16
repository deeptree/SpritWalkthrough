//
//  SpriteViewController.m
//  SpriteWalkthrough
//
//  Created by deeptree on 2013/10/16.
//  Copyright (c) 2013年 deeptree. All rights reserved.
//

#import "SpriteViewController.h"


@interface SpriteViewController ()

@end

@implementation SpriteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SKView *spritView = (SKView*) self.view;
    spritView.showsDrawCount = YES;
    spritView.showsNodeCount = YES;
    spritView.showsFPS = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
