//
// Copyright 2009-2011 Facebook
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

// UI
#import "Three20UI/TTTableLinkedItem.h"

@interface TTTableTextItem : TTTableLinkedItem {
	NSString* _text;
	NSString* abrecord_type;
	NSString* phone;
	NSInteger abrecord_id;
    NSString* detailedText;
}

@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSString* abrecord_type;
@property (nonatomic, copy) NSString* phone;
@property (nonatomic, copy) NSString* detailedText;
@property (nonatomic, assign) NSInteger abrecord_id;

+ (id)itemWithRecipient:(NSString*)text recordType:(NSString *) record_type phone:(NSString *)phone_number abrecordId:(NSInteger) record_id;
+ (id)itemWithRecipient:(NSString*)text recordType:(NSString *) record_type phone:(NSString *)phone_number abrecordId:(NSInteger) record_id withDetailText:(NSString *)detailtext;

+ (id)itemWithText:(NSString*)text;
+ (id)itemWithText:(NSString*)text URL:(NSString*)URL;
+ (id)itemWithText:(NSString*)text URL:(NSString*)URL accessoryURL:(NSString*)accessoryURL;

+ (id)itemWithText:(NSString*)text delegate:(id)delegate selector:(SEL)selector;

@end
