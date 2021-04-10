// Copyright 2010-2019 The Omni Group. All rights reserved.
//
// This software may only be used and reproduced according to the
// terms in the file OmniSourceLicense.html, which should be
// distributed with this project and can also be found at
// <http://www.omnigroup.com/developer/sourcecode/sourcelicense/>.

#import <OmniUI/OUIEditableLabeledTableViewCell.h>

#import <OmniUI/OUIEditableLabeledValueCell.h>

RCS_ID("$Id$")

NS_ASSUME_NONNULL_BEGIN

@implementation OUIEditableLabeledTableViewCell
{
    OUIEditableLabeledValueCell *_editableValueCell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]))
        return nil;
    
    _editableValueCell = [[OUIEditableLabeledValueCell alloc] initWithFrame:self.contentView.bounds];
    _editableValueCell.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [self.contentView addSubview:_editableValueCell];
    
    return self;
}

- (void)dealloc;
{
    _editableValueCell.delegate = nil; // Callers like OUIServerAccountSetupViewController will make themselves the delegate
}

- (OUIEditableLabeledValueCell *)editableValueCell;
{
    OBPRECONDITION(_editableValueCell);
    return _editableValueCell;
}

@end

NS_ASSUME_NONNULL_END
