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

                }
                field("Document No. "; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';

                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                    Caption = 'Document Date';

                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                    Caption = 'Entry Type';

                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar No.';

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';

                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Bill-to Customer No.';

                }
                field("Charge Type"; Rec."Charge Type")
                {
                    ApplicationArea = All;
                    Caption = 'Charge Type';

                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Caption = 'Quantity';

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
                field(Chargeable; Rec.Chargeable)
                {
                    ApplicationArea = All;
                    Caption = 'Chargeable';

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
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Instructor Resource No.';

                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Room Resource No.';

                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Starting Date';

                }
                field("Seminar Registration No."; Rec."Seminar Registration No.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Registration No.';

                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Caption = 'Entry No.';

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