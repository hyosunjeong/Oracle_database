-- iolist 

-- �ŷ�ó�������� ���� ������ �ڵ� ��(ū ��) 1���� �����ϴ� SQL
SELECT M.D_CODE FROM 
(SELECT ROW_NUMBER() OVER (ORDER BY D_CODE DESC) R, d_code
FROM tbl_dept) M
WHERE M.R = 1;

SELECT * FROM tbl_iolist I
    LEFT JOIN tbl_product P
        ON I.io_pcode = P.p_code
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code;
        
        
SELECT * FROM tbl_product WHERE p_name like '%����%';



        

