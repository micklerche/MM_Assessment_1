//
//  Ass1HomeViewController.m
//  MM_Assessment_1
//
//  Created by Mick Lerche on 3/13/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "Ass1HomeViewController.h"
#import "Ass1WebViewController.h"

@interface Ass1HomeViewController ()
@property (strong, nonatomic) IBOutlet UITextField *valueOne;
@property (strong, nonatomic) IBOutlet UITextField *valueTwo;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *webButton;

@property NSString *calculatedValueString;

@end

@implementation Ass1HomeViewController

#pragma view items
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma IBActions items
- (IBAction)onCalculateButtonPressed:(id)sender {
    if (![self.valueOne.text isEqualToString:@""] && ![self.valueTwo.text isEqualToString:@""]) {
        int calculatedValue = [self.valueOne.text intValue] * [self.valueTwo.text intValue];
        self.calculatedValueString = [NSString stringWithFormat:@"%i", calculatedValue];
        self.navigationItem.title = self.calculatedValueString;
        self.webButton.enabled = (calculatedValue % 5 == 0 ? YES : NO);
        [self.view endEditing:YES];
    } else {
        self.navigationItem.title = @"Value Missing";
        self.webButton.enabled = NO;
    }
}


#pragma segue items
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    Ass1WebViewController *vc = segue.destinationViewController;
    vc.calculatedValue = self.calculatedValueString;

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"Back", returnbuttontitle)
                                                                  style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}










@end
