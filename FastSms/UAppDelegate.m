//
//  UAppDelegate.m
//  FastSms
//
//  Created by Junil Um on 2013. 12. 20..
//  Copyright (c) 2013년 Junil Um. All rights reserved.
//

#import "UCommon.h"
#import "UAppDelegate.h"

@implementation UAppDelegate {
    SmsStatus smsStatus;
    NSString *script;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    [self initApp];
    
}

- (void)initApp {
    script = @"                                                         \
    function _a_() {                                                    \
        document.getElementById('userId').value = '';           \
        document.getElementById('password').value = '';    \
        document.getElementById('authMobile').submit();                 \
    }                                                                   \
                                                                        \
    function _b_() {                                                    \
        document.getElementById('editInput').click();                   \
        document.getElementById('pincodeInput').value = '1133';         \
        fnPINReg();                                                     \
    }                                                                   \
                                                                        \
    function _c_() {                                                    \
        document.getElementById('AddrComText').click();                 \
        document.getElementById('addrInData').value = '01031796684';    \
        newAddrIn();                                                    \
        document.getElementById('mOlleh3Depth').children[2].click();    \
    }                                                                   \
                                                                        \
    function _d_() {                                                    \
        document.getElementById('editInput').value = '%@';              \
        document.getElementById('msgSend').click();                     \
        sendSmsMms('A00', 'False');                                     \
    }                                                                   \
    ";

    [self.sendButton setAction:@selector(sendButton_Click:)];

    /**
     https://m.mms.olleh.com/mustweb/mOlleh/send/smsSend_Portal.asp?msgType=SMS&recvCnt=1&recvLists=MDEwMzE3OTY2ODQs&recvNames=MDEwMzE3OTY2ODQs&sendhtml=%uC5C4%uC900%uC77Cabcde&sndIdx=&isDeco=&isDecoBg=&picIdx=&isGroups=N&recvConfirm=&readConfirm=&starSMS=&autoName=&recvPhone=&cIdx=&PhotoUrl=&MsgDetailType=A00&reserved=&sendPhone=lDAp2TcirQKZ3CoJyMOZtg==
     **/

    //[self.webview setFrameLoadDelegate:self];

    smsStatus = SMS_LOGIN_STATUS;

    [self.webview setFrameLoadDelegate:self];
    NSURL *url = [NSURL URLWithString:@"https://m.mms.olleh.com/mustweb/mOlleh/intro.asp"];
    WebFrame *frame = self.webview.mainFrame;

    [frame loadRequest:[NSURLRequest requestWithURL:url]];
    
    
    //WebPreferences *p = [WebPreferences standardPreferences];
    
    
    
}


- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
    NSLog(@"didFinishLoadForFrame:sender:%@ frame:%@", sender, frame.name);

    if ([frame.name isNotEqualTo: @"snsfrm"]) return;
    
    if (smsStatus == SMS_LOGIN_STATUS) {
        
        [self.webview stringByEvaluatingJavaScriptFromString:script];
        [self.webview stringByEvaluatingJavaScriptFromString:@"_a_();"];
        
        
        
    }
    else if (smsStatus == SMS_SEND_STATUS) {
        
        [self.webview stringByEvaluatingJavaScriptFromString:script];
        [self.webview stringByEvaluatingJavaScriptFromString:@"_c_();"];
        
    }
}


- (IBAction)sendButton_Click:(id)sender {
    
    [self.webview stringByEvaluatingJavaScriptFromString:script];
    [self.webview stringByEvaluatingJavaScriptFromString:@"_b_();"];
    
    smsStatus = SMS_SEND_STATUS;

}

@end


