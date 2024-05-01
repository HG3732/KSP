SELECT * FROM EDU_LIST ORDER BY EDU_ID;
DESC EDU_LIST;
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