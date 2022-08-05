page 50171 "Seminar Registration List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Registration Header";
    CardPageId = "Seminar Registration";
    Editable = false;
    Caption = 'Seminar Registration List';

    layout
    {
        area(Content)
        {
            repeater("Group")
            {
                Caption = 'Group';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';

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
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Participants';

                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Room No.';

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
                Caption = 'Seminar Details FactBox';
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
                Caption = 'Comment';

            }
            action(Costs)
            {
                ApplicationArea = All;
                RunObject = page "Seminar Charges";
                RunPageLink = "No." = field("No.");
                Image = Costs;
                Caption = 'Costs';

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
            action(Dimensions)
            {
                ApplicationArea = All;
                Image = Dimensions;
                ShortcutKey = 'Shift+Ctrl+D';


                trigger OnAction()
                begin
                    ShowDocDim;
                end;
            }
        }
    }

    var
        myInt: Integer;
}