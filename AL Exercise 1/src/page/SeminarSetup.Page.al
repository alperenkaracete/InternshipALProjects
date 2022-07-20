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
                field("Seminar Nos."; "Seminar Nos.")
                {
                    ApplicationArea = All;

                }
                field("Seminar Registration Nos."; "Seminar Registration Nos.")
                {
                    ApplicationArea = All;


                }
                field("Posted Seminar Registration Nos."; "Posted Seminar Reg. Nos.")
                {
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
            action(ActionName)
            {
                ApplicationArea = All;

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
        IF NOT FINDFIRST THEN
            INSERT;
    end;

    var
        myInt: Integer;
}