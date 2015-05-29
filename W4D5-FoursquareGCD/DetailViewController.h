//
//  DetailViewController.h
//  W4D5-FoursquareGCD
//
//  Created by Daniel Mathews on 2015-05-28.
//  Copyright (c) 2015 ca.lighthouselabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

