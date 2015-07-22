//
//  ViewController.m
//  ActionSheet
//
//  Created by Sathish on 21/07/15.
//  Copyright (c) 2015 Optisol Business Solution. All rights reserved.
//

#import "ViewController.h"
#import "secViewController.h"

@interface ViewController ()<UIActionSheetDelegate>
-(void)showActionSheet:(id)sender;

@end

@implementation ViewController

{
    secViewController *obj;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 186.0f, 280.0f, 88.0f);
    [button setTitle:@"Press me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.tintColor = [UIColor darkGrayColor];
    [button addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
   

}
-(void)showActionSheet:(id)sender
{
    NSString *actionSheetTitle = @"Model";
    NSString *changeBackground= @"color";
    NSString *goToNextView = @"nextView";
    NSString *cancelTitle = @"Cancel Button";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:changeBackground, goToNextView, nil];
    
    [actionSheet showInView:self.view];
}
    - (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
   
    if ([buttonTitle isEqualToString:@"color"])
    {
        self.view.backgroundColor=[UIColor redColor];
    }
    else if([buttonTitle isEqualToString:@"nextView"])
    {
         obj=[self.storyboard instantiateViewControllerWithIdentifier:@"secViewController"];
        obj.title=@"welcome";
        [self.navigationController pushViewController:obj animated:YES];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
