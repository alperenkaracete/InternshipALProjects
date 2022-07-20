table 50156 "Seminar"
{
    DataClassification = CustomerContent;



    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    SeminarSetup.GET;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                END;
            end;

        }
        field(2; Name; Text[50])
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var

            begin
                IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN BEGIN
                    "Search Name" := Name;
                END;
            end;
        }
        field(3; "Seminar Duration"; Decimal)
        {
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 1;

        }
        field(4; "Minimum Participants"; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(5; "Maximum Participants"; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(6; "Search Name"; Code[50])
        {
            DataClassification = CustomerContent;

        }
        field(7; "Blocked"; Boolean)
        {
            DataClassification = CustomerContent;

        }
        field(8; "Last Date Modified"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(9; "Comment"; Boolean)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Comment Line" where("Table Name" = const(Seminar), "No." = field("No.")));

        }
        field(10; "Seminar Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
            AutoFormatType = 1;
        }
        field(11; "Gen. Prod. Posting Group"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate()
            var

            begin
                IF xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" THEN BEGIN
                    IF
                   GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "VAT Prod. Posting Group") THEN BEGIN
                        VALIDATE("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                    END;
                END;
            end;
        }
        field(12; "VAT Prod. Posting Group"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "VAT Product Posting Group";
        }
        field(13; "No. Series"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        SeminarSetup: Record "Seminar Setup";
        CommentLine: Record "Comment Line";

        Seminar: Record "Seminar";

        GenProdPostingGroup: Record "Gen. Product Posting Group";

        NoSeriesMgt: Codeunit "NoSeriesManagement";


    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            SeminarSetup.GET;
            SeminarSetup.TESTFIELD("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        END;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;

    end;

    trigger OnDelete()
    begin
        CommentLine.RESET;
        CommentLine.SETRANGE("Table Name", CommentLine."Table Name"::Seminar);
        CommentLine.SETRANGE("No.", "No.");
        CommentLine.DELETEALL;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    procedure AssistEdit(): Boolean
    var
        myInt: Integer;
    begin
        WITH Seminar DO BEGIN
            Seminar := Rec;
            SeminarSetup.GET;
            SeminarSetup.TESTFIELD("Seminar Nos.");
            IF NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") THEN BEGIN
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                EXIT(TRUE);
            END;
        END;
    end;

}