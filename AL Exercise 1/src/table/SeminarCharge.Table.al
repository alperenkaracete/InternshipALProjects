table 50167 "Seminar Charge"
{
    Caption = 'Seminar Charge';


    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Seminar Registration Header";
            NotBlank = true;
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            trigger OnValidate()
            BEGIN
                IF Type <> xRec.Type THEN BEGIN
                    Description := '';
                END;
            END;
        }
        field(3; "Type"; Option)
        {
            OptionCaption = 'Resource,G/L Account';
            OptionMembers = "Resource","G/L Account";
            Caption = 'Type';

        }
        field(4; "No."; Code[20])
        {
            TableRelation = IF (Type = CONST(Resource)) Resource."No."
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"."No.";
            Caption = 'No.';
            trigger OnValidate()
            BEGIN
                CASE Type OF
                    Type::Resource:
                        BEGIN
                            Resource.GET("No.");
                            Resource.TESTFIELD(Blocked, FALSE);
                            Resource.TESTFIELD("Gen. Prod. Posting Group");
                            Description := Resource.Name;
                            "Gen. Prod. Posting Group" := Resource."Gen. Prod. Posting Group";
                            "VAT Prod. Posting Group" := Resource."VAT Prod. Posting Group";
                            "Unit of Measure Code" := Resource."Base Unit of Measure";
                            "Unit Price" := Resource."Unit Price";
                        END;
                    Type::"G/L Account":
                        BEGIN
                            GLAccount.GET("No.");
                            GLAccount.CheckGLAcc();
                            GLAccount.TESTFIELD("Direct Posting", TRUE);
                            Description := GLAccount.Name;
                            "Gen. Prod. Posting Group" := GLAccount."Gen. Bus. Posting Group";
                            "VAT Prod. Posting Group" := GLAccount."VAT Bus. Posting Group";
                        END;
                END;
            END;
        }
        field(5; "Description"; Text[50])
        {
            Caption = 'Description';

        }
        field(6; "Quantitiy"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Caption = 'Quantitiy';
            trigger OnValidate()
            BEGIN
                "Total Price" := ROUND("Unit Price" * Quantitiy, 0.01);
            END;

        }
        field(7; "Unit Price"; Decimal)
        {
            MinValue = 0;
            AutoFormatType = 2;
            Caption = 'Unit Price';
            trigger OnValidate()
            begin
                "Total Price" := ROUND("Unit Price" * Quantitiy, 0.01);
            end;

        }
        field(8; "Total Price"; Decimal)
        {
            Editable = false;
            AutoFormatType = 1;
            Caption = 'Total Price';
        }
        field(9; "To Invoice"; Boolean)
        {
            InitValue = Yes;
            Caption = 'To Invoice';
        }
        field(10; "Bill-to Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
            Caption = 'Bill-to Customer No.';
        }
        field(11; "Unit of Measure Code"; Code[10])
        {
            TableRelation = if (Type = CONST(Resource)) "Resource Unit of Measure".Code WHERE("Resource No." = field("No."))
            else
            "Unit of Measure".Code;
            Caption = 'Unit of Measure Code';
            trigger OnValidate()
            begin
                case Type of
                    Type::Resource:
                        begin
                            Resource.GET("No.");
                            if "Unit of Measure Code" = '' then begin
                                "Unit of Measure Code" := Resource."Base Unit of Measure";
                            end;
                            ResourceUofM.GET("No.", "Unit of Measure Code");
                            "Qty. per Unit of Measure" := ResourceUofM."Qty. per Unit of Measure";
                            "Total Price" := ROUND(Resource."Unit Price" * "Qty. per Unit of Measure");
                        end;
                    Type::"G/L Account":
                        begin
                            "Qty. per Unit of Measure" := 1;
                        end;
                end;
                if CurrFieldNo = FIELDNO("Unit of Measure Code") then begin
                    VALIDATE("Unit Price");
                end;
            end;
        }
        field(12; "Gen. Prod. Posting Group"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group"."Code";
            Caption = 'Gen. Prod. Posting Group';
        }
        field(13; "VAT Prod. Posting Group"; Code[10])
        {
            TableRelation = "VAT Product Posting Group"."Code";
            Caption = 'VAT Prod. Posting Group';
        }
        field(14; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';

        }
        field(15; Registered; Boolean)
        {
            Editable = false;
            Caption = 'Registered';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        SeminarRegistrationHeader: Record "Seminar Registration Header";
        GLAccount: Record "G/L Account";
        ResourceUofM: Record "Resource Unit of Measure";
        Resource: Record Resource;

    trigger OnInsert()
    begin
        SeminarRegistrationHeader.GET("Document No.");
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        TESTFIELD(Registered, FALSE);
    end;

    trigger OnRename()
    begin

    end;

}