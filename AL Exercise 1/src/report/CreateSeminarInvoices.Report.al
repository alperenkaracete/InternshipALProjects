report 50200 "Create Seminar Invoices"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    RDLCLayout = 'SeminarInvoices.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(DataItemName; "Seminar Ledger Entry")
        {

        }
    }


    requestpage
    {

        layout
        {

            area(Content)
            {

            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }

        trigger OnOpenPage()
        var
            myInt: Integer;
        begin
            IF PostingDateReq = 0D THEN
                PostingDateReq := WORKDATE;
            IF DocDateReq = 0D THEN
                DocDateReq := WORKDATE;
            SalesSetup.GET;
            CalcInvoiceDiscount := SalesSetup."Calc. Inv. Discount";
        end;
    }

    var
        CurrencyExchRate: Record 330;
        Customer: Record 18;
        GLSetup: Record 98;
        SalesHeader: Record 36;
        SalesLine: Record 37;
        SalesSetup: Record 311;
        SalesCalcDiscount: Codeunit 60;
        SalesPost: Codeunit 80;
        CalcInvoiceDiscount: Boolean;
        PostInvoices: Boolean;
        NextLineNo: Integer;
        NoOfSalesInvErrors: Integer;
        NoOfSalesInv: Integer;
        PostingDateReq: Date;
        DocDateReq: Date;
        Window: Dialog;
        Text028: TextConst ENU = 'Please enter the posting date.';
        Text001: TextConst ENU = 'Please enter the document date.';
        Text002: TextConst ENU = 'Creating Seminar Invoices...\\';
        Text003: TextConst ENU = 'Customer No.      #1##########\';
        Text004: TextConst ENU = 'Registration No.   #2##########\';
        Text005: TextConst ENU = 'The number of invoice(s) created is %1.';
        Text006: TextConst ENU = 'Not all the invoices were posted. A total of %1 invoices were not posted.';
        Text007: TextConst ENU = 'There is nothing to invoice.';
        Seminar: Record "Seminar";

    LOCAL PROCEDURE FinalizeSalesInvoiceHeader();
    BEGIN
    END;

    LOCAL PROCEDURE InsertSalesInvoiceHeader();
    BEGIN
    END;
}