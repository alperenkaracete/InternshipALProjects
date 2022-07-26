codeunit 50184 "Seminar-Post"
{
    TableNo = "Seminar Registration Header";
    trigger OnRun()
    begin

    end;

    var
        SeminarRegHeader: Record "Seminar Registration Header";
        SeminarRegLine: Record "Seminar Registration Line";
        PstdSeminarRegHeader: Record "Posted Seminar Reg. Header";
        PstdSeminarRegLine: Record "Posted Seminar Reg. Line";
        SeminarCommentLine: Record "Seminar Comment Line";
        SeminarCommentLine2: Record "Seminar Comment Line";
        SeminarCharge: Record "Seminar Charge";
        PstdSeminarCharge: Record "Posted Seminar Charge";
        Room: Record 156;
        Instructor: Record 156;
        Customer: Record 18;
        ResLedgEntry: Record 203;
        SeminarJnlLine: Record "Seminar Journal Line";
        SourceCodeSetup: Record 242;
        ResJnlLine: Record 207;
        //PostResJnLine:
        SeminarJnlPostLine: Codeunit "Seminar Jnl.-Post Line";
        ResJnlPostLine: Codeunit 212;
        NoSeriesMgt: Codeunit 396;
        DimMgt: Codeunit 408;
        Window: Dialog;
        SourceCode: Code[10];
        LineCount: Integer;
        Text001: TextConst ENU = 'There is no participant to post.';
        Text002: TextConst ENU = 'Posting lines              #2######\';
        Text003: TextConst ENU = 'Registration';
        Text004: TextConst ENU = 'Registration %1  -> Posted Reg. %2';
        Text005: TextConst ENU = 'The combination of dimensions used in %1 is blocked. %2';
        Text006: TextConst ENU = 'The combination of dimensions used in %1,  line no. %2 is blocked. %3';
        Text007: TextConst ENU = 'The dimensions used in %1 are invalid. %2';
        Text008: TextConst ENU = 'The dimensions used in %1, line no. %2 are invalid. %3';



    LOCAL PROCEDURE CopyCommentLines(FromDocumentType: Integer; ToDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20]): Integer;
    BEGIN
        SeminarCommentLine.Reset();
        SeminarCommentLine.SetRange("Document Type", FromDocumentType);
        SeminarCommentLine.SETRANGE("No.", FromNumber);
        IF SeminarCommentLine.FINDSET(FALSE, FALSE) THEN BEGIN
            REPEAT
                SeminarCommentLine2 := SeminarCommentLine;
                SeminarCommentLine2."Document Type" := ToDocumentType;
                SeminarCommentLine2."No." := ToNumber;
                SeminarCommentLine2.INSERT;
            UNTIL SeminarCommentLine.NEXT = 0;
        END;

    END;

    LOCAL PROCEDURE CopyCharges(FromNumber: Code[20]; ToNumber: Code[20]): Code[20];
    BEGIN

        SeminarCharge.Reset();
        SeminarCharge.SetRange("Document No.", FromNumber);
        IF SeminarCharge.FINDSET(FALSE, FALSE) THEN BEGIN
            REPEAT
                PstdSeminarCharge.TransferFields(SeminarCharge);
                PstdSeminarCharge."Document No." := ToNumber;
                PstdSeminarCharge.INSERT;
            UNTIL SeminarCharge.NEXT = 0;
        END;
    END;

    LOCAL PROCEDURE PostResJnlLine(Resource: Record 156): Integer;

    BEGIN

        Resource.TestField("Quantity Per Day");
        ResJnlLine.Init();
        ResJnlLine."Entry Type" := ResJnlLine."Entry Type"::Usage;
        ResJnlLine."Document No." := PstdSeminarRegHeader."No.";
        ResJnlLine."Resource No." := Resource."No.";
        ResJnlLine."Posting Date" := SeminarRegHeader."Posting Date";
        ResJnlLine."Reason Code" := SeminarRegHeader."Reason Code";
        ResJnlLine.Description := SeminarRegHeader."Seminar Name";
        ResJnlLine."Gen. Prod. Posting Group" := SeminarRegHeader."Gen. Prod. Posting Group";
        ResJnlLine."Posting No. Series" := SeminarRegHeader."Posting No. Series";
        ResJnlLine."Source Code" := SourceCode;
        ResJnlLine."Resource No." := Resource."No.";
        ResJnlLine."Unit of Measure Code" := Resource."Base Unit of Measure";
        ResJnlLine."Unit Cost" := Resource."Unit Cost";
        ResJnlLine."Qty. per Unit of Measure" := 1;
        ResJnlLine.Quantity := SeminarRegHeader."Duration" * Resource."Quantity Per Day";
        ResJnlLine."Total Cost" := ResJnlLine."Unit Cost" * ResJnlLine.Quantity;
        ResJnlLine."Seminar No." := SeminarRegHeader."Seminar No.";
        ResJnlLine."Seminar Registration No." := PstdSeminarRegHeader."No.";
        ResJnlPostLine.RunWithCheck(ResJnlLine);
        ResLedgEntry.FindLast();
        exit(ResLedgEntry."Entry No.");

    END;

    LOCAL PROCEDURE PostSeminarJnlLine(ChargeType: Option "Instructor","Room","Participant","Charge");
    BEGIN

        SeminarJnlLine.INIT;
        SeminarJnlLine."Seminar No." := SeminarRegHeader."Seminar No.";
        SeminarJnlLine."Posting Date" := SeminarRegHeader."Posting Date";
        SeminarJnlLine."Document Date" := SeminarRegHeader."Document Date";
        SeminarJnlLine."Document No." := PstdSeminarRegHeader."No.";
        SeminarJnlLine."Charge Type" := ChargeType;
        SeminarJnlLine."Instructor Resource No." := SeminarRegHeader."Instructor Resource No.";
        SeminarJnlLine."Starting Date" := SeminarRegHeader."Starting Date";
        SeminarJnlLine."Seminar Registration No." := PstdSeminarRegHeader."No.";
        SeminarJnlLine."Room Resource No." := SeminarRegHeader."Room Resource No.";
        SeminarJnlLine."Source Type" := SeminarJnlLine."Source Type"::Seminar;
        SeminarJnlLine."Source No." := SeminarRegHeader."Seminar No.";
        SeminarJnlLine."Source Code" := SourceCode;
        SeminarJnlLine."Reason Code" := SeminarRegHeader."Reason Code";
        SeminarJnlLine."Posting No. Series" := SeminarRegHeader."Posting No. Series";

        CASE ChargeType OF
            ChargeType::Instructor:
                BEGIN
                    Instructor.GET(SeminarRegHeader."Instructor Resource No.");
                    SeminarJnlLine.Description := Instructor.Name;
                    SeminarJnlLine.Type := SeminarJnlLine.Type::Resource;
                    SeminarJnlLine.Chargeable := FALSE;
                    SeminarJnlLine.Quantity := SeminarRegHeader.Duration;
                    SeminarJnlLine."Res. Ledger Entry No." := PostResJnlLine(Instructor);

                END;
            ChargeType::Room:
                BEGIN
                    Room.GET(SeminarRegHeader."Room Resource No.");
                    SeminarJnlLine.Description := Room.Name;
                    SeminarJnlLine.Type := SeminarJnlLine.Type::Resource;
                    SeminarJnlLine.Chargeable := FALSE;
                    SeminarJnlLine.Quantity := SeminarRegHeader.Duration;
                    // Post to resource ledger
                    SeminarJnlLine."Res. Ledger Entry No." := PostResJnlLine(Room);
                END;
            ChargeType::Participant:
                BEGIN
                    SeminarJnlLine."Bill-to Customer No." := SeminarRegLine."Bill-to Customer No.";
                    SeminarJnlLine."Participant Contact No." := SeminarRegLine."Participant Contact No.";
                    SeminarJnlLine."Participant Name" := SeminarRegLine."Participant Name";
                    SeminarJnlLine.Description := SeminarRegLine."Participant Name";
                    SeminarJnlLine.Type := SeminarJnlLine.Type::Resource;
                    SeminarJnlLine.Chargeable := SeminarRegLine."To Invoice";
                    SeminarJnlLine.Quantity := 1;
                    SeminarJnlLine."Unit Price" := SeminarRegLine.Amount;
                    SeminarJnlLine."Total Price" := SeminarRegLine.Amount;
                END;
            ChargeType::Charge:
                BEGIN
                    SeminarJnlLine.Description := SeminarCharge.Description;
                    SeminarJnlLine."Bill-to Customer No." := SeminarCharge."Bill-to Customer No.";
                    SeminarJnlLine.Type := SeminarCharge.Type;
                    SeminarJnlLine.Quantity := SeminarCharge.Quantity;
                    SeminarJnlLine."Unit Price" := SeminarCharge."Unit Price";
                    SeminarJnlLine."Total Price" := SeminarCharge."Total Price";
                    SeminarJnlLine.Chargeable := SeminarCharge."To Invoice";
                END;
        END;
        SeminarJnlPostLine.RunWithCheck(SeminarJnlLine);
    END;

    LOCAL PROCEDURE PostCharges()
    BEGIN
    END;
}