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
                    ToolTip = 'Specifies the value of the No. field.';

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
                    ToolTip = 'Specifies the value of the Name field.';

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
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    Caption = 'Search Name';
                    ToolTip = 'Specifies the value of the Search Name field.';

                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Duration';
                    ToolTip = 'Specifies the value of the Seminar Duration field.';

                }
                field("Blocked"; Rec."Blocked")
                {
                    ApplicationArea = All;
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the value of the Blocked field.';

                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the value of the Last Date Modified field.';

                }

            }

            group(Invoicing)
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
                ToolTip = 'Executes the Show Comment Sheet Page action.';

                trigger OnAction()
                begin

                end;
            }

            group("Related Infromation Menu")
            {
                Caption = 'Related Infromation Menu';

                action("Statistics")
                {
                    ApplicationArea = All;

                    RunObject = page "Seminar Statistics";
                    Image = Statistics;
                    RunPageLink = "No." = field("No.");
                    Caption = 'Statistics';
                    ToolTip = 'Executes the Statistics action.';
                }
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
                ToolTip = 'Executes the Seminar Registration action.';

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
                    ToolTip = 'Executes the Seminar Ledger Entries action.';

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
                    ToolTip = 'Executes the &Registrations action.';

                    trigger OnAction()
                    begin

                    end;
                }
            }

            action("Dimensions")
            {
                ApplicationArea = All;
                RunObject = page "Default Dimensions";
                RunPageLink = "Table ID" = const(50156), "No." = field("No.");
                Image = Dimensions;
                Caption = 'Dimensions';
                ToolTip = 'Executes the Dimensions action.';

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;

}