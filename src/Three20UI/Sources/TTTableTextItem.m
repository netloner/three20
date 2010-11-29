//
// Copyright 2009-2010 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "Three20UI/TTTableTextItem.h"

// Core
#import "Three20Core/TTCorePreprocessorMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTTableTextItem

@synthesize text = _text, abrecord_type, phone, abrecord_id;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  TT_RELEASE_SAFELY(_text);
	[abrecord_type release];
	[phone release];
  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithRecipient:(NSString*)text recordType:(NSString *) record_type phone:(NSString *)phone_number abrecordId:(NSInteger) record_id{
	TTTableTextItem* item = [[[self alloc] init] autorelease];
	item.text = text;
	item.abrecord_id = record_id;
	item.abrecord_type = record_type;
	item.phone = phone_number;
	return item;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithText:(NSString*)text {
  TTTableTextItem* item = [[[self alloc] init] autorelease];
  item.text = text;
  return item;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithText:(NSString*)text URL:(NSString*)URL {
  TTTableTextItem* item = [[[self alloc] init] autorelease];
  item.text = text;
  item.URL = URL;
  return item;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithText:(NSString*)text URL:(NSString*)URL accessoryURL:(NSString*)accessoryURL {
  TTTableTextItem* item = [[[self alloc] init] autorelease];
  item.text = text;
  item.URL = URL;
  item.accessoryURL = accessoryURL;
  return item;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithText:(NSString*)text delegate:(id)delegate selector:(SEL)selector {
  TTTableTextItem* item = [[[self alloc] init] autorelease];
  item.text = text;
  item.delegate = delegate;
  item.selector = selector;
  return item;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSCoding


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder*)decoder {
  if (self = [super initWithCoder:decoder]) {
    self.text = [decoder decodeObjectForKey:@"text"];
  }
  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)encodeWithCoder:(NSCoder*)encoder {
  [super encodeWithCoder:encoder];
  if (self.text) {
    [encoder encodeObject:self.text forKey:@"text"];
  }
}


@end

