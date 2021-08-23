pageextension 50700 "Company Owner" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(OwnersName; OwnersName)
            {
                ApplicationArea = All;
                Caption = 'Owners Name';

            }
            field(OwnersIdCode; OwnersIdCode)
            {
                ApplicationArea = All;
                Caption = 'Owners Id Code';
            }
        }

    }

    actions
    {
        ////sdsdsdsd
    }


    var
        myInt: Integer;
}