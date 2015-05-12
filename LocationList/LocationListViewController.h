//
//  ViewController.h
//  LocationList
//
//  Created by Joffrey Mann on 5/12/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *locations;

@end

