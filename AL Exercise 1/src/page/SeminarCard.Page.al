page 50156 "Seminar Card"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = "Seminar";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    var
                        myInt: Integer;
                    begin
                        IF AssistEdit THEN
                            CurrPage.UPDATE;
                    end;

                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;

                }
                field("Minimum Participants"; "Minimum Participants")
                {
                    ApplicationArea = All;

                }
                field("Maximum Participants"; "Maximum Participants")
                {
                    ApplicationArea = All;

                }
                field("Search Name"; "Search Name")
                {
                    ApplicationArea = All;

                }
                field("Seminar Duration"; "Seminar Duration")
                {
                    ApplicationArea = All;

                }
                field("Blocked"; "Blocked")
                {
                    ApplicationArea = All;

                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = All;

                }

            }

            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;

}