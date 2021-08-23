codeunit 50705 CopyAndCreate
{
    trigger OnRun()
    begin

    end;



    local procedure CheckFiletype(var Rec: Record CopyFile; var xRec: Record CopyFile) FileType: Text[30]
    begin
        case Rec.FileType of
            Rec.FileType::"Text File":
                FileType := '.txt';
            Rec.FileType::"Word Document":
                FileType := '.docx';
        end;


    end;

    procedure CopyFile(var Rec: Record CopyFile; var xRec: Record CopyFile)

    begin

        if File.Copy('C:\Users\braia\Desktop\' + 'ul1praktika.txt', 'C:\Users\braia\Desktop\' + Rec.NewFileName + CheckFiletype(Rec, xRec)) then begin
            Message('File was copyied');
        end
        else begin
            Message('File was not copyed');
        end;

    end;



    procedure CreateFile(var Rec: Record CopyFile; var xRec: Record CopyFile)
    var
        new: File;
    begin

        if new.Create('C:\Users\braia\Desktop\' + Rec.NewFileName + '.txt') then
            Message('The file was Created')
        else
            Message('The file was not created');
    end;



    var
        myInt: Integer;
}