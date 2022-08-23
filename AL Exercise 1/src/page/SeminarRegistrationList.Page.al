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
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Participants';
                    ToolTip = 'Specifies the value of the Maximum Participants field.';

                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    Caption = 'Room No.';
                    ToolTip = 'Specifies the value of the Room No. field.';

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
                ToolTip = 'Executes the Comment action.';

            }
            action(Costs)
            {
                ApplicationArea = All;
                RunObject = page "Seminar Charges";
                RunPageLink = "No." = field("No.");
                Image = Costs;
                Caption = 'Costs';
                ToolTip = 'Executes the Costs action.';

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
                ToolTip = 'Executes the Posting action.';
                trigger OnAction()
                begin

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
                    Rec.ShowDocDim;
                end;
            }
        }
    }

    var
        myInt: Integer;
}