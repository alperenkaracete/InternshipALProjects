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
                    ToolTip = 'Specifies the value of the No. field.';

                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';

                }
                field("Quantitiy"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Quantitiy';
                    ToolTip = 'Specifies the value of the Quantitiy field.';

                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';

                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';

                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the value of the Unit Price field.';

                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;
                    Caption = 'Total Price';
                    ToolTip = 'Specifies the value of the Total Price field.';

                }
                field("To Invoice"; Rec."To Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'To Invoice';
                    ToolTip = 'Specifies the value of the To Invoice field.';

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