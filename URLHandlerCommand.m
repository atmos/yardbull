// file URLHandlerCommand.m
#import "URLHandlerCommand.h"

@implementation URLHandlerCommand

- (id)performDefaultImplementation {
  NSTask *task;

  NSString *urlString = [self directParameter];
  NSLog(@"url = %@", urlString);
  NSArray *arguments;

  NSArray *values = [urlString componentsSeparatedByString :@"/"];

  NSLog(@"values = %@", values);
  NSLog(@"environment = %@", [values objectAtIndex:2]);
  arguments = [NSArray arrayWithObjects: @"terminal", @"-e", [values objectAtIndex:2], nil];

  NSLog(@"args = %@", arguments);

  task = [[NSTask alloc] init];
  [task setLaunchPath: @"ENGINEYARD_GEM_PATH"];
  [task setArguments: arguments];

  NSDictionary *dictionary = [ task environment ];

  for (id key in dictionary)
  {
    NSLog(@"key: %@, value: %@", key, [dictionary objectForKey:key]);
  }

  [task launch];
  exit(0);
  return nil;
}

@end
