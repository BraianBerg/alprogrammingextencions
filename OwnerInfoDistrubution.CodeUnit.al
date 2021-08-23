codeunit 50701 InfoDistubution
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer Name', false, false)]
    procedure MyProcedure(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; CurrFieldNo: Integer)
    var

    begin

        IF RecCust.GET(Rec."Sell-to Customer No.") THEN begin
            Rec.Validate(OwnerName, RecCust.OwnersName);
            Rec.Validate(OwnerId, RecCust.OwnersIdCode);
        end
        else
            Message('record was not found');

    end;

    var
        myInt: Integer;
        RecCust: Record Customer;

}




