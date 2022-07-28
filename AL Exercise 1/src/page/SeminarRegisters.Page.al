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

                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    Caption = 'Creation Date';

                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Caption = 'User ID';

                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    Caption = 'Source Code';

                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = All;
                    Caption = 'Journal Batch Name';

                }
                field("From Entry No."; Rec."From Entry No.")
                {
                    ApplicationArea = All;
                    Caption = 'From Entry No.';

                }
                field("To Entry No."; Rec."To Entry No.")
                {
                    ApplicationArea = All;
                    Caption = 'To Entry No.';

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