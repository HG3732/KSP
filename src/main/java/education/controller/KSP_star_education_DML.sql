-- 교육 신청시 정원 초과 여부 확인 후 신청 내역 등록
create or replace trigger trg_edu_book_num
    before insert on edu_book
    referencing new as new 
    for each row
declare
    vb number;
begin
    select (edu_max_num-edu_book_num) into vb from edu_list where edu_id = :new.edu_id;
    if vb >= :new.edu_part_num then
        update edu_list set edu_book_num = edu_book_num + :new.edu_part_num where edu_id = :new.edu_id and edu_max_num >= edu_book_num + :new.edu_part_num;
    else
        raise_application_error(-20301, '정원 초과로 신청 불가');
    end if;
end;
/
-- 교육 취소시 교육 신청 인원 감소
create or replace trigger trg_edu_book_cancel
    before delete on edu_book
    referencing new as new 
    for each row
begin
    update edu_list set edu_book_num = edu_book_num - :new.edu_part_num where edu_id = :new.edu_id;
end;
/

SELECT * FROM EDU_LIST ORDER BY EDU_ID;
DESC EDU_LIST;
-- 임의의 교육 등록
BEGIN
    FOR I IN 1..123 LOOP
        INSERT INTO EDU_LIST VALUES(
        (SELECT NVL(MAX(EDU_ID), 0) + 1 FROM EDU_LIST), 
        '초등 교육'||I, 
        '<p>초등 교육입니다.</p>', 
        '서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 5F', 
        'element', 
        'wed', 
        TO_DATE('2024-05-01')+(I+2), 
        TO_DATE('2024-05-03')+(I+2), 
        TO_DATE('2024-06-01')+(I+2), 
        TO_DATE('2024-06-03')+(I+2), 
        DEFAULT, 
        30, 
        DEFAULT
        );
    END LOOP;
    COMMIT;
END;
/
BEGIN
    FOR I IN 1..45 LOOP
        INSERT INTO EDU_LIST VALUES(
        (SELECT NVL(MAX(EDU_ID), 0) + 1 FROM EDU_LIST), 
        '중등 교육'||I, 
        '<p>중등 교육입니다.</p>', 
        '서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 5F', 
        'middle', 
        'every', 
        TO_DATE('2024-05-15')+(I+2), 
        TO_DATE('2024-05-18')+(I+2), 
        TO_DATE('2024-06-15')+(I+2), 
        TO_DATE('2024-06-18')+(I+2), 
        DEFAULT, 
        30, 
        DEFAULT
        );
    END LOOP;
    COMMIT;
END;
/
BEGIN
    FOR I IN 1..59 LOOP
        INSERT INTO EDU_LIST VALUES(
        (SELECT NVL(MAX(EDU_ID), 0) + 1 FROM EDU_LIST), 
        '고등 교육'||I, 
        '<p>고등 교육입니다.</p>', 
        '서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 5F', 
        'high', 
        'every', 
        TO_DATE('2024-05-20')+(I+2), 
        TO_DATE('2024-05-22')+(I+2), 
        TO_DATE('2024-06-20')+(I+2), 
        TO_DATE('2024-06-22')+(I+2), 
        DEFAULT, 
        30, 
        DEFAULT
        );
    END LOOP;
    COMMIT;
END;
/