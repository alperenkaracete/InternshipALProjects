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
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';

                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ApplicationArea = All;
                    Caption = 'Participant Contact No.';
                    ToolTip = 'Specifies the value of the Participant Contact No. field.';

                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = All;
                    Caption = 'Participant Name';
                    ToolTip = 'Specifies the value of the Participant Name field.';

                }
                field(Participated; Rec.Participated)
                {
                    ApplicationArea = All;
                    Caption = 'Participated';
                    ToolTip = 'Specifies the value of the Participated field.';

                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    Caption = 'Registration Date';
                    ToolTip = 'Specifies the value of the Registration Date field.';

                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    ApplicationArea = All;
                    Caption = 'Confirmation Date';
                    ToolTip = 'Specifies the value of the Confirmation Date field.';

                }
                field("To Invoice"; Rec."To Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'To Invoice';
                    ToolTip = 'Specifies the value of the To Invoice field.';

                }
                field(Registered; Rec.Registered)
                {
                    ApplicationArea = All;
                    Caption = 'Registered';
                    ToolTip = 'Specifies the value of the Registered field.';

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';
                    ToolTip = 'Specifies the value of the Seminar Price field.';

                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = All;
                    Caption = 'Line Discount';
                    ToolTip = 'Specifies the value of the Line Discount field.';

                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Line Discount Amount';
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';

                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                    ToolTip = 'Specifies the value of the Amount field.';

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
            action(Dimensions)
            {
                ApplicationArea = All;
                Image = Dimensions;
                ShortcutKey = 'Shift+Ctrl+D';
                Caption = 'Dimensions';
                ToolTip = 'Executes the Dimensions action.';


                trigger OnAction()
                begin
                    Rec.ShowDimensions;
                end;
            }
        }
    }

    var
        myInt: Integer;
}