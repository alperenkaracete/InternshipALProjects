codeunit 50599 "FindRecords"
{
    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnFindRecordsOnAfterSetSource', '', false, false)]

    procedure OnFindRecordsOnAfterSetSource(var DocumentEntry: Record "Document Entry"; var PostingDate: Date; var DocType2: Text[100]; var DocNo: Code[20]; var SourceType2: Integer; var SourceNo: Code[20]; var DocNoFilter: Text; var PostingDateFilter: Text; var IsHandled: Boolean)
    var
        PostedSeminarRegHeader: Record "Posted Seminar Reg. Header";
        SeminarLedgEntry: Record "Seminar Ledger Entry";

    begin
        if PostedSeminarRegHeader.ReadPermission then begin

            PostedSeminarRegHeader.Reset();
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            DocumentEntry.Init();
            DocumentEntry."Entry No." := DocumentEntry."Entry No." + 1;
            DocumentEntry."Table ID" := DATABASE::"Posted Seminar Reg. Header";
            DocumentEntry."Document Type" := "Document Entry Document Type"::Quote;
            DocumentEntry."Table Name" := CopyStr(PostedSeminarRegHeader.TableCaption, 1, MaxStrLen(DocumentEntry."Table Name"));
            DocumentEntry."No. of Records" := PostedSeminarRegHeader.COUNT;
            DocumentEntry.Insert();

        end;

        if SeminarLedgEntry.ReadPermission then begin

            SeminarLedgEntry.Reset();
            SeminarLedgEntry.SETCURRENTKEY("Document No.", "Posting Date");
            SeminarLedgEntry.SETFILTER("Document No.", DocNoFilter);
            SeminarLedgEntry.SETFILTER("Posting Date", PostingDateFilter);
            DocumentEntry.Reset();
            DocumentEntry.Init();
            DocumentEntry."Entry No." := DocumentEntry."Entry No." + 1;
            DocumentEntry."Table ID" := DATABASE::"Seminar Ledger Entry";
            DocumentEntry."Document Type" := "Document Entry Document Type"::Quote;
            DocumentEntry."Table Name" := CopyStr(SeminarLedgEntry.TableCaption, 1, MaxStrLen(DocumentEntry."Table Name"));
            DocumentEntry."No. of Records" := SeminarLedgEntry.COUNT;
            DocumentEntry.Insert();

        end;
    end;
}