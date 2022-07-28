page 50163 "Seminar Charges"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Charge";
    AutoSplitKey = true;
    Caption = 'Seminar Charges';

    layout
    {
        area(Content)
        {
            repeater("Group")
            {
                Caption = 'Group';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';

                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';

                }
                field("Quantitiy"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Quantitiy';

                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Caption = 'Unit of Measure Code';

                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Bill-to Customer No.';

                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'Gen. Prod. Posting Group';

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Price';

                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;
                    Caption = 'Total Price';

                }
                field("To Invoice"; Rec."To Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'To Invoice';

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