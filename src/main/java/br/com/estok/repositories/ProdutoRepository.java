package br.com.estok.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import br.com.estok.entities.Produto;
import br.com.estok.entities.ValoresNutricionais;
import br.com.estok.repositories.connection.DbConexao;
import br.com.estok.repositories.exception.DbException;

public class ProdutoRepository {

	private Connection conn;

	public ProdutoRepository(Connection conn) {
		this.conn = conn;
	}
	
	public void inserirProduto(Produto produto) {
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement("INSERT INTO tb_produto(nome, foto, categoria_produto, fabricante)"
					+ "VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			
			pst.setString(1, produto.getNome());
			pst.setString(2, produto.getFoto());
			pst.setString(3, produto.getCategoriaProduto().name());
			pst.setString(4, produto.getFabricante());

			int linhasAfetas = pst.executeUpdate();
			
			if(linhasAfetas >= 0) {
				rs = pst.getGeneratedKeys();
				if(rs.next()) {
					produto.setId(rs.getLong(1));					
				}
			}
		} catch (SQLException e) {
			throw new DbException(e.getMessage());
		} finally {
			DbConexao.fecharResultSet(rs);
			DbConexao.fecharStatement(pst);
		}
	}
	
	public void inserirValoresNutricionaisProduto(ValoresNutricionais valoresNutricionais, Produto produto) {
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement("INSERT INTO tb_valores_nutricionais(produto_id, "
					+ "valor_energetico, porcao, carboidratos, proteinas, gorduras_trans, "
					+ "gorduras_saturadas, gorduras_total)"
					+ "VALUES (?,?,?,?,?,?,?,?)");
			
			pst.setLong(1, produto.getId());
			pst.setDouble(2, valoresNutricionais.getValorEnergetico());
			pst.setDouble(3, valoresNutricionais.getPorcao());
			pst.setDouble(4, valoresNutricionais.getCarboidratos());
			pst.setDouble(5, valoresNutricionais.getProteinas());
			pst.setDouble(6, valoresNutricionais.getGordurasTrans());
			pst.setDouble(7, valoresNutricionais.getGordurasSaturadas());
			pst.setDouble(8, valoresNutricionais.getGordurasTotal());

			pst.executeUpdate();
		} catch (SQLException e) {
			throw new DbException(e.getMessage());
		}
	}
}
