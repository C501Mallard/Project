-- db_id 資料庫名稱
--序號 char(5) primary key
alter proc 新增原始食品添加物資料集
as
begin
	
	if object_id('FA61', 'U') is null
		begin
			print '資料表不存在'
			
			--SET IDENTITY_INSERT  FA61 On
			create table FA61 (類別 nvarchar(100) null,中文品名 nvarchar(500) null,
			英文品名 nvarchar(500) null,使用食品範圍及限量 nvarchar(3000),使用限制 nvarchar(3000),
			規格 nvarchar(3000),類別說明  nvarchar(3000),id_num bigint IDENTITY(1,1))
			--SET IDENTITY_INSERT  FA61 Off
		end
	else
		begin
			print '資料表存在'
			DROP TABLE FA61

			create table FA61 (類別 nvarchar(100) null,中文品名 nvarchar(500) null,
			英文品名 nvarchar(500) null,使用食品範圍及限量 nvarchar(3000),使用限制 nvarchar(3000),
			規格 nvarchar(3000),類別說明  nvarchar(3000),id_num bigint IDENTITY(1,1))

			--declare	@c_class varchar(300),
			--		@c_C_name varchar(300),
			--		@c_E_name varchar(300),
			--		@c_range varchar(300),
			--		@c_limit varchar(300),
			--		@c_ulimit varchar(300),
			--		@c_classdis varchar(300),
			--		--@c_id_num bigint,
			--		@i int=1
				
			--	INSERT into  dbo.FA61(dbo.類別,dbo.中文品名,dbo.英文品名,dbo.使用食品範圍及限量,dbo.使用限制, dbo.規格, dbo.類別說明)
			--	VALUES('a','a','a','a','a','a','a')
				--VALUES(@c_class,@c_C_name,@c_E_name,@c_range,@c_limit,@c_ulimit,@c_classdis)
				
		end
end
--exec 新增原始食品添加物資料集