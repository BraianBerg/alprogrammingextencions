pageextension 50704 CreditMemoSalesOwner extends "Sales Credit Memo"
{
    layout
    {
        addlast(General)
        {
            field(OwnersName; OwnerName)
            {
                ApplicationArea = All;
                Caption = 'Owners Name';
            }
            field(OwnersId; OwnerId)
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