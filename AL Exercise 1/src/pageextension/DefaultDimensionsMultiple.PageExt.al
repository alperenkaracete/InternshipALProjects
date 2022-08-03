pageextension 50206 "DefaultDimensionsMultiple" extends "Default Dimensions-Multiple"
{

    layout
    {
        // Add changes to page layout here

    }

    actions
    {
        // Add changes to page actions here

    }

    var
        myInt: Integer;

    procedure SetMultiSeminar(var Seminar: Record Seminar)
    var
        myInt: Integer;
    begin
        SetMultiRecord(Database::Seminar, 1);
    end;


}