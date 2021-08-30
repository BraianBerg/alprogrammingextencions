codeunit 50706 CopyFieldsFromFile
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopyFieldsFromOldSalesHeader', '', false, false)]
    local procedure CopyFieldsSalesHeader(var ToSalesHeader: Record "Sales Header"; OldSalesHeader: Record "Sales Header"; MoveNegLines: Boolean; IncludeHeader: Boolean)
    begin
        ToSalesHeader.OwnerName := OldSalesHeader.OwnerName;
        ToSalesHeader.OwnerIdCode := OldSalesHeader.OwnerIdCode;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocShptLine', '', false, false)]
    local procedure CopyPostedShipmentDoc(var FromSalesShipmentHeader: Record "Sales Shipment Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader.OwnerName := FromSalesShipmentHeader.OwnersName;
        ToSalesHeader.OwnerIdCode := FromSalesShipmentHeader.OwnersIdCode;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocInvLine', '', false, false)]
    local procedure CopyPostedSalesInvoice(var FromSalesInvoiceHeader: Record "Sales Invoice Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader.OwnerName := FromSalesInvoiceHeader.OwnersName;
        ToSalesHeader.OwnerIdCode := FromSalesInvoiceHeader.OwnersIdCode;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocCrMemoLine', '', false, false)]
    local procedure CopyPostedCreditMemo(var FromSalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader.OwnerName := FromSalesCrMemoHeader.OwnersName;
        ToSalesHeader.OwnerIdCode := FromSalesCrMemoHeader.OwnersIdCode;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocReturnRcptLine', '', false, false)]
    local procedure MyProcedure(var FromReturnReceiptHeader: Record "Return Receipt Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader.OwnerName := FromReturnReceiptHeader.OwnersName;
        ToSalesHeader.OwnerIdCode := FromReturnReceiptHeader.OwnersIdCode;
    end;

    var




        myInt: Integer;
}