

#import "NSString+Validation.h"

@implementation NSString (Validation)

#pragma mark - Account Validation
//移动：134、135、136、137、138、139、150、151、152、157、158、159、182、183、184、187、188、178(4G)、147(上网卡)；
//联通：130、131、132、155、156、185、186、176(4G)、145(上网卡)；
//电信：133、153、180、181、189 、177(4G)；
//卫星通信：1349；
//虚拟运营商：170
- (BOOL)isValidMobilePhoneNumber
{
    NSString *mobileNum = self;
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    //移动：134、135、136、137、138、139、150、151、152、157、158、159、182、183、184、187、188、178(4G)、147(上网卡)；
    NSString * CM = @"^1(34[0-8]|(3[5-9]|47|5[0127-9]|78|8[23478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    //联通：130、131、132、155、156、185、186、176(4G)、145(上网卡)；
    NSString * CU = @"^1(3[0-2]|45|5[56]|76|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    //电信：133、153、180、181、189 、177(4G)；
    NSString * CT = @"^1((33|53|77|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    //虚拟运营商：170
    NSString *virtualMoblie = @"^1(70)\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regexTestVM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", virtualMoblie];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regexTestVM evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


- (BOOL)isValidEnglishName
{
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    
    if (tLetterMatchCount == self.length)
    {
        return YES;
    }
    
    return NO;
}

//NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
//03
//
//04
////符合數字條件的有幾個字元
//05
//int tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:pPassword
//                      06
//                                                            options:NSMatchingReportProgress
//                      07
//                                                              range:NSMakeRange(0, pPassword.length)];
//08
//
//09
////英文字條件
//10
//NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
//11
//
//12
////符合英文字條件的有幾個字元
//13
//int tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:pPassword options:NSMatchingReportProgress range:NSMakeRange(0, pPassword.length)];
//14
//
//15
//if (tNumMatchCount == pPassword.length)
//16
//{
//    17
//    //全部符合數字，表示沒有英文
//    18
//    return ConfirmPasswordResult_HaveNoChar;
//    19
//}
//20
//else if (tLetterMatchCount == pPassword.length)
//21
//{
//    22
//    //全不符合英文，表示沒有數字
//    23
//    return ConfirmPasswordResult_HaveNoNum;
//    24
//}
//25
//else if (tNumMatchCount + tLetterMatchCount == pPassword.length)
//26
//{
//    27
//    //符合英文和符合數字條件的相加等於密碼長度
//    28
//    return ConfirmPasswordResult_Success;
//    29
//}
//30
//else
//31
//{
//    32
//    //可能包含標點符號的情況，或是包含非英文的文字，這裡再依照需求詳細判斷想呈現的錯誤
//    33
//}


@end
