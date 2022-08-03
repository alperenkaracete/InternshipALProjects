page 50157 "Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Seminar;
    CardPageId = "Seminar Card";
    Caption = 'Seminar List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                Caption = 'GroupName';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';


                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';

                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Duration';

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';

                }
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

            group("Related Infromation Menu")
            {

                action("Statistics")
                {
                    ApplicationArea = All;
                    RunObject = page "Seminar Statistics";
                    Image = Statistics;
                    RunPageLink = "No." = field("No.");

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

            group(Dimensions)
            {
                action("Dimensions-Single")
                {
                    ApplicationArea = All;
                    RunObject = page "Default Dimensions";
                    RunPageLink = "Table ID" = const(50156), "No." = field("No.");
                    Image = Dimensions;

                    trigger OnAction()
                    begin

                    end;
                }
                action("Dimensions-Multiple")
                {
                    ApplicationArea = All;
                    Image = DimensionSets;
                    trigger OnAction()
                    var
                        Seminar: Record Seminar;

                        DefaultDimMultiple: Page "Default Dimensions-Multiple";
                    begin

                        CurrPage.SETSELECTIONFILTER(Seminar);
                        DefaultDimMultiple.SetMultiSeminar(Seminar);
                        DefaultDimMultiple.RUNMODAL;

                    end;
                }
            }
        }
    }

    var
        myInt: Integer;
}