page 50190 "Seminar Registers"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seminar Register";
    Editable = false;
    Caption = 'Seminar Registers';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'GroupName';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.';

                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    Caption = 'Creation Date';
                    ToolTip = 'Specifies the value of the Creation Date field.';

                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Caption = 'User ID';
                    ToolTip = 'Specifies the value of the User ID field.';

                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the value of the Source Code field.';

                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = All;
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the value of the Journal Batch Name field.';

                }
                field("From Entry No."; Rec."From Entry No.")
                {
                    ApplicationArea = All;
                    Caption = 'From Entry No.';
                    ToolTip = 'Specifies the value of the From Entry No. field.';

                }
                field("To Entry No."; Rec."To Entry No.")
                {
                    ApplicationArea = All;
                    Caption = 'To Entry No.';
                    ToolTip = 'Specifies the value of the To Entry No. field.';

                }
            }

        }

        area(FactBoxes)
        {

            systempart("Record Links"; Links)
            {

                ApplicationArea = All;
            }

            systempart("Notes"; Notes)
            {

                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Register)
            {
                Caption = 'Register';

                action(RelatedInformation)
                {
                    ApplicationArea = All;
                    RunObject = codeunit "Seminar Reg.-Show Ledger";
                    Image = WarrantyLedger;
                    Caption = 'RelatedInformation';
                    ToolTip = 'Executes the RelatedInformation action.';

                    trigger OnAction()
                    begin

                    end;
                }

            }

        }
    }

    var
        myInt: Integer;
}