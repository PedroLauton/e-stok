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
import br.com.estok.exception.ExecutionUnsuccessfulException;
import br.com.estok.repositories.connection.DbConexao;

public class ProdutoRepository {

	private Connection conn;
	
	public ProdutoRepository(Connection conn) {
		this.conn = conn;
	}
	
	public void inserirProduto(Produto produto) throws DbException, ExecutionUnsuccessfulException {
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			//Criação da query para inserir. 
			pst = conn.prepareStatement("INSERT INTO tb_produto(nome, foto, categoria_produto, fabricante)"
					+ "VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			
			pst.setString(1, produto.getNome());
			pst.setString(2, produto.getFoto());
			pst.setString(3, produto.getCategoriaProduto().name());
			pst.setString(4, produto.getFabricante());

			//Retorno de linhas afetadas no banco de dados.
			int linhasAfetadas = pst.executeUpdate();
			
			//Caso as linhas afetadas sejam maiores ou igual a 0, retorna o ID criado pelo banco. 
			if(linhasAfetadas > 0) {
				//Captura a o ID gerado no banco.
				rs = pst.getGeneratedKeys();
				if(rs.next()) {
					//Insere o valor no objeto.
					produto.setId(rs.getLong(1));					
				} else {
					throw new ExecutionUnsuccessfulException("Erro ao retornar o ID do produto.");
				}
			}else {
				throw new ExecutionUnsuccessfulException("Erro ao cadastrar o produto. Tente Novamente.");
			}
			
		} catch (SQLException e) {
			throw new DbException("Erro relacionado ao banco de dados. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharResultSet(rs);
			DbConexao.fecharStatement(pst);
		}
	}
	
	public void inserirValoresNutricionaisProduto(ValoresNutricionais valoresNutricionais, Produto produto) throws DbException, ExecutionUnsuccessfulException {
		PreparedStatement pst = null;
		
		try {
			//Criação da query para inserir. 
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
			
			//Retorno de linhas afetadas no banco de dados.
			int linhasAfetadas = pst.executeUpdate();
			
			//Caso não ocorra alguma atualização no banco de dados, a exceção é lançada.
			if(linhasAfetadas <= 0) {
				throw new ExecutionUnsuccessfulException("Erro ao cadastrar as informações do produto. Tente Novamente.");
			}
			
		} catch (SQLException e) {
			throw new DbException("Erro relacionado ao banco de dados. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharStatement(pst);
		}
	}
	
	public void deletarProdutoId(Long id) throws DbException, ExecutionUnsuccessfulException {
		PreparedStatement pst = null;
		
		try {
			//Contrução da query para deleção.
			pst = conn.prepareStatement("DELETE FROM tb_produto WHERE id_produto = ?;");
			pst.setLong(1, id);

			//Retorno de linhas afetadas no banco de dados.
			int linhasAfetadas = pst.executeUpdate();
			
			//Caso não ocorra alguma atualização no banco de dados, a exceção é lançada.
			if(linhasAfetadas <= 0) {
				throw new ExecutionUnsuccessfulException("Erro ao deletar o produto. Tente Novamente.");
			}
			
		} catch (SQLException e) {
			throw new DbException("Erro relacionado ao banco de dados. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharStatement(pst);
		}
	}
	
	public List<Produto> listarTodosProdutos() throws DbException {
		PreparedStatement pst = null;
		ResultSet rs =  null;
		//Lista que irá conter todos os produto da aplicação.
		List<Produto> listaProdutos = new ArrayList<>();
		
		try {
			//Criação da query de consulta.
			pst = conn.prepareStatement("SELECT tb_produto.*, tb_valores_nutricionais.* "
					+ "FROM tb_produto INNER JOIN tb_valores_nutricionais "
					+ "ON tb_produto.id_produto = tb_valores_nutricionais.produto_id ORDER BY tb_produto.nome;");
			
			//Retorno dos registros do banco de dados.
			rs = pst.executeQuery();
			
			//Enquanto houver produtos 
			while(rs.next()) {
				listaProdutos.add(instanciarProduto(rs, instanciarValoresNutricionais(rs)));
			}
		
			return listaProdutos;
		} catch (SQLException e) {
			throw new DbException("Erro relacionado ao banco de dados. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharResultSet(rs);
			DbConexao.fecharStatement(pst);
		}
	}
	
	public Produto listarProdutoId(Long id) throws DbException, ExecutionUnsuccessfulException {
		PreparedStatement pst = null;
		ResultSet rs =  null;
		
		try {
			//Criação da query de listagem por ID.
			pst = conn.prepareStatement("SELECT tb_produto.*, tb_valores_nutricionais.* "
					+ "FROM tb_produto INNER JOIN tb_valores_nutricionais "
					+ "ON tb_produto.id_produto = tb_valores_nutricionais.produto_id "
					+ "WHERE tb_produto.id_produto = ?;");
			
			pst.setLong(1, id);
			
			//Retorno dos registros do banco de dados.
			rs = pst.executeQuery();
			
			//Caso tenha valor no ResultSet.
			if(rs.next()) {
				return instanciarProduto(rs, instanciarValoresNutricionais(rs));
			} else {
				throw new ExecutionUnsuccessfulException("Produto não encontrado. Tente Novamente com outro ID.");
			}
		} catch (SQLException e) {
			throw new DbException("Erro relacionado ao banco de dados. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharResultSet(rs);
			DbConexao.fecharStatement(pst);
		}
	}
	
	public void editarProdutoId(Long id, Produto produto) throws DbException, ExecutionUnsuccessfulException {
		PreparedStatement pst = null;
		
		try {
			//Criação da query para alterar ao mesmo tempo duas tabelas.
			pst = conn.prepareStatement("UPDATE tb_produto p "
					+ "JOIN tb_valores_nutricionais v ON p.id_produto = v.produto_id "
					+ "SET p.nome = ?, "
					+ "p.categoria_produto = ?, "
					+ "p.fabricante = ?, "
					+ "v.valor_energetico = ?, "
					+ "v.porcao = ?, "
					+ "v.carboidratos = ?, "
					+ "v.proteinas = ?, "
					+ "v.gorduras_trans = ?, "
					+ "v.gorduras_saturadas = ?, "
					+ "v.gorduras_total = ?, "
					+ "v.vitaminas = ? "
					+ "WHERE p.id_produto = ? "
					+ "AND v.produto_id = ?");

			pst.setString(1, produto.getNome());
			pst.setString(2, produto.getCategoriaProduto().name());
			pst.setString(3, produto.getFabricante());
			pst.setDouble(4, produto.getValoresNutricionais().getValorEnergetico());
			pst.setDouble(5, produto.getValoresNutricionais().getPorcao());
			pst.setDouble(6, produto.getValoresNutricionais().getCarboidratos());
			pst.setDouble(7, produto.getValoresNutricionais().getProteinas());
			pst.setDouble(8, produto.getValoresNutricionais().getGordurasTrans());
			pst.setDouble(9, produto.getValoresNutricionais().getGordurasSaturadas());
			pst.setDouble(10, produto.getValoresNutricionais().getGordurasTotal());
			pst.setDouble(11, produto.getValoresNutricionais().getVitaminas());
			pst.setLong(12, id);
			pst.setLong(13, id);

			//Retorno de linhas afetadas no banco de dados.
			int linhaAfetadas = pst.executeUpdate();
			
			//Caso não ocorra alguma atualização no banco de dados, a exceção é lançada.
			if(linhaAfetadas <= 0) {
				throw new ExecutionUnsuccessfulException("Erro ao atualizar as informações do produto. Tente Novamente.");
			} 
			
		} catch (SQLException e) {
			throw new DbException("Erro relacionado ao banco de dados. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharStatement(pst);
		}
	}
	
	//Método para instanciar 'Produto'
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
	
	//Método para instanciar 'ValoresNutricionais' 
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
