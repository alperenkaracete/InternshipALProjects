page 50185 "Seminar Ledger Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Ledger Entry";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Group")
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;

                }
                field("Document No. "; Rec."Document No.")
                {
                    ApplicationArea = All;

                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Visible = false;

                }
                field("Entry Type "; Rec."Entry Type ")
                {
                    ApplicationArea = All;

                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;

                }
                field("Charge Type"; Rec."Charge Type")
                {
                    ApplicationArea = All;

                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;

                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;

                }
                field(Chargeable; Rec.Chargeable)
                {
                    ApplicationArea = All;

                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ApplicationArea = All;

                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = All;

                }
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;

                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;

                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;

                }
                field("Seminar Registration No."; Rec."Seminar Registration No.")
                {
                    ApplicationArea = All;

                }
                field("Entry No."; Rec."Entry No.")
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