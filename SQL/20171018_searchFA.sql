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
	--set @table_class ='(�T) �ܮ�ƾ�'
	--set @table_name='select ����~�W,�^��~�W,�ϥέ��~�d��έ��q,�ϥέ���,�W��,���O���� from Fa where ���O='+ cast(@table_class as nvarchar)
	--print @table_class
	--print @table_name
	select ����~�W,�^��~�W,�ϥέ��~�d��έ��q,�ϥέ���,�W��,���O���� from FA61 where ���O = @table_class
end

select ����~�W,�^��~�W,�ϥέ��~�d��έ��q,�ϥέ���,�W��,���O���� from ���~�K�[����ƶ�61 where ���O='(�T) �ܮ�ƾ�'
select distinct ���O from FA61 order by ���O  asc
select ���O from FA61