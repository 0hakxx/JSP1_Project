package bean;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

//Oracle 데이터베이스를 연결, select, insert, delete , update 작업을 해주는 클래스입니다.
public class MemberDAO {

    // 데이터베이스 연결 정보 설정
    String id = "system";
    String pass = "123456";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";


    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;


    //데이터베이스에 접근하는 메서드 작성

    public void getCon(){
        try {
            //1.데이터베이스를 사용한다고 선언
            //이는 Oracle 데이터베이스와의 연결을 위해 필요합니다.
            Class.forName("oracle.jdbc.driver.OracleDriver");

            //2. 데이터 베이스 접속
            // DriverManager를 사용하여 데이터베이스에 연결합니다.
            con = DriverManager.getConnection(url,id,pass);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertMember(MemberBean mbean){

        try {
            getCon();
            // 쿼리 작성
            // 회원가입(회원 정보를 삽입하기 위한) SQL 쿼리문을 준비합니다.
            String Sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
            //쿼리 실행
            // PreparedStatement 객체를 생성하여 SQL 인젝션을 방지하고 쿼리 실행을 준비합니다.
            PreparedStatement pstmt = con.prepareStatement(Sql);
            //?에 맞게 쿼리문 맵핑
            // PreparedStatement의 파라미터에 MemberBean 객체의 각 필드 값을 설정합니다.
            pstmt.setString(1, mbean.getId());
            pstmt.setString(2, mbean.getPass1());
            pstmt.setString(3, mbean.getEmail());
            pstmt.setString(4, mbean.getTel());
            pstmt.setString(5, mbean.getHobby());
            pstmt.setString(6, mbean.getJob());
            pstmt.setString(7, mbean.getAge());
            pstmt.setString(8, mbean.getInfo());

            //insert, delete, update 시 실행하는 명령어
            // executeUpdate() 메소드를 호출하여 실제로 데이터베이스에 변경사항을 적용합니다.
            pstmt.executeUpdate();

            //자원 반납, 데이터베이스 연결을 종료하여 리소스를 해제합니다.
            con.close();

        }catch (Exception e){
            // Oracle JDBC 드라이버를 찾을 수 없는 경우 에러 메시지를 출력합니다.
            System.err.println("Oracle JDBC를 찾을 수 없습니다.");
            e.printStackTrace();
            return;
        }

    }
}
