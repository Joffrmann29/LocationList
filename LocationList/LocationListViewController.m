//
//  ViewController.m
//  LocationList
//
//  Created by Joffrey Mann on 5/12/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#pragma segue identifier defines

#define LOCATION @"toLocationDetail"
#define ADDLOCATION @"toAddLocation"

#import "LocationListViewController.h"

@interface LocationListViewController ()

@end

@implementation LocationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _locations = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _locations.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    Location *locationToDisplay = _locations[indexPath.row];
    
    cell.textLabel.text = locationToDisplay.name;
    cell.detailTextLabel.text = locationToDisplay.address;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:LOCATION sender:indexPath];
}

-(void)addLocation:(Location *)location
{
    [_locations addObject:location];
    [_tableView reloadData];
    
    NSString *messageString = [NSString stringWithFormat:@"Your new location, %@ has been added", location.name];
    
    if(location != nil)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Success" message:messageString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Your location failed to be added"     delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:ADDLOCATION])
    {
        // Set an AddLocationViewController object to the segue's destination view controller.
        AddLocationViewController *alvc = (AddLocationViewController *)segue.destinationViewController;
        // Set the delegate property of AddLocationViewController to self.
        alvc.delegate = self;
    }
    
    else if([segue.identifier isEqualToString:LOCATION])
    {
        // Create a pointer to an NSIndexPath object and assign the sender variable to it.
        NSIndexPath *indexPath = sender;
        
        //NSIndexPath *path = [_tableView indexPathForSelectedRow];
        // Get the object at the index of the array according to the indexPath.row.
        Location *selectedLocation = _locations[indexPath.row];
        // Assign that object to a proxy property located in LocationDetailViewController that corresponds to the same type. This will allows us to pass that entire object and display the location for that object.
        LocationDetailViewController *ldvc = (LocationDetailViewController *)segue.destinationViewController;
        ldvc.passedLocation = selectedLocation;
    }
}

@end
