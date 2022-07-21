page 50155 "Seminar Setup"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = "Seminar Setup";
    Caption = 'Seminar Setup';
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'GroupName';
                field("Seminar Nos."; Rec."Seminar Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Nos.';

                }
                field("Seminar Registration Nos."; Rec."Seminar Registration Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Registration Nos.';


                }
                field("Posted Seminar Registration Nos."; Rec."Posted Seminar Reg. No.")
                {
                    ApplicationArea = All;
                    Editable = true;
                    Caption = 'Posted Seminar Reg. Nos.';


                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'ActionName';

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        IF NOT Rec.FINDFIRST THEN
            Rec.INSERT;
    end;

    var
        myInt: Integer;
}