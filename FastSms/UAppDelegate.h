//
//  UAppDelegate.h
//  FastSms
//
//  Created by Junil Um on 2013. 12. 20..
//  Copyright (c) 2013년 Junil Um. All rights reserved.
//

#import "UCommon.h"
#import <WebKit/WebFrameLoadDelegate.h>

@interface UAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet WebView *webview;
@property (weak) IBOutlet NSButton *sendButton;
@property (weak) IBOutlet NSTextField *smsNumber;
@property (assign) IBOutlet NSTextView *smsMessage;

typedef enum _sms_status_{
    SMS_LOGIN_STATUS,
    SMS_SEND_STATUS
} SmsStatus;

@end
