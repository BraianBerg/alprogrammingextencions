tableextension 50701 SalesIvoiceTables extends "Sales Header"
{
    fields
    {
        field(50711; OwnerName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Owners Name';
            Editable = true;
        }
        field(50710; OwnerIdCode; Text[11])
        {
            DataClassification = ToBeClassified;
            Caption = 'Owners Id Code';
            Editable = true;
        }
    }


    var
        myInt: Integer;
}