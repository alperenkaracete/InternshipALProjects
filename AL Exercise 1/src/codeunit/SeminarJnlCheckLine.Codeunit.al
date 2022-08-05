codeunit 50180 "Seminar Jnl.-Check Line"
{
    TableNo = "Seminar Journal Line";

    trigger OnRun()
    begin
        RunCheck(Rec);
    end;

    var
        "GLSetup": Record "General Ledger Setup";
        "UserSetup": Record "User Setup";
        "AllowPostingFrom": Date;
        "AllowPostingTo": Date;
        DimMgt: Codeunit DimensionManagement;

        Text000: TextConst ENU = 'cannot be a closing date.';
        Text001: TextConst ENU = 'is not within your range of allowed posting dates.';
        Text002: TextConst ENU = 'The combination of dimensions used in %1 %2, %3, %4 is blocked. %5';
        Text003: TextConst ENU = 'A dimension used in %1 %2, %3, %4 has caused an error. %5';

    procedure RunCheck(SemJnlLine: Record "Seminar Journal Line")
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];

    begin

        IF SemJnlLine.EmptyLine THEN
            EXIT;
        SemJnlLine.TESTFIELD("Posting Date");
        SemJnlLine.TESTFIELD("Instructor Resource No.");
        SemJnlLine.TESTFIELD("Seminar No.");

        CASE SemJnlLine."Charge Type" OF
            SemJnlLine."Charge Type"::Instructor:
                SemJnlLine.TESTFIELD("Instructor Resource No.");
            SemJnlLine."Charge Type"::Room:
                SemJnlLine.TESTFIELD("Room Resource No.");
            SemJnlLine."Charge Type"::Participant:
                SemJnlLine.TESTFIELD("Participant Contact No.");
        END;

        IF SemJnlLine."Chargeable" THEN
            SemJnlLine.TESTFIELD("Bill-to Customer No.");

        IF SemJnlLine."Posting Date" = CLOSINGDATE(SemJnlLine."Posting Date") THEN
            SemJnlLine.FIELDERROR("Posting Date", Text000);

        IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
            IF USERID <> '' THEN
                IF UserSetup.GET(USERID) THEN BEGIN
                    AllowPostingFrom := UserSetup."Allow Posting From";
                    AllowPostingTo := UserSetup."Allow Posting To";
                END;
            IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
                GLSetup.GET;
                AllowPostingFrom := GLSetup."Allow Posting From";
                AllowPostingTo := GLSetup."Allow Posting To";
            END;
            IF AllowPostingTo = 0D THEN
                AllowPostingTo := 99991231D;
        END;
        IF (SemJnlLine."Posting Date" < AllowPostingFrom) OR (SemJnlLine."Posting Date" > AllowPostingTo)
        THEN
            SemJnlLine.FIELDERROR("Posting Date", Text001);
        IF (SemJnlLine."Document Date" <> 0D) THEN
            IF (SemJnlLine."Document Date" = CLOSINGDATE(SemJnlLine."Document Date")) THEN
                SemJnlLine.FIELDERROR("Document Date", Text000);

        IF NOT DimMgt.CheckDimIDComb(SemJnlLine."Dimension Set ID") THEN
            ERROR(
            Text002,
           SemJnlLine.TABLECAPTION, SemJnlLine."Journal Template Name",
            SemJnlLine."Journal Batch Name", SemJnlLine."Line No.",
            DimMgt.GetDimCombErr);
        TableID[1] := DATABASE::Seminar;
        No[1] := SemJnlLine."Seminar No.";
        TableID[2] := DATABASE::Resource;
        No[2] := SemJnlLine."Instructor Resource No.";
        TableID[3] := DATABASE::Resource;
        No[3] := SemJnlLine."Room Resource No.";
        IF NOT DimMgt.CheckDimValuePosting(TableID, No, SemJnlLine."Dimension Set ID") THEN
            IF SemJnlLine."Line No." <> 0 THEN
                ERROR(Text003, SemJnlLine.TABLECAPTION, SemJnlLine."Journal Template Name", SemJnlLine."Journal Batch Name", SemJnlLine."Line No.", DimMgt.GetDimValuePostingErr)
            ELSE
                ERROR(DimMgt.GetDimValuePostingErr);
    end;



}