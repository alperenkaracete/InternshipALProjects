page 50171 "Seminar Registration List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Registration Header";
    CardPageId = "Seminar Registration";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Group")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;

                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;

                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;

                }


            }


        }

        area(FactBoxes)
        {

            systempart(RecordLinks; Links)
            {

                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {

                ApplicationArea = All;
            }

            part("Seminar Details Fact Box"; "Seminar Details FactBox")
            {

                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Comment)
            {
                ApplicationArea = All;
                RunObject = page "Seminar Comment Sheet";
                RunPageView = where("No." = const());
                RunPageLink = "Comment" = field("No.");
                Image = Comment;

            }
            action(Costs)
            {
                ApplicationArea = All;
                RunObject = page "Seminar Charges";
                RunPageLink = "No." = field("No.");
                Image = Costs;

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