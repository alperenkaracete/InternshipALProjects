page 50190 "Seminar Registers Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seminar Register";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;

                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;

                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;

                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = All;

                }
                field("From Entry No."; Rec."From Entry No.")
                {
                    ApplicationArea = All;

                }
                field("To Entry No."; Rec."To Entry No.")
                {
                    ApplicationArea = All;

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

                action(RelatedInformation)
                {
                    ApplicationArea = All;
                    RunObject = codeunit "Seminar Reg.-Show Ledger";
                    Image = WarrantyLedger;

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