//
//  AddLocationViewController.h
//  LocationList
//
//  Created by Joffrey Mann on 5/12/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddLocationDelegate.h"

@interface AddLocationViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) id <AddLocationDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *addressField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionView;

- (IBAction)addLocationToArray:(id)sender;
- (IBAction)backToList:(id)sender;
@end
