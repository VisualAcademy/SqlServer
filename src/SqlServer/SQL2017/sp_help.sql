use AdventureWorks2012;

-- 현재 데이터베이스의 주요 속성(메타데이터)
exec sp_help;

-- 특정 개체(테이블)의 속성 보기
exec sp_help '[Person].[Address]';