//
//  AddLocationViewController.m
//  LocationList
//
//  Created by Joffrey Mann on 5/12/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "AddLocationViewController.h"

@interface AddLocationViewController ()

@end

@implementation AddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameField.delegate = self;
    _addressField.delegate = self;
    _descriptionView.delegate = self;
    
    _descriptionView.text = @"Enter description ...";
    _descriptionView.textAlignment = NSTextAlignmentCenter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

/* UITextView Delegate method. This method is triggered when the user types a new character in the textView. */
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    /* Test if the entered text is a return. If it is we tell textView to dismiss the keyboard and then we stop the textView from entering in additional information as text. This is not a perfect solution because users cannot enter returns in their text and if they paste text with a return items after the return will not be added. For the functionality required in this project this solution works just fine. */
    if ([text isEqualToString:@"\n"]){
        [_descriptionView resignFirstResponder];
        return NO;
    }
    else return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    _descriptionView.text = @"";
    _descriptionView.textAlignment = NSTextAlignmentLeft;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addLocationToArray:(id)sender
{
    Location *locationToAdd = [[Location alloc]initWithName:_nameField.text andAddress:_addressField.text andDescription:_descriptionView.text];
    
    if(_delegate != nil)
    {
        [_delegate addLocation:locationToAdd];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backToList:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
