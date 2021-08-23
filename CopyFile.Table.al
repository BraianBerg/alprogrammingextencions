table 50705 CopyFile
{
    DataClassification = ToBeClassified;

    fields
    {
        field(50705; FileName; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            Caption = 'Old File Name';

        }
        field(50706; NewFileName; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            Caption = 'New File Name';
        }
        field(50707; FileType; Option)
        {
            OptionMembers = "Text File","Word Document";
            DataClassification = ToBeClassified;
        }
    }



    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;



}