create proc table_query
	@table_name nvarchar(10)
as
begin
	exec ('select * from '+@table_name)
end


create proc table_query1
	@table_C nvarchar(500)
as
begin
	select distinct  @table_C  from FA61
	--print @table_class

end

alter proc table_query2
	--@table_name nvarchar(500),
	@table_class nvarchar(500)
as
begin
	
	--declare @table_name nvarchar(100),@table_class nvarchar(100)
	--set @table_class ='(三) 抗氧化劑'
	--set @table_name='select 中文品名,英文品名,使用食品範圍及限量,使用限制,規格,類別說明 from Fa where 類別='+ cast(@table_class as nvarchar)
	--print @table_class
	--print @table_name
	select 中文品名,英文品名,使用食品範圍及限量,使用限制,規格,類別說明 from FA61 where 類別 = @table_class
end

select 中文品名,英文品名,使用食品範圍及限量,使用限制,規格,類別說明 from 食品添加物資料集61 where 類別='(三) 抗氧化劑'
select distinct 類別 from FA61 order by 類別  asc
select 類別 from FA61