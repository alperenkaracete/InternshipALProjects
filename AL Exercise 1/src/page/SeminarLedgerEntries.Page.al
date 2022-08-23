page 50185 "Seminar Ledger Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Seminar Ledger Entry";
    Editable = false;
    Caption = 'Seminar Ledger Entries';

    layout
    {
        area(Content)
        {
            repeater("Group")
            {
                Caption = 'Group';
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the value of the Posting Date field.';

                }
                field("Document No. "; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the value of the Document No. field.';

                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the value of the Document Date field.';

                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                    Caption = 'Entry Type';
                    ToolTip = 'Specifies the value of the Entry Type field.';

                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar No.';
                    ToolTip = 'Specifies the value of the Seminar No. field.';

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';

                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';

                }
                field("Charge Type"; Rec."Charge Type")
                {
                    ApplicationArea = All;
                    Caption = 'Charge Type';
                    ToolTip = 'Specifies the value of the Charge Type field.';

                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                    ToolTip = 'Specifies the value of the Type field.';

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the value of the Quantity field.';

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
                field(Chargeable; Rec.Chargeable)
                {
                    ApplicationArea = All;
                    Caption = 'Chargeable';
                    ToolTip = 'Specifies the value of the Chargeable field.';

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
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Instructor Resource No.';
                    ToolTip = 'Specifies the value of the Instructor Resource No. field.';

                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Room Resource No.';
                    ToolTip = 'Specifies the value of the Room Resource No. field.';

                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the value of the Starting Date field.';

                }
                field("Seminar Registration No."; Rec."Seminar Registration No.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Registration No.';
                    ToolTip = 'Specifies the value of the Seminar Registration No. field.';

                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Caption = 'Entry No.';
                    ToolTip = 'Specifies the value of the Entry No. field.';

                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {

                    ApplicationArea = All;
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {

                    ApplicationArea = All;
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
            }


        }

        area(FactBoxes)
        {

            systempart("Record Links"; Links)
            {

                ApplicationArea = All;
            }

            systempart(Notes; Notes)
            {

                ApplicationArea = All;
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
            action(Navigate)
            {
                ApplicationArea = All;
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Navigate';
                ToolTip = 'Executes the Navigate action.';

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.RUN;
                end;
            }
        }
    }

    var
        myInt: Integer;
        Navigate: page Navigate;
}