pageextension 50705 SalesRetunOwner extends "Sales Return Order"
{
    layout
    {
        addlast(General)
        {
            field(OwnerName; OwnerName)
            {
                ApplicationArea = All;
                Caption = 'Owners Name';
            }
            field(OwnerId; OwnerIdCode)
            {
                ApplicationArea = All;
                Caption = 'Owners Id Code';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}