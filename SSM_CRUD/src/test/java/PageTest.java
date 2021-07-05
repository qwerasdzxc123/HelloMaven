import com.github.pagehelper.PageInfo;
import edu.hue.crud.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.reactive.function.server.MockServerRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用 Spring 测试提供的测试请求功能，测试分页模块
 * @author 肖宁
 * @create 2021-07-01 9:55
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml",
        "file:web/WEB-INF/springMVC-servlet.xml"})
public class PageTest {

    //传入 sprinMVC的ioc
    @Autowired
    WebApplicationContext context;

    //虚拟mvc请求，获取处理结果
    MockMvc mockMvc;

    @Before
    public void mockMvcInit(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求，拿到返回值
        MvcResult pageNum =
                mockMvc.perform(MockMvcRequestBuilders.get("/empsOld").param("pageNum", "1")).andReturn();
        //请求成功后，请求域中会有pageInfo，可以取出进行验证
        MockHttpServletRequest request = pageNum.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

        System.out.println("当前页码：" + pageInfo.getPageNum());
        System.out.println("总页码：" + pageInfo.getPages());
        System.out.println("总记录数：" + pageInfo.getTotal());
        List<Employee> list = pageInfo.getList();
        for(Employee emp : list){
            System.out.println(emp.getEmpId()+" "+ emp.getLastName());
        }
    }

}
