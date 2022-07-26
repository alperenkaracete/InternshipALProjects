codeunit 50188 "Seminar-Post (Yes/No)"
{

    TableNo = "Seminar Registration Header";
    trigger OnRun()
    begin
        BEGIN
            SeminarRegHeader.COPY(Rec);
            Code;
            Rec := SeminarRegHeader;
        END;
    end;

    var
        SeminarRegHeader: Record "Seminar Registration Header";
        SeminarPost: Codeunit "Seminar-Post";
        Text001: TextConst ENU = 'Do you want to post the Registration?';

    LOCAL PROCEDURE Code();
    BEGIN
        IF NOT CONFIRM(Text001, FALSE) THEN
            EXIT;
        SeminarPost.RUN(SeminarRegHeader);
        COMMIT;
    END;
}