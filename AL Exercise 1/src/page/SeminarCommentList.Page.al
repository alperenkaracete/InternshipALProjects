page 50162 "Seminar Comment List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Comment Line";
    Description = 'Seminar Comment List';
    Caption = 'Seminar Comment List';
    Editable = false;
    LinksAllowed = false;
    DataCaptionFields = "No.";


    layout
    {
        area(Content)
        {
            repeater("Comment List")
            {
                Caption = 'Comment List';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';


                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Caption = 'Date';

                }
                field("Comment"; Rec."Comment")
                {
                    ApplicationArea = All;
                    Caption = 'Comment';


                }
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';


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

    var
        myInt: Integer;
}
