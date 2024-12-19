package bean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class boardDAO {


    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;


    //데이터베이스에 커넥션 Pool을 사용 메서드
    public void getCon() {
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

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //받은 bean 객체를 데이터에 저장하는 메서드, 저장만 하면 되기 때문에 리턴값은 void로 처리한다.
    public void insertBoard(boardBean bean) {
        getCon();
        //BoardWriteForm.jsp에서 BoardWriteProc 작성자,제목,이메일,비밀번호,내용을 보내는데 이를 제외한 나머지는 초기화해야한다

        //ref(글 그룹)쿼리를 실행시켜 가장 큰 ref에 +1을 한다., 그래서 첫 글은 그룹이 1일 테니, 나중에 1을 더할거라 지금은 0으로 초기화
        int ref = 0;

        // 새 글이기에 step과 level을 1로 초기화
        // re_step: 답글의 순서를 나타냄. 원글은 1로 시작
        int re_step = 1;
        // re_level: 답글의 깊이를 나타냄. 원글은 1로 시작
        int re_level = 1;


        try {

            // 가장 큰 ref 값을 가져오는 SQL 쿼리
            String refsql = "SELECT MAX(ref) from BOARD";

            //쿼리 준비
            pstmt = con.prepareStatement(refsql);
            //쿼리 실행 후 결과값을 리턴
            rs = pstmt.executeQuery();
            if (rs.next()) {//쿼리 실행했을 때의 결과값이 있다면?
                ref = rs.getInt(1) + 1; // 현재 ref의 최대값에 +1을 더하여 새로운 글 그룹 값으로 설정
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

        } catch (Exception e) {
            System.err.println("DB에 저장하지 못 하였습니다.");
            e.printStackTrace();
            return;
        }
    }

    //모든 게시글을 보기 위해 Bean객체를 Return
    //이 메서드는 데이터베이스에서 모든 게시글 정보를 조회하여 Vector<boardBean> 형태로 반환합니다.
    public Vector<boardBean> getAllBoard(int start, int end) {
        Vector<boardBean> v = new Vector<>(); //여러 Bean 객체를 담고 Return을 위해 담을 공간인 Vector Bean을 생성

        try {
            //connection 연결
            getCon();
            //쿼리 준비
//            -- 1. 가장 안쪽의 서브쿼리: (select * from board order by ref desc, re_step asc)
//            --    - board 테이블의 모든 데이터를 조회
//            --    - ref(그룹번호)를 기준으로 내림차순 정렬 (최신글이 위로)
//            --    - re_step(답글순서)를 기준으로 오름차순 정렬 (원글 다음 답글이 순서대로)
//
//            -- 2. 중간 서브쿼리: select A.*, Rownum Rnum from (...)A
//                    --    - 정렬된 결과에 Rownum을 부여
//                    --    - Rownum은 오라클에서 제공하는 가상 컬럼으로 조회된 순서대로 1부터 번호를 매김
//                    --    - A는 서브쿼리의 별칭
//
//            -- 3. 최종 쿼리: select * from (...) where Rnum >= ? and Rnum <= ?
//            --    - 부여된 Rownum을 기준으로 특정 범위의 데이터만 추출
//            --    - start와 end 파라미터로 전달된 값 사이의 데이터만 조회
//                    --    - 이를 통해 페이지네이션 구현
//
//                    -- 예시: 한 페이지당 10개씩 보여줄 때
//                    -- 1페이지: Rnum >= 1 and Rnum <= 10
//                    -- 2페이지: Rnum >= 11 and Rnum <= 20

            String sql = "select * from (select A.* ,Rownum Rnum from (select *from board order by ref desc ,re_step asc)A)"
                    + "where Rnum >= ? and Rnum <= ?";
            // 객체 선언
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);

            //쿼리를 실행시킨 결과를 리턴해서 받아줌, 즉 오라클의 DB를 검색된 조회 결과를 자바 객체에 저장.
            rs = pstmt.executeQuery();
            //반복문을 사용하여 rs에 저장된 데이터를 추출
            while (rs.next()) {
                boardBean bean = new boardBean(); //컬럼으로 나뉘어진 DB 정보를 저장 하기 위해 Bean 객체 생성
                // - rs.getString("컬럼명")은 현재 행의 지정된 컬럼 값을 문자열로 반환합니다.
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_data(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadcount(rs.getInt(10));
                bean.setContent(rs.getString(11));
                //패키징 한 bean 객체 하나를 bean 객체를 여러개 담을 수 있는 v에 넣는다.
                v.add(bean);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return v;
    }


    public boardBean getOneBoard(int num) {

        //반환값이 boardBean이므로, 반환에 주기위한 bean 저장소 생성
        boardBean bean = new boardBean();


        try {
            //connection 연결
            getCon();

            //게시글을 한 번 볼때마다(해당 메서드가 호출될 때마다) 조회수가 1씩 증가하는 쿼리
            //WHERE NUM(PK)을 써줘야 해당하는 게시글만 +1이된다, 안 하면 모든 게시글이 조회수가 +1이 된다.
            String readsql = "UPDATE BOARD SET READCOUNT = READCOUNT+1 WHERE NUM=?";
            //객체 생성
            pstmt = con.prepareStatement(readsql);
            //?에 매핑
            pstmt.setInt(1, num);
            //실행
            pstmt.executeUpdate();


            //쿼리 준비
            String sql = "SELECT * FROM BOARD WHERE NUM=?";
            //객체 생성
            pstmt = con.prepareStatement(sql);
            //?에 매핑
            pstmt.setInt(1, num);
            //쿼리를 실행시킨 결과를 리턴해서 받아줌, 즉 오라클의 DB를 검색된 조회 결과를 자바 rs 객체에 저장.
            rs = pstmt.executeQuery();
            if (rs.next()) {
                // - rs.getString("컬럼명")은 현재 행의 지정된 컬럼 값을 문자열로 반환합니다.
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_data(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadcount(rs.getInt(10));
                bean.setContent(rs.getString(11));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    //답변글이 저장되는 메소드
    public void reWriteBoard(boardBean bean) {
        {
            //부모글 그룹과 글레벨 글 스템을 읽어드림
            int ref = bean.getRef();
            int re_step = bean.getRe_step();
            int re_level = bean.getRe_level();

            getCon();

            try {
                /////////////////////핵심 코드 ////////////////////////
                //부모글 보다 큰 re_level의 값을 전부 1씩 증가시켜줌
                String levelsql = "update board set re_level=re_level+1 where ref=? and re_level > ?";
                //쿼리 삽입 객체 선언
                pstmt = con.prepareStatement(levelsql);
                pstmt.setInt(1, ref);
                pstmt.setInt(2, re_level);
                //쿼리 실행
                pstmt.executeUpdate();

                //답변글 데이터를 저장
                String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
                pstmt = con.prepareStatement(sql);
                //?에 값을 대입
                pstmt.setString(1, bean.getWriter());
                pstmt.setString(2, bean.getEmail());
                pstmt.setString(3, bean.getSubject());
                pstmt.setString(4, bean.getPassword());
                pstmt.setInt(5, ref);//원글과 같은 ref(그룹) 사용
                pstmt.setInt(6, re_step + 1);//원글의 re_step + 1
                pstmt.setInt(7, re_level + 1); //원글의 re_level + 1
                pstmt.setString(8, bean.getContent());

                //쿼리를 실행하시오
                pstmt.executeUpdate();
                con.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //수정을 위한 하나의 게시글을 리턴
    public boardBean getOneUpdateBoard(int num) {

        //반환값이 boardBean이므로, 반환을 위한 bean 저장소 생성
        boardBean bean = new boardBean();

        try {
            //connection 연결
            getCon();


            //쿼리 준비
            String sql = "SELECT * FROM BOARD WHERE NUM=?";
            //객체 생성
            pstmt = con.prepareStatement(sql);
            //?에 매핑
            pstmt.setInt(1, num);
            //쿼리를 실행시킨 결과를 리턴해서 받아줌, 즉 오라클의 DB를 검색된 조회 결과를 자바 rs 객체에 저장.
            rs = pstmt.executeQuery();
            if (rs.next()) {
                // - rs.getString("컬럼명")은 현재 행의 지정된 컬럼 값을 문자열로 반환합니다.
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_data(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadcount(rs.getInt(10));
                bean.setContent(rs.getString(11));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    //삭제와 수정에 필요한 패스워드 검증 메서드
    public String CheckPassword(int num) {
        String pass = new String();
        try {
            getCon();
            //쿼리 준비
            String sql = "SELECT PASSWORD FROM BOARD WHERE NUM=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                pass = rs.getString(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pass;
    }

    //받은 bean객체를 토대로 해당되는 하나의 게시글을 수정하는 메서드, 수정만 하면 됨으로 반환 값은 필요없다.
    public void UpdateBoard(boardBean bean) {
        try {
            getCon();
            String sql = "update board set subject=? , content= ? where num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bean.getSubject());
            pstmt.setString(2, bean.getContent());
            pstmt.setInt(3, bean.getNum());
            pstmt.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //받은 bean객체를 토대로 해당되는 게시글을 DB에 삭제 메서드, 삭제 처리만하면 되기 때문에 반환 값은 필요없다.
    public void DeleteBoard(int num) {
        try {
            getCon();
            String sql = "delete from board where num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //페이지를 나누기 위한 전체 게시글의 갯수 return하는 메서드 호출
    public int getAllCount() {
        int count = 0; //int 형으로 반환하기 위한 저장소 변수 생성
        try {
            getCon();
            String sql = "SELECT COUNT(*) FROM BOARD";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
