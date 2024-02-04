--[0] Pubs �����ͺ��̽� �̿��ϱ�
Use Pubs
Go
/*
[1] authors���̺��� state�� ��CA���� ���ڵ��� 
au_lname, au_fname, city, state �ʵ带 �˻��ؿ���
*/
Select au_lname, au_fname, city, state
From authors
Where state = 'CA'
--Group By
--Having
--Order By
Go
/*
[2] �� Select���� 'Ķ�����Ͼư˻�'�̶�� �̸��� ��� ����
�ѱ��̸��̳� Ű���带 ��ü �̸����� ����� ���� ���ȣ([])�� ��� ����
*/
Create View [Ķ�����Ͼư˻�]
As
	Select au_lname, au_fname, city, state 
	From authors
	Where state = 'CA'
Go
--[3] �� �����ϱ� : �Ϲ� Select��ó�� ���
Select * From [Ķ�����Ͼư˻�]
Go
--[4] �� �����ϱ� : �������� ��ȣȭ�ϱ�
Alter View [Ķ�����Ͼư˻�]
With Encryption
As
	Select au_lname, au_fname, city, state 
	From authors
	Where state = 'CA'
Go
--[5] �� �������� ���� : "��ü �ּ��� ��ȣȭ�߽��ϴ�."
Exec sp_helptext [Ķ�����Ͼư˻�]
Go
--[6] �� �����ϱ�
Drop View [Ķ�����Ͼư˻�]
Go