codeunit 50181 "Seminar Jnl.-Post Line"
{
    TableNo = "Seminar Journal Line";
    trigger OnRun()
    begin
        RunWithCheck(Rec);
    end;

    var
        SeminarJnlLine: Record "Seminar Journal Line";
        SeminarLedgerEntry: Record "Seminar Ledger Entry";
        SeminarRegister: Record "Seminar Register";
        "SeminarJnlCheckLine": Codeunit "Seminar Jnl.-Check Line";
        NextEntryNo: Integer;

    procedure RunWithCheck(var SeminarJnlLine: Record "Seminar Journal Line")
    var
        SeminarJnlLine2: Record "Seminar Journal Line";
    begin
        SeminarJnlLine.COPY(SeminarJnlLine2);
        "Code";
        SeminarJnlLine2 := SeminarJnlLine;
    end;

    local procedure "Code"()
    var
        myInt: Integer;
    begin

        if SeminarJnlLine.EmptyLine() then begin
            exit;
        end;

        SeminarJnlCheckLine.RunCheck(SeminarJnlLine);
        IF NextEntryNo = 0 THEN BEGIN
            SeminarLedgerEntry.LOCKTABLE;
            IF SeminarLedgerEntry.FINDLAST THEN
                NextEntryNo := SeminarLedgerEntry."Entry No.";
            NextEntryNo := NextEntryNo + 1;
        END;
        IF SeminarJnlLine."Document Date" = 0D THEN
            SeminarJnlLine."Document Date" := SeminarJnlLine."Posting Date";
        IF SeminarRegister."No." = 0 THEN BEGIN
            SeminarRegister.LOCKTABLE;
            IF (NOT SeminarRegister.FINDLAST) OR (SeminarRegister."To Entry No." <> 0)
           THEN BEGIN
                SeminarRegister.INIT;
                SeminarRegister."No." := SeminarRegister."No." + 1;
                SeminarRegister."From Entry No." := NextEntryNo;
                SeminarRegister."To Entry No." := NextEntryNo;
                SeminarRegister."Creation Date" := TODAY;
                SeminarRegister."Source Code" := SeminarJnlLine."Source Code";
                SeminarRegister."Journal Batch Name" := SeminarJnlLine."Journal Batch Name";
                SeminarRegister."User ID" := USERID;
                SeminarRegister.INSERT;
            END;
        END;
        SeminarRegister."To Entry No." := NextEntryNo;
        SeminarRegister.MODIFY;



    end;

}