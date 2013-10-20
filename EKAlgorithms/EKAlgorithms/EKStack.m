//
//  EKStack.m
//  EKAlgorithms
//
//  Created by Evgeny Karkan on 20.10.13.
//  Copyright (c) 2013 EvgenyKarkan. All rights reserved.
//

#import "EKStack.h"

@interface EKStack ()

@property (nonatomic, strong) NSMutableArray *stackArray;
@property (nonatomic, assign) NSUInteger maxStackSize;

@end


@implementation EKStack;

#pragma mark - Default init

- (id)init
{
	self = [super init];
	if (self) {
		self.stackArray = [@[] mutableCopy];
	}
	return self;
}

#pragma mark - Init with limited size of stack

- (id)initWithSize:(NSUInteger)size
{
	self = [super init];
	if (self) {
		if (size > 0) {
			self.stackArray = [@[] mutableCopy];
			self.maxStackSize = size;
		}
		else {
			NSAssert(size != 0, @"Stack size must be not 0");
		}
	}
	return self;
}

#pragma mark - Public API

- (id)popLastObject
{
	id object = [self peek];
	[self.stackArray removeLastObject];
    
	return object;
}

- (void)push:(id)element
{
	if ([self isFull] && self.maxStackSize) {
		NSLog(@"Stack is full");
		return;
	}
    
	if (element != nil) {
		[self.stackArray addObject:element];
	}
	else {
		NSAssert(element != nil, @"You cannot push nil object to stack");
	}
}

- (id)peek
{
	return [self.stackArray lastObject];
}

- (NSInteger)sizeOfStack
{
	return [self.stackArray count];
}

- (BOOL)isEmpty
{
	return [self.stackArray count] == 0;
}

- (BOOL)isFull
{
	return ([self sizeOfStack] == self.maxStackSize) ? YES : NO;
}

- (void)clear
{
	[self.stackArray removeAllObjects];
}

- (NSArray *)allObjectsFromStack
{
	NSMutableArray *buffer = [@[] mutableCopy];
    
	for (id object in self.stackArray) {
		[buffer addObject:object];
	}
    
	return [buffer copy];
}

@end