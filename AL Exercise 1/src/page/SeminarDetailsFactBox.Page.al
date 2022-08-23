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
                    ToolTip = 'Specifies the value of the No. field.';

                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'Specifies the value of the Name field.';

                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Duration';
                    ToolTip = 'Specifies the value of the Seminar Duration field.';

                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Participants';
                    ToolTip = 'Specifies the value of the Maximum Participants field.';

                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Participants';
                    ToolTip = 'Specifies the value of the Minimum Participants field.';

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';
                    ToolTip = 'Specifies the value of the Seminar Price field.';

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

    var
        myInt: Integer;
}