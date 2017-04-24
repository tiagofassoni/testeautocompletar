SELECT agente.Codigo,
         agente.Nome,
         agente.Descricao,
         poder.Nome AS NomePoder,
         nfed.Nome AS NomeNivelFederativo
FROM agentes agente
JOIN moderacoes b
    ON agente.Codigo = b.CodigoObjeto
        AND b.CodigoTipoObjeto = 2
JOIN tipo_poder poder
    ON agente.CodigoPoder = poder.Codigo
JOIN tipo_nivel_federativo nfed
    ON nfed.Codigo = agente.CodigoNivelFederativo
LEFT JOIN cidade cida
    ON agente.CodigoCidade = cida.Codigo
LEFT JOIN uf uf
    ON cida.CodigoUF = uf.Codigo
WHERE b.CodigoStatusModeracao = 2
ORDER BY  agente.Nome ;