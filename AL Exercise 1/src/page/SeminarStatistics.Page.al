page 50200 "Seminar Statistics"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Seminar;
    LinksAllowed = false;
    Editable = false;

    layout
    {

        area(Content)
        {
            fixed(General)
            {

                group(a)
                {

                    Caption = 'This Period';
                    field(SeminarDateName; SeminarDateName[1])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPrice; TotalPrice[1])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPriceNotChargeable; TotalPriceNotChargeable[1])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPriceChargeable; TotalPriceChargeable[1])
                    {
                        ApplicationArea = All;
                    }

                }
                group(b)
                {
                    Caption = 'This Year';

                    field(SeminarDateName2; SeminarDateName[2])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPrice2; TotalPrice[2])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPriceNotChargeable2; TotalPriceNotChargeable[2])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPriceChargeable2; TotalPriceChargeable[2])
                    {
                        ApplicationArea = All;
                    }

                }

                group(c)
                {
                    Caption = 'Last Year';

                    field(SeminarDateName3; SeminarDateName[3])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPrice3; TotalPrice[3])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPriceNotChargeable3; TotalPriceNotChargeable[3])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPriceChargeable3; TotalPriceChargeable[3])
                    {
                        ApplicationArea = All;
                    }
                }
                group(d)
                {
                    Caption = 'To Date';

                    field(SeminarDateName4; SeminarDateName[4])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPrice4; TotalPrice[4])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPriceNotChargeable4; TotalPriceNotChargeable[4])
                    {
                        ApplicationArea = All;
                    }
                    field(TotalPriceChargeable4; TotalPriceChargeable[4])
                    {
                        ApplicationArea = All;
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

        SETRANGE("No.", "No.");
        IF CurrentDate <> WORKDATE THEN BEGIN
            CurrentDate := WORKDATE;

            DateFilterCalc.CreateAccountingPeriodFilter(SeminarDateFilter[1], SeminarDateName[1], CurrentDate, 0);

            DateFilterCalc.CreateFiscalYearFilter(SeminarDateFilter[2], SeminarDateName[2], CurrentDate, 0);

            DateFilterCalc.CreateFiscalYearFilter(SeminarDateFilter[3], SeminarDateName[3], CurrentDate, -1);
        END;
        FOR I := 1 TO 4 DO BEGIN
            SETFILTER("Date Filter", SeminarDateFilter[I]);
            CALCFIELDS("Total Price", "Total Price (Not Chargeable)", "Total Price (Chargeable)");
            TotalPrice[I] := "Total Price";
            TotalPriceNotChargeable[I] := "Total Price (Not Chargeable)";
            TotalPriceChargeable[I] := "Total Price (Chargeable)";
        END;
        SETRANGE("Date Filter", 0D, CurrentDate);

    end;

}