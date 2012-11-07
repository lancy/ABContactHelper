//
//  DetailViewController.h
//  ContactsDemo
//
//  Created by Lancy on 5/11/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABContactsHelper.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ABContact *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
