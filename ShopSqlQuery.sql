alter proc UserCreate
@Name varchar(50),
@LastName varchar(50),
@Email varchar(50),
@Telephone char(11),
@TckNo nchar(11),
@Password char(10)
as begin 
insert into Users(UserName,UserLastName,Email,Telephone,TckNo,UserPassword)
values(@Name,@LastName,@Email,@Telephone,@TckNo,@Password)
end 
alter proc ProductUpdate 
@ProductId int
as begin
update Products set Stock= Stock-1 where ProductId=@ProductId 
end
exec ProductUpdate 1
create proc UserAdressAdd
@UserId int,
@Title varchar(50),
@City varchar(50),
@Address varchar(100),
@IsActive bit
as begin
insert into Adress(UserId,Title,City,Adress,IsActive)
values (@UserId,@Title,@City,@Address,@IsActive)
end
create proc UserAdressList
@UserId int
as begin 
select a.AdressId as 'Adres No', a.Title as 'Baþlýk', a.City as 'Þehir', a.Adress as 'Adres' from Adress as a
where a.UserId = @UserId
end
create proc UserAdressDelete
@AdressId int
as begin
delete Adress where AdressId=@AdressId
end
create proc UserAdressUpdate
@AdressId int,
@Title varchar(50),
@City varchar(50),
@Address varchar(100),
@IsActive bit
as begin
update Adress set Title = @Title, City=@City,Adress=@Address,IsActive=@IsActive
where AdressId=@AdressId
end
create proc OrdersAdd
@UserId int,
@UserAdressId int,
@TotalPrice money
as begin
insert into Orders(UserId,UserAdressId,CreateDate,TotalPrice)
values(@UserId,@UserAdressId,GETDATE(),@TotalPrice)
end
create proc OrdersDelete
@OrderId int
as begin
delete Orders where OrderId =@OrderId
end
exec OrdersAdd 1,1,2500
create proc OrdersList
@UserId int
as begin
select o.OrderId as 'Sipariþ No', u.TckNo as 'TC Kimlik No',
o.TotalPrice as 'Sipariþ Tutar' , a.Adress as 'Adres' , o.CreateDate as 'Sipariþ Tarihi'from Orders as o join Users as u on u.UserId= o.OrderId join Adress as a on a.UserId = u.UserId where o.UserId = u.UserId
end

alter proc UserLogin
@TckNo varchar(50),
@Password char(10)
as begin 
select * from Users where TckNo=@TckNo and UserPassword=@Password
end
create proc UserList
@UserId int
as begin 
select * from Users where UserId = @UserId
end
create proc UserDelete
@UserId int
as begin 
delete Users where UserId = @UserId
end
create proc UserUpdate
@UserId int,
@Name varchar(50),
@LastName varchar(50),
@Email varchar(50),
@Telephone char(11),
@TckNo nchar(11),
@Password char(10)
as begin 
update Users set UserName=@Name,UserLastName=@LastName,Email=@Email,Telephone=@Telephone,TckNo=@TckNo,UserPassword=@Password
where UserId =@UserId
end 
alter proc ProductDetailList
@CategoryDetailId int
as begin 
select p.ProductId as 'Ürün No' , p.ProductName as 'Ürün Adý', c.Name as 'Kategori Adý', cd.Name as 'Alt Kategori Adý', p.Brand as 'Marka', p.Model,p.Price as 'Fiyat' ,
p.Stock as 'Stok' from Products as p
join CategoryDetail as cd on p.CategoryDetailId = cd.CategoryDetailId join Category as c on c.CategoryId = cd.CategoryId where Stock != 0 and cd.CategoryDetailId = @CategoryDetailId
end
create proc ProductSearchCategory
@CategoryName varchar(50)
as begin 
select p.ProductId as 'Ürün No' , p.ProductName as 'Ürün Adý', c.Name as 'Kategori Adý', cd.Name as 'Alt Kategori Adý', p.Brand as 'Marka', p.Model,p.Price as 'Fiyat' from Products as p join CategoryDetail as cd on p.CategoryDetailId = cd.CategoryDetailId join Category as c on c.CategoryId = cd.CategoryDetailId
where c.Name = '%'+@CategoryName+'%'
end
create proc ProductSearchProductName
@ProductName varchar(50)
as begin 
select p.ProductId as 'Ürün No' , p.ProductName as 'Ürün Adý', c.Name as 'Kategori Adý', cd.Name as 'Alt Kategori Adý', p.Brand as 'Marka', p.Model,p.Price as 'Fiyat' from Products as p join CategoryDetail as cd on p.CategoryDetailId = cd.CategoryDetailId join Category as c on c.CategoryId = cd.CategoryDetailId
where p.ProductName = '%'+@ProductName+'%'
end
create proc CategoryList
as begin
select  c.Name +' ( '+ CONVERT(varchar, COUNT(c.Name)) +' ) ' as 'Kategori Adý' from Category as c join CategoryDetail as cd on c.CategoryId = cd.CategoryId 
group by c.Name  
end
create proc CategoryDetailListSearch
@CategoryId int 
as begin
select  cd.Name +' ( '+ CONVERT(varchar, COUNT(cd.Name)) +' ) ' as 'Kategori Adý' from CategoryDetail as cd join Products as p on cd.CategoryDetailId = p.CategoryDetailId  where cd.CategoryId =  @CategoryId
group by cd.Name  
end
create proc CategoryFindId
@CategoryName int
as begin
select CategoryId from Category as c where c.Name=@CategoryName
end