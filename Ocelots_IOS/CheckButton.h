//
//  CheckButton.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 11/22/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

typedef enum {
    CheckButtonStyleDefault = 0 ,
    CheckButtonStyleBox = 1 ,
    CheckButtonStyleRadio = 2
} CheckButtonStyle;
#import <Foundation/Foundation.h>

@interface CheckButton : UIControl {
    UILabel * label ;
    UIImageView * icon ;
    BOOL checked ;
    id value , delegate ;
    CheckButtonStyle style ;
    NSString * checkname ,* uncheckname ; // 勾选／反选时的图片文件名
}
@property ( retain , nonatomic ) id value,delegate;
@property ( retain , nonatomic )UILabel* label;
@property ( retain , nonatomic )UIImageView* icon;
@property ( assign )CheckButtonStyle style;
-( CheckButtonStyle )style;
-( void )setStyle:( CheckButtonStyle )st;
-( BOOL )isChecked;
-( void )setChecked:( BOOL )b;
@end
