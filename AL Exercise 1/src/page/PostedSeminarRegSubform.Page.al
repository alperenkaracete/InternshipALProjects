page 50187 "Posted Seminar Reg. Subform"

{
    PageType = ListPart;
    DelayedInsert = true;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Posted Seminar Reg. Line";
    AutoSplitKey = true;
    Caption = 'Posted Seminar Reg. Sub Form';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                Caption = 'Group';
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Bill-to Customer No.';

                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ApplicationArea = All;
                    Caption = 'Participant Contact No.';

                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = All;
                    Caption = 'Participant Name';

                }
                field(Participated; Rec.Participated)
                {
                    ApplicationArea = All;
                    Caption = 'Participated';

                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    Caption = 'Registration Date';

                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    ApplicationArea = All;
                    Caption = 'Confirmation Date';

                }
                field("To Invoice"; Rec."To Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'To Invoice';

                }
                field(Registered; Rec.Registered)
                {
                    ApplicationArea = All;
                    Caption = 'Registered';

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';

                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = All;
                    Caption = 'Line Discount';

                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Line Discount Amount';

                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Amount';

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
            action(Dimensions)
            {
                ApplicationArea = All;
                Image = Dimensions;
                ShortcutKey = 'Shift+Ctrl+D';


                trigger OnAction()
                begin
                    ShowDimensions;
                end;
            }
        }
    }

    var
        myInt: Integer;
}