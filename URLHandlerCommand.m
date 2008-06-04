// file URLHandlerCommand.m
#import "URLHandlerCommand.h"

@implementation URLHandlerCommand

- (id)performDefaultImplementation {
  NSTask *task;

  NSString *urlString = [self directParameter];
  NSArray *values = [urlString componentsSeparatedByString :@"/"];
  NSLog(@"url = %@", urlString);

  NSLog(@"url = %@", values);
  NSLog(@"cluster = %@", [values objectAtIndex:2]);
  NSLog(@"environment = %@", [values objectAtIndex:3]);
  
  NSArray *arguments;
  arguments = [NSArray arrayWithObjects: @"terminal", @"-C", [values objectAtIndex:2], @"-E", [values objectAtIndex:3], nil];
  NSLog(@"args = %@", arguments);

  task = [[NSTask alloc] init];
  [task setLaunchPath: @"/opt/local/bin/samurai"];
  [task setArguments: arguments];
  [task launch];

  // exit(0);
  return nil;
}

@end