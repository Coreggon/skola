-- 2.1
SELECT * FROM student;
-- 2.2
SELECT meno, priezvisko 
    FROM os_udaje os
        JOIN student s
            ON os.rod_cislo = s.rod_cislo
                WHERE s.rocnik = '2';
-- 2.3
SELECT meno, priezvisko
    FROM os_udaje os
        WHERE TO_NUMBER(SUBSTR(rod_cislo, 1, 2)) >= 85
                AND TO_NUMBER(SUBSTR(rod_cislo, 1, 2)) <= 89;
-- 2.4
SELECT meno, priezvisko
    FROM os_udaje os 
        JOIN student s 
            ON os.rod_cislo = s.rod_cislo
                WHERE SUBSTR(s.st_skupina, 2, 1) = 'P';
-- 2.5
SELECT meno, priezvisko
    FROM os_udaje os 
        JOIN student s 
            ON os.rod_cislo = s.rod_cislo
                WHERE SUBSTR(s.st_skupina, 2, 1) = 'P'
                    ORDER BY priezvisko;
-- 2.6
SELECT DISTINCT meno, priezvisko
    FROM os_udaje os
        JOIN student s
            ON os.rod_cislo = s.rod_cislo
                JOIN zap_predmety zp
                    ON s.os_cislo = zp.os_cislo
                        WHERE zp.cis_predm = 'BI06'
                            ORDER BY priezvisko;
-- 2.7
SELECT DISTINCT prednasajuci, cis_predm FROM zap_predmety;
-- 2.8
SELECT DISTINCT zp.prednasajuci, zp.cis_predm, p.nazov, u.meno, u.priezvisko
    FROM zap_predmety zp
        JOIN predmet p 
            ON zp.cis_predm = p.cis_predm
                LEFT OUTER JOIN ucitel u
                    ON zp.prednasajuci = u.os_cislo;
-- 2.9
SELECT DISTINCT u.meno, u.priezvisko 
    FROM ucitel u
        JOIN zap_predmety zp
            ON zp.prednasajuci = u.os_cislo
                JOIN student s
                    ON zp.os_cislo = s.os_cislo
                        WHERE s.st_odbor >= 100
                            AND s.st_odbor <= 199;
-- 2.10
SELECT DISTINCT p.nazov
    FROM predmet p
        JOIN zap_predmety zp
            ON zp.cis_predm = p.cis_predm
                JOIN student s
                    ON s.os_cislo = zp.os_cislo
                        JOIN os_udaje os
                            ON os.rod_cislo = s.rod_cislo
                                WHERE os.priezvisko = 'Balaz';
-- 2.11
SELECT count(*) FROM zap_predmety;
-- 2.12
SELECT DISTINCT count(*) FROM student s
    JOIN zap_predmety zp
        ON zp.os_cislo = s.os_cislo
            JOIN predmet p
                ON p.cis_predm = zp.cis_predm
                    WHERE p.nazov = 'Zaklady databazovych systemov';
-- 2.13
SELECT DISTINCT meno, priezvisko, 
    SUBSTR(os.rod_cislo, 5, 2)||'.'||
    DECODE(SUBSTR(os.rod_cislo, 3, 1),'5','0', DECODE(SUBSTR(os.rod_cislo, 3, 1),'6','1', SUBSTR(os.rod_cislo,3,1)))
    || SUBSTR(os.rod_cislo,4,1)||'.'||SUBSTR(os.rod_cislo, 1, 2)
        AS datum_nar
    FROM os_udaje os
        JOIN student s
            ON s.rod_cislo = os.rod_cislo;
-- 2.14
SELECT SUM(zp.ects)
    FROM zap_predmety zp
        JOIN student s
            ON zp.os_cislo = s.os_cislo
                WHERE s.os_cislo = 500439
                    AND zp.vysledok IS NOT NULL;
-- 2.15
SELECT meno, priezvisko, 119-TO_NUMBER(SUBSTR(os.rod_cislo,1, 2)) AS vek
    FROM os_udaje os
        JOIN student s
            ON os.rod_cislo = s.rod_cislo
                WHERE s.rocnik = '2';