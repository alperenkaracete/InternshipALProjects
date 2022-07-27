page 50160 "Seminar Registration"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seminar Registration Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    var

                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;

                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;

                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;

                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ApplicationArea = All;

                }

                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;

                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;

                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;

                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;

                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;

                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;

                }

            }

            group("Seminar Room")
            {

                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;

                }
                field("Room Name"; Rec."Room Name")
                {
                    ApplicationArea = All;

                }
                field("Room Address"; Rec."Room Address")
                {
                    ApplicationArea = All;

                }
                field("Room Address 2"; Rec."Room Address 2")
                {
                    ApplicationArea = All;

                }
                field("Room Post Code"; Rec."Room Post Code")
                {
                    ApplicationArea = All;

                }
                field("Room City"; Rec."Room City")
                {
                    ApplicationArea = All;

                }
                field("Room Country/Reg. Code"; Rec."Room Country/Reg. Code")
                {
                    ApplicationArea = All;

                }
                field("Room County"; Rec."Room County")
                {
                    ApplicationArea = All;

                }
            }
            part("Lines"; "Seminar Registration Subform")
            {

                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");

            }

            group("Invoicing")
            {

                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;

                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;

                }

            }

        }

        area(FactBoxes)
        {

            part(Other; 9084)
            {

                ApplicationArea = All;

            }

            systempart("Record Links"; Links)
            {

                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {

                ApplicationArea = All;

            }


            part(SeminarDetails; "Seminar Details FactBox")
            {

                ApplicationArea = All;
                SubPageLink = "No." = field("Seminar No.");

            }

            part(CustomerDetails; "Customer Details FactBox")
            {
                Provider = Lines;

                ApplicationArea = All;
                SubPageLink = "No." = field("Bill-to Customer No.");
            }

        }
    }



    actions
    {
        area(Processing)
        {
            action("Comments")
            {
                ApplicationArea = All;
                RunObject = page "Seminar Comment Sheet";
                RunPageView = where("No." = const());
                RunPageLink = "No." = field("No.");
                Image = Comment;
                trigger OnAction()
                begin

                end;
            }
            action("Costs")
            {
                ApplicationArea = All;
                RunObject = page "Seminar Charges";
                RunPageLink = "No." = field("No.");
                Image = Costs;
                trigger OnAction()
                begin

                end;
            }

            action("Posting")
            {
                ApplicationArea = All;
                RunObject = codeunit "Seminar-Post (Yes/No)";
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                ShortcutKey = 'F9';
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}