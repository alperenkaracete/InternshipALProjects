page 50160 "Seminar Registration"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seminar Registration Header";
    Caption = 'Seminar Registration';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;

                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Starting Date';

                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar No.';

                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Name';

                }

                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Instructor No.';

                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;
                    Caption = 'Instructor Name';

                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Posting Date';

                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Caption = 'Document Date';

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';

                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Duration';

                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Participants';

                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Participants';

                }

            }

            group("Seminar Room")
            {
                Caption = 'Seminar Room';

                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Room No.';

                }
                field("Room Name"; Rec."Room Name")
                {
                    ApplicationArea = All;
                    Caption = 'Room Name';

                }
                field("Room Address"; Rec."Room Address")
                {
                    ApplicationArea = All;
                    Caption = 'Room Address';

                }
                field("Room Address 2"; Rec."Room Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Room Address 2';

                }
                field("Room Post Code"; Rec."Room Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Room Post Code';

                }
                field("Room City"; Rec."Room City")
                {
                    ApplicationArea = All;
                    Caption = 'Room City';

                }
                field("Room Country/Reg. Code"; Rec."Room Country/Reg. Code")
                {
                    ApplicationArea = All;
                    Caption = 'Room Country/Reg. Code';

                }
                field("Room County"; Rec."Room County")
                {
                    ApplicationArea = All;
                    Caption = 'Room County';

                }
            }
            part("Lines"; "Seminar Registration Subform")
            {

                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                Caption = 'Lines';

            }

            group("Invoicing")
            {
                Caption = 'Invoicing';

                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'Gen. Prod. Posting Group';

                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'VAT Prod. Posting Group';

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';

                }

            }

        }

        area(FactBoxes)
        {

            part(Other; 9084)
            {

                ApplicationArea = All;
                Caption = '9084';

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
                Caption = 'Seminar Details FactBox';

            }

            part(CustomerDetails; "Customer Details FactBox")
            {
                Provider = Lines;

                ApplicationArea = All;
                SubPageLink = "No." = field("Bill-to Customer No.");
                Caption = 'Customer Details FactBox';
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
                Caption = 'Comments';
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
                Caption = 'Costs';
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
                Caption = 'Posting';
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
                    Navigate.SetDoc(Rec."Posting Date", Rec."No.");
                    Navigate.RUN;
                end;
            }
            action(Print)
            {
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Print';
                RunObject = report SeminarRegReport;

                trigger OnAction()
                begin

                end;
            }
            action(Dimensions)
            {
                ApplicationArea = All;
                Image = Dimensions;

                trigger OnAction()
                begin
                    ShowDocDim;
                    CurrPage.SAVERECORD;
                end;
            }
        }
    }

    var
        myInt: Integer;
        Navigate: page Navigate;
}