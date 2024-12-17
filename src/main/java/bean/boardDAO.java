package bean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class boardDAO {


    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;



    //데이터베이스에 커넥션 Pool을 사용 메서드
    public void getCon(){
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

    //받은 bean 객체를 데이터에 저장하는 메서드, 저장만 하면 되기 때문에 리턴값은 void로 처리한다.
    public void insertBoard(boardBean bean){
        getCon();
        //BoardWriteForm.jsp에서 BoardWriteProc 작성자,제목,이메일,비밀번호,내용을 보내는데 이를 제외한 나머지는 초기화해야한다

        //ref(글 그룹)쿼리를 실행시켜 가장 큰 ref에 +1을 한다., 그래서 첫 글은 그룹이 1일 테니, 나중에 1을 더할거라 지금은 0으로 초기화
        int ref=0;

        // 새 글이기에 step과 level을 1로 초기화
        // re_step: 답글의 순서를 나타냄. 원글은 1로 시작
        int re_step=1;
        // re_level: 답글의 깊이를 나타냄. 원글은 1로 시작
        int re_level=1;


        try {

            // 가장 큰 ref 값을 가져오는 SQL 쿼리
            String refsql = "SELECT MAX(ref) from BOARD";

            //쿼리 준비
            pstmt = con.prepareStatement(refsql);
            //쿼리 실행 후 결과값을 리턴
            rs = pstmt.executeQuery();
            if(rs.next()){//쿼리 실행했을 때의 결과값이 있다면?
                ref=rs.getInt(1) + 1; // 현재 ref의 최대값에 +1을 더하여 새로운 글 그룹 값으로 설정
            }


            // 매개변수로 받은 bean 객체를 DB에 저장하는 SQL 쿼리
            // board_seq.nextval: 시퀀스를 사용하여 자동으로 증가하게 함
            // sysdate: 현재 날짜와 시간을 자동으로 입력
            // ReadCount는 0으로 초기화 (새 글이므로 아직 조회되지 않음)
            String sql = "insert into board values(board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
            pstmt = con.prepareStatement(sql);

            // ?에 넣을 값을 맵핑
            pstmt.setString(1, bean.getWriter());
            pstmt.setString(2, bean.getEmail());
            pstmt.setString(3, bean.getSubject());
            pstmt.setString(4, bean.getPassword());
            pstmt.setInt(5, ref);
            pstmt.setInt(6, re_step);
            pstmt.setInt(7, re_level);
            pstmt.setString(8, bean.getContent());

            //쿼리 실행
            pstmt.executeUpdate();

            //자원 반납
            con.close();


        }catch (Exception e) {
            System.err.println("DB에 저장하지 못 하였습니다.");
            e.printStackTrace();
            return;
        }
    }
}
