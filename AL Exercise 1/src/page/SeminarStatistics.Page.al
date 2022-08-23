page 50200 "Seminar Statistics"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Seminar;
    LinksAllowed = false;
    Editable = false;
    Caption = 'Seminar Statistics';

    layout
    {

        area(Content)
        {
            fixed(General)
            {
                Caption = 'General';

                group(a)
                {

                    Caption = 'This Period';
                    field(SeminarDateName; SeminarDateName[1])
                    {
                        ApplicationArea = All;
                        Caption = 'SeminarDateName[1]';
                        ToolTip = 'Specifies the value of the SeminarDateName[1] field.';
                    }
                    field(TotalPrice; TotalPrice[1])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPrice[1]';
                        ToolTip = 'Specifies the value of the TotalPrice[1] field.';
                    }
                    field(TotalPriceNotChargeable; TotalPriceNotChargeable[1])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPriceNotChargeable[1]';
                        ToolTip = 'Specifies the value of the TotalPriceNotChargeable[1] field.';
                    }
                    field(TotalPriceChargeable; TotalPriceChargeable[1])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPriceChargeable[1]';
                        ToolTip = 'Specifies the value of the TotalPriceChargeable[1] field.';
                    }

                }
                group(b)
                {
                    Caption = 'This Year';

                    field(SeminarDateName2; SeminarDateName[2])
                    {
                        ApplicationArea = All;
                        Caption = 'SeminarDateName[2]';
                        ToolTip = 'Specifies the value of the SeminarDateName[2] field.';
                    }
                    field(TotalPrice2; TotalPrice[2])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPrice[2]';
                        ToolTip = 'Specifies the value of the TotalPrice[2] field.';
                    }
                    field(TotalPriceNotChargeable2; TotalPriceNotChargeable[2])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPriceNotChargeable[2]';
                        ToolTip = 'Specifies the value of the TotalPriceNotChargeable[2] field.';
                    }
                    field(TotalPriceChargeable2; TotalPriceChargeable[2])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPriceChargeable[2]';
                        ToolTip = 'Specifies the value of the TotalPriceChargeable[2] field.';
                    }

                }

                group(c)
                {
                    Caption = 'Last Year';

                    field(SeminarDateName3; SeminarDateName[3])
                    {
                        ApplicationArea = All;
                        Caption = 'SeminarDateName[3]';
                        ToolTip = 'Specifies the value of the SeminarDateName[3] field.';
                    }
                    field(TotalPrice3; TotalPrice[3])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPrice[3]';
                        ToolTip = 'Specifies the value of the TotalPrice[3] field.';
                    }
                    field(TotalPriceNotChargeable3; TotalPriceNotChargeable[3])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPriceNotChargeable[3]';
                        ToolTip = 'Specifies the value of the TotalPriceNotChargeable[3] field.';
                    }
                    field(TotalPriceChargeable3; TotalPriceChargeable[3])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPriceChargeable[3]';
                        ToolTip = 'Specifies the value of the TotalPriceChargeable[3] field.';
                    }
                }
                group(d)
                {
                    Caption = 'To Date';

                    field(SeminarDateName4; SeminarDateName[4])
                    {
                        ApplicationArea = All;
                        Caption = 'SeminarDateName[4]';
                        ToolTip = 'Specifies the value of the SeminarDateName[4] field.';
                    }
                    field(TotalPrice4; TotalPrice[4])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPrice[4]';
                        ToolTip = 'Specifies the value of the TotalPrice[4] field.';
                    }
                    field(TotalPriceNotChargeable4; TotalPriceNotChargeable[4])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPriceNotChargeable[4]';
                        ToolTip = 'Specifies the value of the TotalPriceNotChargeable[4] field.';
                    }
                    field(TotalPriceChargeable4; TotalPriceChargeable[4])
                    {
                        ApplicationArea = All;
                        Caption = 'TotalPriceChargeable[4]';
                        ToolTip = 'Specifies the value of the TotalPriceChargeable[4] field.';
                    }
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
                Caption = 'ActionName';
                ToolTip = 'Executes the ActionName action.';

                trigger OnAction()
                begin

                end;
            }
        }

    }


    var
        DateFilterCalc: Codeunit "DateFilter-Calc";
        SeminarDateFilter: Array[4] of Text[30];
        SeminarDateName: Array[4] of Text[30];
        CurrentDate: Date;
        TotalPrice: Array[4] of Decimal;
        TotalPriceNotChargeable: Array[4] of Decimal;
        TotalPriceChargeable: Array[4] of Decimal;
        I: Integer;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin

        Rec.SETRANGE("No.", Rec."No.");
        IF CurrentDate <> WORKDATE THEN BEGIN
            CurrentDate := WORKDATE;

            DateFilterCalc.CreateAccountingPeriodFilter(SeminarDateFilter[1], SeminarDateName[1], CurrentDate, 0);

            DateFilterCalc.CreateFiscalYearFilter(SeminarDateFilter[2], SeminarDateName[2], CurrentDate, 0);

            DateFilterCalc.CreateFiscalYearFilter(SeminarDateFilter[3], SeminarDateName[3], CurrentDate, -1);
        END;
        FOR I := 1 TO 4 DO BEGIN
            Rec.SETFILTER("Date Filter", SeminarDateFilter[I]);
            Rec.CALCFIELDS("Total Price", "Total Price (Not Chargeable)", "Total Price (Chargeable)");
            TotalPrice[I] := Rec."Total Price";
            TotalPriceNotChargeable[I] := Rec."Total Price (Not Chargeable)";
            TotalPriceChargeable[I] := Rec."Total Price (Chargeable)";
        END;
        Rec.SETRANGE("Date Filter", 0D, CurrentDate);

    end;

}