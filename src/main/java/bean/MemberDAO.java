package bean;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.Vector;

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
//    public void getCon(){
//        try {
//            //1.데이터베이스를 사용한다고 선언
//            //이는 Oracle 데이터베이스와의 연결을 위해 필요합니다.
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//
//            //2. 데이터 베이스 접속
//            // DriverManager를 사용하여 데이터베이스에 연결합니다.
//            con = DriverManager.getConnection(url,id,pass);
//
//        }catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    //데이터베이스에 접근하는 메서드 작성 Connection Pool 방식
    public void getCon()
    {
        try {
            // JNDI를 사용하여 외부 리소스에 접근하기 위한 초기 컨텍스트를 생성
            Context initContext = new InitialContext();

            // java:/comp/env는 JNDI 네이밍의 표준 루트 컨텍스트
            // 이를 통해 톰캣 서버의 환경 설정에 접근
            Context envContext = (Context) initContext.lookup("java:/comp/env");

            // JNDI 이름으로 DataSource 객체를 찾음
            //데이터소스 객체 선언. context.xml 파일의 Resource name 값을 찾아옴.
            DataSource ds = (DataSource) envContext.lookup("jdbc/pool");

            // DataSource로부터 데이터베이스 연결(Connection) 객체를 얻음
            // 이 방식은 커넥션 풀을 사용하여 효율적으로 DB 연결을 관리
            con = ds.getConnection();


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
    //모든 회원들의 정보를 Return 호출하는 메서드 작성.
    //이 메서드는 데이터베이스에서 모든 회원 정보를 조회하여 Vector<MemberBean> 형태로 반환합니다.
    public Vector<MemberBean> allSelectMember(){

        Vector<MemberBean> v = new Vector<MemberBean>();
        try {
            //connection 연결
            getCon();
            //쿼리 준비
            String sql = "select * from MEMBER";
            // 객체 선언
            pstmt = con.prepareStatement(sql);
            //쿼리를 실행시킨 결과를 리턴해서 받아줌, 즉 오라클의 DB를 검색된 조회 결과를 자바 객체에 저장.
            rs = pstmt.executeQuery();
            //반복문을 사용하여 rs에 저장된 데이터를 추출
            while (rs.next()) {
                MemberBean bean = new MemberBean(); //컬럼으로 나뉘어진 데이터를 Bean클래스에 저장
                // - rs.getString("컬럼명")은 현재 행의 지정된 컬럼 값을 문자열로 반환합니다.
                bean.setId(rs.getString("id"));
                bean.setPass1(rs.getString("pass1"));
                bean.setEmail(rs.getString("email"));
                bean.setTel(rs.getString("tel"));
                bean.setHobby(rs.getString("hobby"));
                bean.setJob(rs.getString("job"));
                bean.setAge(rs.getString("age"));
                bean.setInfo(rs.getString("info"));
                // - v.addElement(mbean)는 생성된 MemberBean 객체를 Vector에 추가합니다.
                v.addElement(bean);
            }

            con.close(); //자원 반납

        }catch (Exception e){
            e.printStackTrace();
        }
        return v; //저장된 v를 Return
    }

    //한 사람의 대한 정보를 리턴하는 메서드 작성
    public MemberBean oneSelectMember(String id){
        MemberBean bean = new MemberBean();

        try {
            getCon();
            //쿼리 준비
            String sql = "select * from MEMBER WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            // ?에 전달받은 String id를 매핑하여 쿼리 작성 완료
            pstmt.setString(1, id);
            //쿼리 실행
            rs = pstmt.executeQuery();
            if (rs.next()) {
                bean.setId(rs.getString("id"));
                bean.setPass1(rs.getString("pass1"));
                bean.setEmail(rs.getString("email"));
                bean.setTel(rs.getString("tel"));
                bean.setHobby(rs.getString("hobby"));
                bean.setJob(rs.getString("job"));
                bean.setAge(rs.getString("age"));
                bean.setInfo(rs.getString("info"));
            }
            con.close();//자원 반납
        }catch (Exception e){
            e.printStackTrace();
        }
        return bean;
    }

    public String getPass(String id){
        String pass = new String();

        try {
            getCon();
            String sql = "SELECT PASS1 FROM MEMBER WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                pass = rs.getString("PASS1");
            }
            con.close(); //자원 반납

        }catch (Exception e){
            System.out.println("Error in getPass: " + e.getMessage());
            e.printStackTrace();
        }
        return pass;
    }

    //회원정보를 수정하는 메서드,,수정만 하면 됨으로 반환값은 없다.
    public void updateMember(MemberBean mbean){

        try {
            getCon();
            String sql = "UPDATE MEMBER SET email=?, tel=? WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, mbean.getEmail());
            pstmt.setString(2, mbean.getTel());
            pstmt.setString(3, mbean.getId());
            pstmt.executeUpdate();

            con.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    //한 회원을 삭제하는 메서드, 삭제만 하면 됨으로 반환값은 없다.
    public void deleteMember(String id){
        try {
            getCon();
            String sql = "DELETE FROM MEMBER WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();

            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
