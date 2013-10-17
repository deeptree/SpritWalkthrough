//
//  SpriteViewController.m
//  SpriteWalkthrough
//
//  Created by deeptree on 2013/10/16.
//  Copyright (c) 2013年 deeptree. All rights reserved.
//

#import "SpriteViewController.h"
#import "HelloScene.h"

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

- (void)viewWillAppear:(BOOL)animated
{

    HelloScene *hello = [[HelloScene alloc] initWithSize:CGSizeMake(768, 1024)];
    SKView *spriteView = (SKView*) self.view;
    [spriteView presentScene:hello];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
