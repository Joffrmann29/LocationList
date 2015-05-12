//
//  AddLocationViewController.h
//  LocationList
//
//  Created by Joffrey Mann on 5/12/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddLocationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *addressField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionView;

- (IBAction)addLocationToArray:(id)sender;
- (IBAction)backToList:(id)sender;
@end
