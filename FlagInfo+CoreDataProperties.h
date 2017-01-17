//
//  FlagInfo+CoreDataProperties.h
//  
//
//  Created by Frayda on 14/1/17.
//
//  This file was automatically generated and should not be edited.
//

#import "FlagInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FlagInfo (CoreDataProperties)

+ (NSFetchRequest<FlagInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *describtion;
@property (nullable, nonatomic, copy) NSString *location;
@property (nonatomic) int16_t travelTimes;
@property (nullable, nonatomic, retain) Flag *flag;

@end

NS_ASSUME_NONNULL_END
