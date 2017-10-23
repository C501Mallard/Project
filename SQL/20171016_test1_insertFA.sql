-- db_id 資料庫名稱
--序號 char(5) primary key
alter proc 新增原始食品添加物資料集
as
begin
	
	if object_id('FA61') is null
		begin
			print '資料表不存在'
			declare @table nvarchar(4000)=''
			set @table ='create table FA61 (類別 varchar(100) null,中文品名 nvarchar(500) null,
			英文品名 nvarchar(500) null,使用食品範圍及限量 nvarchar(3000),使用限制 nvarchar(3000),
			規格 nvarchar(3000),類別說明  nvarchar(3000))'
			exec(@table)
		end
	else
		begin
			print '資料表存在'

			declare	@c_class varchar(30),
					@c_C_name varchar(30),
					@c_E_name varchar(30),
					@c_range varchar(30),
					@c_limit varchar(30),
					@c_ulimit varchar(30),
					@c_classdis varchar(30),
					@i int=1
			
				INSERT into  dbo.FA61(dbo.類別,dbo.中文品名,dbo.英文品名,dbo.使用食品範圍及限量,dbo.使用限制, dbo.規格, dbo.類別說明)
				VALUES(@c_class,@c_C_name,@c_E_name,@c_range,@c_limit,@c_ulimit,@c_classdis)
		end
end
--exec 新增原始食品添加物資料集