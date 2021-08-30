pageextension 50701 SalesInvoiceOwner extends "Sales Invoice"
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
            field(OwnersId; OwnerIdCode)
            {
                ApplicationArea = All;
                Caption = 'Owners Id';
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




