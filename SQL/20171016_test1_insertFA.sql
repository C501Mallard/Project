-- db_id ��Ʈw�W��
--�Ǹ� char(5) primary key
alter proc �s�W��l���~�K�[����ƶ�
as
begin
	
	if object_id('FA61', 'U') is null
		begin
			print '��ƪ��s�b'
			
			--SET IDENTITY_INSERT  FA61 On
			create table FA61 (���O nvarchar(100) null,����~�W nvarchar(500) null,
			�^��~�W nvarchar(500) null,�ϥέ��~�d��έ��q nvarchar(3000),�ϥέ��� nvarchar(3000),
			�W�� nvarchar(3000),���O����  nvarchar(3000),id_num bigint IDENTITY(1,1))
			--SET IDENTITY_INSERT  FA61 Off
		end
	else
		begin
			print '��ƪ�s�b'
			DROP TABLE FA61

			create table FA61 (���O nvarchar(100) null,����~�W nvarchar(500) null,
			�^��~�W nvarchar(500) null,�ϥέ��~�d��έ��q nvarchar(3000),�ϥέ��� nvarchar(3000),
			�W�� nvarchar(3000),���O����  nvarchar(3000),id_num bigint IDENTITY(1,1))

			--declare	@c_class varchar(300),
			--		@c_C_name varchar(300),
			--		@c_E_name varchar(300),
			--		@c_range varchar(300),
			--		@c_limit varchar(300),
			--		@c_ulimit varchar(300),
			--		@c_classdis varchar(300),
			--		--@c_id_num bigint,
			--		@i int=1
				
			--	INSERT into  dbo.FA61(dbo.���O,dbo.����~�W,dbo.�^��~�W,dbo.�ϥέ��~�d��έ��q,dbo.�ϥέ���, dbo.�W��, dbo.���O����)
			--	VALUES('a','a','a','a','a','a','a')
				--VALUES(@c_class,@c_C_name,@c_E_name,@c_range,@c_limit,@c_ulimit,@c_classdis)
				
		end
end
--exec �s�W��l���~�K�[����ƶ�