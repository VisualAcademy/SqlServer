Select [b].[Url] From 
(
	Select * From dbo.SearchBlogs(@p0)
)
As [b]
Order By b.Url

