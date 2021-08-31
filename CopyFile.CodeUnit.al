codeunit 50705 CopyAndCreate
{
    local procedure CheckFiletype(var Rec: Record CopyFile; var xRec: Record CopyFile) FileType: Text[30]
    begin
        case Rec.AGP_PRK_001_FileType of
            Rec.AGP_PRK_001_FileType::"Text File":
                FileType := '.txt';
            Rec.AGP_PRK_001_FileType::"Word Document":
                FileType := '.docx';
        end;
    end;

    procedure CopyFile(var Rec: Record CopyFile; var xRec: Record CopyFile)
    var
        copyed: Label 'File was copyied';
        notcopyed: Label 'File was not copyed';
    begin

        if File.Copy('C:\Users\braia\Desktop\' + 'ul1praktika.txt', 'C:\Users\braia\Desktop\' + Rec.AGP_PRK_001_NewFileName + CheckFiletype(Rec, xRec)) then begin
            Message(copyed);
        end
        else begin
            Message(notcopyed);
        end;

    end;

    procedure CreateFile(var Rec: Record CopyFile; var xRec: Record CopyFile)
    var
        new: File;
        filecreated: Label 'The file was Created';
        filenotcreated: Label 'The file was not created';
    begin

        if new.Create('C:\Users\braia\Desktop\' + Rec.AGP_PRK_001_NewFileName + '.txt') then
            Message(filecreated)
        else
            Message(filenotcreated);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopyFieldsFromOldSalesHeader', '', false, false)]
    local procedure CopyFieldsSalesHeader(var ToSalesHeader: Record "Sales Header"; OldSalesHeader: Record "Sales Header"; MoveNegLines: Boolean; IncludeHeader: Boolean)
    begin
        ToSalesHeader.AGP_PRK_001_OwnersName := OldSalesHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode := OldSalesHeader.AGP_PRK_001_OwnersIdCode;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocShptLine', '', false, false)]
    local procedure CopyPostedShipmentDoc(var FromSalesShipmentHeader: Record "Sales Shipment Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader.AGP_PRK_001_OwnersName := FromSalesShipmentHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode := FromSalesShipmentHeader.AGP_PRK_001_OwnersIdCode;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocInvLine', '', false, false)]
    local procedure CopyPostedSalesInvoice(var FromSalesInvoiceHeader: Record "Sales Invoice Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader.AGP_PRK_001_OwnersName := FromSalesInvoiceHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode := FromSalesInvoiceHeader.AGP_PRK_001_OwnersIdCode;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocCrMemoLine', '', false, false)]
    local procedure CopyPostedCreditMemo(var FromSalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader.AGP_PRK_001_OwnersName := FromSalesCrMemoHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode := FromSalesCrMemoHeader.AGP_PRK_001_OwnersIdCode;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocReturnRcptLine', '', false, false)]
    local procedure MyProcedure(var FromReturnReceiptHeader: Record "Return Receipt Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader.AGP_PRK_001_OwnersName := FromReturnReceiptHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode := FromReturnReceiptHeader.AGP_PRK_001_OwnersIdCode;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer Name', false, false)]
    procedure PutOwnerInfoInToSalesHeader(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; CurrFieldNo: Integer)
    var
        notfound: Label 'record was not found';
        RecCust: Record Customer;
    begin

        IF RecCust.GET(Rec."Sell-to Customer No.") THEN begin
            Rec.Validate(AGP_PRK_001_OwnersName, RecCust.AGP_PRK_001_OwnersName);
            Rec.Validate(AGP_PRK_001_OwnersIdCode, RecCust.AGP_PRK_001_OwnersIdCode);
        end
        else
            Message(notfound);

    end;
}