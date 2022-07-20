page 50157 "Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Seminar;
    CardPageId = "Seminar Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;


                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;

                }
                field("Seminar Duration"; "Seminar Duration")
                {
                    ApplicationArea = All;

                }
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;

                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;

                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
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