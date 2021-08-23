tableextension 50700 CustomerCardOwner extends Customer
{
    fields
    {
        field(50701; OwnersName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Owners Name';
            Editable = true;
        }
        field(50702; OwnersIdCode; Text[11])
        {
            DataClassification = ToBeClassified;
            Caption = 'Owners Id Code';
            Editable = true;
        }
    }


    var
        myInt: Integer;
}