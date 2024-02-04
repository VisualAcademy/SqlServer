/* SQL Server UNION vs. UNION ALL�� �� */
/*
	- �ϳ� �̻��� ���̺��� ��� ��ġ �ϳ��� ���̺��ΰ�ó�� ��Ƽ� ���
	- 2�� �̻��� ���̺�� �̷���� �Խ��ǿ��� �����͸� �о�ͼ� 
	  �ϳ��� ����Ʈ�� �����ְ����� �� �ַ� ���
*/

/* �ӽ� ���̺� ���� �� ������ �Է� */
Declare @Table1 TABLE(Num Int);
	Insert Into @Table1 Values(1);
	Insert Into @Table1 Values(2);
	Insert Into @Table1 Values(3);
	Insert Into @Table1 Values(4);
	Insert Into @Table1 Values(5);
Declare @Table2 TABLE(Num Int);
	Insert Into @Table2 Values(3);
	Insert Into @Table2 Values(4);
	Insert Into @Table2 Values(5);
	Insert Into @Table2 Values(6);
	Insert Into @Table2 Values(7);

/* UNION�� ���� : Distinct Sort ���� */ 
  Select Num As 'UNION�� ����' From @Table1
  UNION
  Select Num From @Table2
  ;
/* UNION All�� ���� */ 
  Select Num AS 'UNION ALL�� ����' From @Table1
  UNION ALL
  Select Num From @Table2
  ;



