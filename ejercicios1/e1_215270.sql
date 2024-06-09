use DBCreditoRural
go

DROP table #R
go
-- construimos una tabla temporal para hallar el total de prestamos y el total de amortizaciones relacionadas al Cosprestamo
SELECT P.CodPrestatario, SUM(P.Importe) as TotalPrestamo, SUM(IsNull(A.Importe,0)) as TotalAmortizacion
INTO #R
FROM Prestamo P left outer join Amortizacion A on P.DocPrestamo = A.DocPrestamo
GROUP BY P.CodPrestatario
go

-- Completamos la tabla resultado
SELECT P.CodPrestatario, P.Nombres, P.DocIdentidad, #R.TotalPrestamo, (#R.TotalPrestamo-#R.TotalAmortizacion) as Saldo
FROM Prestatario P inner join #R on P.CodPrestatario = #R.CodPrestatario
go

