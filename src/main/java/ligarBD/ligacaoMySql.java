package ligarBD;
import java.sql.*;

public class ligacaoMySql {
public static String Estado="Nao ligado";
	
	public static Connection criarLigacaoMySql() {
		Connection cn;
		
		try {
			String driver="com.mysql.cj.jdbc.Driver";
			Class.forName(driver);
			String caminho="jdbc:mysql://localhost:3306/biblioteca?useTimezone=true&serverTimezone=UTC";
			String utilizador="root";
			String password="12345678";
			cn=DriverManager.getConnection(caminho,utilizador,password);
			if(cn!=null) {
				Estado="Ligação efetuada com sucesso";
			}
			else {
				Estado="Não foi possivel efetuar a ligação";
			}
			return(cn);
		}
		catch(ClassNotFoundException e) {
			System.out.println("Erro ao carregar o Driver");
			return null;
			
		}
		catch(SQLException e) {
			System.out.println("Erro ao aceder a base de dados");
			return null;
	}
  }
	public static String estadoLigacao() {
		return(Estado);
	}

}


