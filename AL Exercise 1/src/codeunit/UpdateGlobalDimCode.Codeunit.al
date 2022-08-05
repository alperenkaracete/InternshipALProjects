codeunit 50501 "UpdateGlobalDimCode"
{
    [EventSubscriber(ObjectType::Table, Database::"Default Dimension", 'OnAfterUpdateGlobalDimCode', '', false, false)]
    local procedure UpdateGlobalDimCodeOnBeforeUpdateGlobalDimCode(GlobalDimCodeNo: Integer; AccNo: Code[20]; NewDimValue: Code[20]; TableID: Integer)

    var
        DftDim: Record "Default Dimension";

    begin

        case TableID of

            DATABASE::Seminar:
                DftDim.UpdateSeminarGlobalDimCode(GlobalDimCodeNo, AccNo, NewDimValue);
        end;

    end;

}