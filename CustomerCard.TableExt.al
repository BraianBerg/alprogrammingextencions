tableextension 50700 CustomerCardOwner extends Customer
{
    fields
    {
        field(50701; AGP_PRK_001_OwnersName; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Owners Name';
            Editable = true;
        }
        field(50702; AGP_PRK_001_OwnersIdCode; Text[11])
        {
            DataClassification = CustomerContent;
            Caption = 'Owners Id Code';
            Editable = true;
        }
    }

}