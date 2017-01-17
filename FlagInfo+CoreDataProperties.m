//
//  FlagInfo+CoreDataProperties.m
//  
//
//  Created by Frayda on 14/1/17.
//
//  This file was automatically generated and should not be edited.
//

#import "FlagInfo+CoreDataProperties.h"

@implementation FlagInfo (CoreDataProperties)

+ (NSFetchRequest<FlagInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"FlagInfo"];
}

@dynamic describtion;
@dynamic location;
@dynamic travelTimes;
@dynamic flag;

@end
