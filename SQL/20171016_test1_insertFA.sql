-- db_id ��Ʈw�W��
--�Ǹ� char(5) primary key
alter proc �s�W��l���~�K�[����ƶ�
as
begin
	
	if object_id('FA61') is null
		begin
			print '��ƪ��s�b'
			declare @table nvarchar(4000)=''
			set @table ='create table FA61 (���O varchar(100) null,����~�W nvarchar(500) null,
			�^��~�W nvarchar(500) null,�ϥέ��~�d��έ��q nvarchar(3000),�ϥέ��� nvarchar(3000),
			�W�� nvarchar(3000),���O����  nvarchar(3000))'
			exec(@table)
		end
	else
		begin
			print '��ƪ�s�b'

			declare	@c_class varchar(30),
					@c_C_name varchar(30),
					@c_E_name varchar(30),
					@c_range varchar(30),
					@c_limit varchar(30),
					@c_ulimit varchar(30),
					@c_classdis varchar(30),
					@i int=1
			
				INSERT into  dbo.FA61(dbo.���O,dbo.����~�W,dbo.�^��~�W,dbo.�ϥέ��~�d��έ��q,dbo.�ϥέ���, dbo.�W��, dbo.���O����)
				VALUES(@c_class,@c_C_name,@c_E_name,@c_range,@c_limit,@c_ulimit,@c_classdis)
		end
end
--exec �s�W��l���~�K�[����ƶ�