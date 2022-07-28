page 50172 "Seminar Details FactBox"
{
    PageType = CardPart;
    SourceTable = Seminar;
    Caption = 'Seminar Details FactBox';


    layout
    {
        area(Content)
        {
            group("Group")
            {
                Caption = 'Group';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';

                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';

                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Duration';

                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Participants';

                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Participants';

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';

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