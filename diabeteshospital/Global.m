//
//  Global.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-18.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import "Global.h"

@implementation Global


+(NSString *)GetLoginURL{
    return @"http://medmap.cn:8031/serivce.aspx?function=PatientLogin&username=%@&password=%@&callback=func";
}

+(NSString *)GetRegURL{

    return @"http://medmap.cn:8031/serivce.aspx?function=PatientRegister&code=%@&callback=func";
}

+(NSString *)GetChangePasswordURL{
    return @"";
}
@end
