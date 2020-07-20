import com.dao.BookBorrowingStatusDao;
import com.dao.RooterDao;
import com.dao.UserDao;
import com.entity.BookBorrowingStatus;
import com.entity.Rooter;
import com.entity.User;
import com.service.UserService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;

import javax.xml.ws.Service;
import java.io.Reader;
import java.util.List;

public class TestMyBatis {
    @Test
    public void test(){
        BeanFactory context = new ClassPathXmlApplicationContext("spring-config.xml");
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) context.getBean("sqlSessionFactoryBean");
        SqlSession sqlSession = sqlSessionFactory.openSession();
        BookBorrowingStatusDao dao = sqlSession.getMapper(BookBorrowingStatusDao.class);
        List<BookBorrowingStatus> lists= dao.queryBorrowingInfoByUser("admin");
        for(BookBorrowingStatus status : lists) {
            System.out.println(status);
        }
        //需要配置事务管理
        sqlSession.commit();
        sqlSession.close();
    }
    @Test
    public void testUserInfo(){
        BeanFactory context = new ClassPathXmlApplicationContext("spring-config.xml");
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) context.getBean("sqlSessionFactoryBean");
        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserDao dao = sqlSession.getMapper(UserDao.class);
        User lists= dao.selectUserByNameWithBook("admin");
        System.out.println(lists);
        System.out.println(lists.getBookList());
        //需要配置事务管理
        sqlSession.commit();
        sqlSession.close();
    }
}
