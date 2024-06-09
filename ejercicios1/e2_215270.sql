use DBCreditoRural
go

IF OBJECT_ID("#R1" , "U") IS NOT NULL
BEGIN
    DROP table #R1
    go
END

IF OBJECT_ID("#R2" , "U") IS NOT NULL
BEGIN
    DROP table #R2
    go
END

-- construimos una tabla temporal para hallar el total de prestamos y el total de amortizaciones relacionadas al Cosprestamo
SELECT P.CodPrestatario, ( SUM(P.Importe)-SUM(IsNull(A.Importe,0)) ) as SaldoPrestatario
INTO #R1
FROM Prestamo P left outer join Amortizacion A on P.DocPrestamo = A.DocPrestamo
GROUP BY P.CodPrestatario
go

SELECT P.CodComunidad, SUM(#R1.SaldoPrestatario) as SaldoComunidad
INTO #R2
FROM #R1 left outer join Prestatario P on #R1.CodPrestatario = P.CodPrestatario
GROUP BY P.CodComunidad
HAVING SUM(#R1.SaldoPrestatario) > 10000
go

-- SELECT C.CodComunidad, C.Nombre, Sum(#R.SaldoPrestatario) as SaldoComunidad
-- FROM Comunidad C inner join #R on C.CodComunidad = #R.CodComunidad
-- GROUP BY #R.CodComunidad
-- go

SELECT C.CodComunidad, C.Nombre, #R2.SaldoComunidad
FROM #R2 join Comunidad C on #R2.CodComunidad = C.CodComunidad
go

