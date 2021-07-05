import edu.hue.crud.test.MBGTest;
import org.junit.Test;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.springframework.test.context.ContextConfiguration;

import java.io.IOException;
import java.sql.SQLException;

/**
 * @author 肖宁
 * @create 2021-06-30 14:30
 */
public class MGBtest {
    
    @Test
    public void test01() throws InterruptedException, SQLException, InvalidConfigurationException, XMLParserException, IOException {
        MBGTest mbgTest = new MBGTest();
        mbgTest.test01();
    }
}
