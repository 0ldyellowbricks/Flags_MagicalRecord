//
//  Flag+CoreDataProperties.m
//  
//
//  Created by Frayda on 14/1/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Flag+CoreDataProperties.h"

@implementation Flag (CoreDataProperties)

+ (NSFetchRequest<Flag *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Flag"];
}

@dynamic name;
@dynamic flagInfo;

@end
