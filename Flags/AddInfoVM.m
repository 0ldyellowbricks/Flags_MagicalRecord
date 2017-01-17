//
//  AddInfoVM.m
//  Flags
//
//  Created by Frayda on 16/1/17.
//  Copyright © 2017 flas. All rights reserved.
//

#import "AddInfoVM.h"
#import "FlagInfo+CoreDataClass.h"
#import "Flag+CoreDataClass.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation AddInfoVM
- (void)goback:(NSMutableDictionary *)addInfoDic withVC:(UIViewController*)superVC{
    
    Flag *flag = [Flag MR_createEntity];
    flag.name = addInfoDic[@"nameStr"];
    flag.flagInfo = [FlagInfo MR_createEntity];
    flag.flagInfo.travelTimes = [addInfoDic[@"countStr"] intValue];
    flag.flagInfo.describtion = addInfoDic[@"imageStr"];
    [superVC dismissViewControllerAnimated:YES completion:nil];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
}
@end
