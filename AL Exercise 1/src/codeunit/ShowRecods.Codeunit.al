codeunit 50500 "ShowRecods"
{
    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnBeforeNavigateShowRecords', '', false, false)]
    local procedure OnBeforeNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean; var TempDocumentEntry: Record "Document Entry" temporary; var IsHandled: Boolean; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var ServiceInvoiceHeader: Record "Service Invoice Header"; var ServiceCrMemoHeader: Record "Service Cr.Memo Header"; var SOSalesHeader: Record "Sales Header"; var SISalesHeader: Record "Sales Header"; var SCMSalesHeader: Record "Sales Header"; var SROSalesHeader: Record "Sales Header"; var GLEntry: Record "G/L Entry"; var VATEntry: Record "VAT Entry"; var VendLedgEntry: Record "Vendor Ledger Entry"; var WarrantyLedgerEntry: Record "Warranty Ledger Entry"; var NewSourceRecVar: Variant; var SalesShipmentHeader: Record "Sales Shipment Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; var ReturnShipmentHeader: Record "Return Shipment Header"; var PurchRcptHeader: Record "Purch. Rcpt. Header")
    var
        PostedSeminarRegHeader: Record "Posted Seminar Reg. Header";
        SeminarLedgEntry: Record "Seminar Ledger Entry";
    begin

        if PostedSeminarRegHeader.ReadPermission then begin

            PostedSeminarRegHeader.Reset();
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);


        end;

        if SeminarLedgEntry.ReadPermission then begin

            SeminarLedgEntry.Reset();
            SeminarLedgEntry.SETCURRENTKEY("Document No.", "Posting Date");
            SeminarLedgEntry.SETFILTER("Document No.", DocNoFilter);
            SeminarLedgEntry.SETFILTER("Posting Date", PostingDateFilter);

        end;

        case TempDocumentEntry."Table ID" of

            DATABASE::"Posted Seminar Reg. Header":
                PAGE.RUN(0, PostedSeminarRegHeader);
            DATABASE::"Seminar Ledger Entry":
                PAGE.RUN(0, SeminarLedgEntry);

        end

    end;


}