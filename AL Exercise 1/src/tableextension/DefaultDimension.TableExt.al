tableextension 50205 "DefaultDimension" extends "Default Dimension"
{
    fields
    {
        // Add changes to table fields here
    }

    var

    procedure UpdateSeminarGlobalDimCode(GlobalDimCodeNo: Integer; SeminarNo: Code[20]; NewDimValue: Code[20])
    var
        Seminar: Record Seminar;
    begin
        if Seminar.Get(Seminar."No.") then begin
            CASE GlobalDimCodeNo OF
                1:
                    Seminar."Global Dimension 1 Code" := NewDimValue;
                2:
                    Seminar."Global Dimension 2 Code" := NewDimValue;
                DATABASE::Seminar:
                    UpdateSeminarGlobalDimCode(GlobalDimCodeNo, "No.", NewDimValue);
            end;
        end;
    end;
}