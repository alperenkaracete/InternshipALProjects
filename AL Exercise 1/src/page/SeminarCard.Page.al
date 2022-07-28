page 50156 "Seminar Card"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = "Seminar";
    Caption = 'Seminar Card';


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

                    trigger OnAssistEdit()
                    var
                        myInt: Integer;
                    begin
                        IF Rec.AssistEdit THEN
                            CurrPage.UPDATE;
                    end;

                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';

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
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    Caption = 'Search Name';

                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Duration';

                }
                field("Blocked"; Rec."Blocked")
                {
                    ApplicationArea = All;
                    Caption = 'Blocked';

                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    Caption = 'Last Date Modified';

                }

            }

            group(Invoicing)
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
    }


    actions
    {
        area(Processing)
        {
            action("Show Comment Sheet Page")
            {
                ApplicationArea = All;
                Image = Comment;
                RunObject = page "Comment Sheet";
                RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                Caption = 'Show Comment Sheet Page';

                trigger OnAction()
                begin

                end;
            }

            action("Seminar Registration")
            {
                ApplicationArea = All;
                RunObject = page "Seminar Registration";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                Promoted = true;
                PromotedIsBig = true;
                Image = NewTimesheet;
                Caption = 'Seminar Registration';

                trigger OnAction()
                begin

                end;
            }
            group("Ledger Entries")
            {
                Caption = 'Ledger Entries';

                action("Seminar Ledger Entries")
                {
                    ApplicationArea = All;
                    RunObject = page "Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field("No.");
                    ShortcutKey = 'Ctrl + F7';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = WarrantyLedger;
                    Caption = 'Seminar Ledger Entries';

                    trigger OnAction()
                    begin

                    end;
                }
            }

            group(Registrations)
            {
                Caption = 'Registrations';

                action("&Registrations")
                {
                    ApplicationArea = All;
                    RunObject = page "Seminar Registration List";
                    RunPageLink = "No." = field("No.");
                    PromotedCategory = Process;
                    Promoted = true;
                    Image = Timesheet;
                    Caption = '&Registrations';

                    trigger OnAction()
                    begin

                    end;
                }
            }
        }
    }

    var
        myInt: Integer;

}