//
//  Flag+CoreDataProperties.h
//  
//
//  Created by Frayda on 14/1/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Flag+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Flag (CoreDataProperties)

+ (NSFetchRequest<Flag *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) FlagInfo *flagInfo;

@end

NS_ASSUME_NONNULL_END
