//
//  ProfileViewController.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/22/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (atomic,retain) IBOutlet UIImageView *pic;
@end
