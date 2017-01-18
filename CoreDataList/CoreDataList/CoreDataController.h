//
//  CoreDataController.h
//  CoreDataList
//
//  Created by Pedro Brandão on 18/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataController : NSObject

@property (strong) NSManagedObjectContext *managedObjectContext;

- (void)initializeCoreData;

@end
