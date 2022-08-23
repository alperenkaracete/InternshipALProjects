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
                    ToolTip = 'Specifies the value of the Seminar Nos. field.';

                }
                field("Seminar Registration Nos."; Rec."Seminar Registration Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Registration Nos.';
                    ToolTip = 'Specifies the value of the Seminar Registration Nos. field.';


                }
                field("Posted Seminar Registration Nos."; Rec."Posted Seminar Reg. No.")
                {
                    ApplicationArea = All;
                    Editable = true;
                    Caption = 'Posted Seminar Reg. Nos.';
                    ToolTip = 'Specifies the value of the Posted Seminar Reg. Nos. field.';


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
                ToolTip = 'Executes the ActionName action.';

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