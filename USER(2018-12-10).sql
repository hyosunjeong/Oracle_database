-- ����� user1���� ������ ȭ���Դϴ�.
-- user1�� dba������ ���� �ִ�.

-- talbe ����
-- TABLE�̸� : tbl_std
-- st_num, st_name, st_tel, st_addr, int_age, int_grade Į���� ������ �ְ�,
-- st_num�� PK�� �����Ǿ��ְ�, st_name�� ��ĭ�� ����
-- ��������� �����Ǿ� �ִ�.

CREATE TABLE tbl_std(

    st_num CHAR(3) PRIMARY KEY,          --��ü ���Ἲ ����
    st_name nVARCHAR2(20)  NOT NULL,
    st_tel nVARCHAR2(15),
    st_addr nVARCHAR2(125),
    int_age NUMBER(3),
    int_grade NUMBER(2)
);


-- ȫ�浿, �̸���, ������, �Ӳ���, ���� �̸��� ��������
-- ������ �׸��� �����Ӱ� �����Ͽ� �����͸� �߰��Ͻÿ�

INSERT INTO tbl_std  VALUES('001','ȫ�浿','010-1111-1111','�����',12,2);
INSERT INTO tbl_std  VALUES('002','�̸���','010-1111-2222','���ֱ�����',16,6);
INSERT INTO tbl_std  VALUES('003','������','010-1111-3333','���ֽ�',13,3);
INSERT INTO tbl_std  VALUES('004','�Ӳ���','010-1111-4444','�λ걤����',11,1);
INSERT INTO tbl_std  VALUES('005','����','010-1111-5555','��õ������',15,5);

SELECT * FROM tbl_std;


