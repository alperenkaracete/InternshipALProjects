page 50173 "Posted Seminar Registration"

{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Posted Seminar Reg. Header";
    Editable = false;
    Caption = 'Posted Seminar Registration';

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
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.';


                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the value of the Starting Date field.';

                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar No.';
                    ToolTip = 'Specifies the value of the Seminar No. field.';

                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Name';
                    ToolTip = 'Specifies the value of the Seminar Name field.';

                }

                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Instructor No.';
                    ToolTip = 'Specifies the value of the Instructor No. field.';

                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;
                    Caption = 'Instructor Name';
                    ToolTip = 'Specifies the value of the Instructor Name field.';

                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the value of the Posting Date field.';

                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the value of the Document Date field.';

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                    ToolTip = 'Specifies the value of the Status field.';

                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Duration';
                    ToolTip = 'Specifies the value of the Duration field.';

                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Participants';
                    ToolTip = 'Specifies the value of the Minimum Participants field.';

                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Participants';
                    ToolTip = 'Specifies the value of the Maximum Participants field.';

                }

            }

            group("Seminar Room")
            {
                Caption = 'Seminar Room';

                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Room No.';
                    ToolTip = 'Specifies the value of the Room No. field.';

                }
                field("Room Name"; Rec."Room Name")
                {
                    ApplicationArea = All;
                    Caption = 'Room Name';
                    ToolTip = 'Specifies the value of the Room Name field.';

                }
                field("Room Address"; Rec."Room Address")
                {
                    ApplicationArea = All;
                    Caption = 'Room Address';
                    ToolTip = 'Specifies the value of the Room Address field.';

                }
                field("Room Address 2"; Rec."Room Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Room Address 2';
                    ToolTip = 'Specifies the value of the Room Address 2 field.';

                }
                field("Room Post Code"; Rec."Room Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Room Post Code';
                    ToolTip = 'Specifies the value of the Room Post Code field.';

                }
                field("Room City"; Rec."Room City")
                {
                    ApplicationArea = All;
                    Caption = 'Room City';
                    ToolTip = 'Specifies the value of the Room City field.';

                }
                field("Room Country/Reg. Code"; Rec."Room Country/Reg. Code")
                {
                    ApplicationArea = All;
                    Caption = 'Room Country/Reg. Code';
                    ToolTip = 'Specifies the value of the Room Country/Reg. Code field.';

                }
                field("Room County"; Rec."Room County")
                {
                    ApplicationArea = All;
                    Caption = 'Room County';
                    ToolTip = 'Specifies the value of the Room County field.';

                }
            }
            part("Lines"; "Posted Seminar Reg. Subform")
            {

                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                Caption = 'Seminar Registration Subform';

            }

            group("Invoicing")
            {
                Caption = 'Invoicing';

                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';

                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';
                    ToolTip = 'Specifies the value of the Seminar Price field.';

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
                RunPageView = where("Document Type" = const(1));
                RunPageLink = "No." = field("No.");
                Image = Comment;
                Caption = 'Comments';
                ToolTip = 'Executes the Comments action.';
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
                ToolTip = 'Executes the Costs action.';
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
                    Navigate.SetDoc(Rec."Posting Date", Rec."No.");
                    Navigate.RUN;
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
        Navigate: page Navigate;

}