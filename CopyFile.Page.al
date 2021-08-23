page 50705 Coping
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = CopyFile;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(FileName; FileName)
                {
                    ApplicationArea = All;
                    Caption = 'Old File Name';
                    Editable = true;
                }
                field(NewFileName; NewFileName)
                {
                    ApplicationArea = All;
                    Caption = 'New File Name';
                    Editable = true;
                }
                field(FileType; FileType)
                {
                    Caption = 'File Type';
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Copy File")
            {
                ApplicationArea = all;
                Promoted = true;
                Caption = 'Copy File';

                trigger OnAction()
                begin
                    CopyRec.CopyFile(Rec, xRec);
                end;
            }


            action("Create File")
            {
                ApplicationArea = all;
                Promoted = true;
                Caption = 'Create File';

                trigger OnAction()
                begin
                    CopyRec.CreateFile(Rec, xRec);
                end;
            }

        }
    }



    var
        CopyRec: Codeunit CopyAndCreate;
}