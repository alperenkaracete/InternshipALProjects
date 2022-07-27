codeunit 50184 "Seminar-Post"
{
    TableNo = "Seminar Registration Header";
    trigger OnRun()
    begin
        ClearAll();
        SeminarRegHeader := Rec;

        SeminarRegHeader.TestField("Posting Date");
        SeminarRegHeader.TestField("Document Date");
        SeminarRegHeader.TestField("Seminar No.");
        SeminarRegHeader.TestField("Duration");
        SeminarRegHeader.TestField("Instructor Resource No.");
        SeminarRegHeader.TestField("Room Resource No.");
        SeminarRegHeader.TestField(Status, SeminarRegHeader.Status::Closed);
        Rec := SeminarRegHeader;
        SeminarRegLine.Reset();
        SeminarRegLine.SETRANGE("Document No.", Rec."No.");
        IF SeminarRegLine.ISEMPTY THEN
            ERROR(Text001);
        Window.OPEN('#1#################################\\' + Text002);
        Window.UPDATE(1, STRSUBSTNO('%1 %2', Text003, Rec."No."));
        IF SeminarRegHeader."Posting No." = '' THEN BEGIN
            Rec.TESTFIELD(Rec."Posting No. Series");
            Rec."Posting No." := NoSeriesMgt.GetNextNo(Rec."Posting No. Series", Rec."Posting Date", TRUE);
            Rec.MODIFY;
            COMMIT;
        end;
        SeminarRegLine.LOCKTABLE;
        SourceCodeSetup.GET;
        SourceCode := SourceCodeSetup.Seminar;
        PstdSeminarRegHeader.INIT;
        PstdSeminarRegHeader.TRANSFERFIELDS(SeminarRegHeader);
        PstdSeminarRegHeader."No." := Rec."Posting No.";
        PstdSeminarRegHeader."No. Series" := Rec."Posting No. Series";
        PstdSeminarRegHeader."Source Code" := SourceCode;
        PstdSeminarRegHeader."User ID" := USERID;
        PstdSeminarRegHeader.INSERT;
        Window.UPDATE(1, STRSUBSTNO(Text004, Rec."No.", PstdSeminarRegHeader."No."));
        CopyCommentLines(SeminarCommentLine."Document Type"::"Seminar Registration", SeminarCommentLine."Document Type"::"Posted Seminar Registration", Rec."No.", PstdSeminarRegHeader."No.");
        CopyCharges(Rec."No.", PstdSeminarRegHeader."No.");
        LineCount := 0;
        SeminarRegLine.RESET;
        SeminarRegLine.SETRANGE("Document No.", Rec."No.");
        IF SeminarRegLine.FINDSET THEN BEGIN
            REPEAT
                LineCount := LineCount + 1;
                Window.UPDATE(2, LineCount);
                SeminarRegLine.TESTFIELD("Bill-to Customer No.");
                SeminarRegLine.TESTFIELD("Participant Contact No.");
                IF NOT SeminarRegLine."To Invoice" THEN BEGIN
                    SeminarRegLine."Seminar Price" := 0;
                    SeminarRegLine."Line Discount %" := 0;
                    SeminarRegLine."Line Discount Amount" := 0;
                    SeminarRegLine.Amount := 0;
                END;
                // Post seminar entry
                PostSeminarJnlLine(2); // Participant
                // Insert posted seminar registration line
                PstdSeminarRegLine.INIT;
                PstdSeminarRegLine.TRANSFERFIELDS(SeminarRegLine);
                PstdSeminarRegLine."Document No." := PstdSeminarRegHeader."No.";
                PstdSeminarRegLine.INSERT;

            UNTIL SeminarRegLine.NEXT = 0;
            // Post charges to seminar ledger
            PostCharges;
            // Post instructor to seminar ledger
            PostSeminarJnlLine(0); // Instructor
            PostSeminarJnlLine(1); // Room
            Rec.DELETE;
            SeminarRegLine.DELETEALL;
            SeminarCommentLine.SETRANGE("Document Type",
             SeminarCommentLine."Document Type"::"Seminar Registration");
            SeminarCommentLine.SETRANGE("No.", Rec."No.");
            SeminarCommentLine.DELETEALL;
            SeminarCharge.SETRANGE(Description);
            SeminarCharge.DELETEALL;

        END;

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
        SeminarCharge.RESET;
        SeminarCharge.SETRANGE("Document No.", SeminarRegHeader."No.");
        IF SeminarCharge.FindSet(FALSE, FALSE) THEN BEGIN
            REPEAT
                PostSeminarJnlLine(3); // Charge
            UNTIL SeminarCharge.NEXT = 0;
        END;
    END;
}