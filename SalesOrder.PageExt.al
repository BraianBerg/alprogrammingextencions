pageextension 50702 SalesOrderOwner extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field(OwnerName; OwnerName)
            {
                ApplicationArea = All;
                Caption = 'Owner Name';
            }
            field(OwnerId; OwnerId)
            {
                ApplicationArea = All;
                Caption = 'Owner Id Code';
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