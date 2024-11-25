package br.com.estok.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.estok.entities.Produto;
import br.com.estok.entities.ValoresNutricionais;
import br.com.estok.entities.enums.CategoriaProduto;
import br.com.estok.exception.DbException;
import br.com.estok.repositories.connection.DbConexao;

public class ProdutoRepository {

	private Connection conn;

	public ProdutoRepository(Connection conn) {
		this.conn = conn;
	}
	
	public void inserirProduto(Produto produto) throws DbException {
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
			throw new DbException("Erro ao inserir o produto. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharResultSet(rs);
			DbConexao.fecharStatement(pst);
		}
	}
	
	public void inserirValoresNutricionaisProduto(ValoresNutricionais valoresNutricionais, Produto produto) throws DbException {
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement("INSERT INTO tb_valores_nutricionais(produto_id, "
					+ "valor_energetico, porcao, carboidratos, proteinas, gorduras_trans, "
					+ "gorduras_saturadas, gorduras_total, vitaminas)"
					+ "VALUES (?,?,?,?,?,?,?,?,?)");
			
			pst.setLong(1, produto.getId());
			pst.setDouble(2, valoresNutricionais.getValorEnergetico());
			pst.setDouble(3, valoresNutricionais.getPorcao());
			pst.setDouble(4, valoresNutricionais.getCarboidratos());
			pst.setDouble(5, valoresNutricionais.getProteinas());
			pst.setDouble(6, valoresNutricionais.getGordurasTrans());
			pst.setDouble(7, valoresNutricionais.getGordurasSaturadas());
			pst.setDouble(8, valoresNutricionais.getGordurasTotal());
			pst.setDouble(9, valoresNutricionais.getVitaminas());

			pst.executeUpdate();
		} catch (SQLException e) {
			throw new DbException("Erro ao inserir o produto. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharStatement(pst);
		}
	}
	
	public List<Produto> listarTodosProdutos() throws DbException {
		PreparedStatement pst = null;
		ResultSet rs =  null;
		List<Produto> listaProdutos = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement("SELECT tb_produto.*, tb_valores_nutricionais.* "
					+ "FROM tb_produto INNER JOIN tb_valores_nutricionais "
					+ "ON tb_produto.id_produto = tb_valores_nutricionais.produto_id ORDER BY tb_produto.nome;");
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				listaProdutos.add(instanciarProduto(rs, instanciarValoresNutricionais(rs)));
			}
			return listaProdutos;
		} catch (SQLException e) {
			throw new DbException("Erro ao inserir o produto. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharResultSet(rs);
			DbConexao.fecharStatement(pst);
		}
	}
	
	private Produto instanciarProduto(ResultSet rs, ValoresNutricionais valoresNutricionais) throws SQLException {
		Produto produto = new Produto();
		produto.setId(rs.getLong("id_produto"));
		produto.setNome(rs.getString("nome"));
		produto.setFoto(rs.getString("foto"));
		produto.setFabricante(rs.getString("fabricante"));
		produto.setCategoriaProduto(CategoriaProduto.valueOf(rs.getString("categoria_produto").toUpperCase()));
		produto.setValoresNutricionais(valoresNutricionais);
		return produto;
	}
	
	private ValoresNutricionais instanciarValoresNutricionais(ResultSet rs) throws SQLException {
		ValoresNutricionais valoresNutricionais = new ValoresNutricionais();
		valoresNutricionais.setId(rs.getLong("id_valores_nutricionais"));
		valoresNutricionais.setValorEnergetico(rs.getDouble("valor_energetico"));
		valoresNutricionais.setPorcao(rs.getDouble("porcao"));
		valoresNutricionais.setCarboidratos(rs.getDouble("carboidratos"));
		valoresNutricionais.setProteinas(rs.getDouble("proteinas"));
		valoresNutricionais.setGordurasTrans(rs.getDouble("gorduras_trans"));
		valoresNutricionais.setGordurasSaturadas(rs.getDouble("gorduras_saturadas"));
		valoresNutricionais.setGordurasTotal(rs.getDouble("gorduras_total"));
		valoresNutricionais.setVitaminas(rs.getDouble("vitaminas"));
		return valoresNutricionais;
	}
}
