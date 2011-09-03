//
//  BoardPlaceViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoardPlaceViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *carta_01;
@property (nonatomic, strong) IBOutlet UIButton *carta_02;
@property (nonatomic, strong) IBOutlet UIButton *carta_03;
@property (nonatomic, strong) IBOutlet UIButton *carta_04;

-(IBAction)select_card:(id)sender;

@end
