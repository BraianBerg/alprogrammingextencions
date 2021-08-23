tableextension 50701 SalesIvoiceTable extends "Sales Header"
{
    fields
    {
        field(50701; OwnerName; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Owners Name';
            Editable = true;
        }
        field(50702; OwnerId; Text[11])
        {
            DataClassification = ToBeClassified;
            Caption = 'Owners Id';
            Editable = true;

        }
    }


    var
        myInt: Integer;
}