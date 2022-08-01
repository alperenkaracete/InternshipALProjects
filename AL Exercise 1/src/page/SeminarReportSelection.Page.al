page 50205 "Seminar Report Selection"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Report Selections";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Usage; ReportUsage2)
                {
                    ApplicationArea = All;
                    OptionCaption =
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        SetUsageFilter;
                        ReportUsage2OnAfterValidate;
                    end;

                }
            }
            repeater(asd)
            {
                field(Sequence; Sequence)
                {
                    ApplicationArea = All;
                }
                field("Report ID"; "Report ID")
                {
                    ApplicationArea = All;
                }
                field("Report Name"; "Report Name")
                {
                    ApplicationArea = All;
                }
                field(Sequence; Sequence)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;


    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        SetFilter;
    end;

    trigger OnNewRecord()
    var
        myInt: Integer;
    begin
        NewRecord;
    end;
}