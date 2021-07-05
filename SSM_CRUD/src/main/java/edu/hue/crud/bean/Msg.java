package edu.hue.crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回类
 * @author 肖宁
 * @create 2021-07-01 16:02
 */
public class Msg {

    //状态码 100：成功，200：失败
    private int code;

    //返回信息
    private String msg;

    //要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String, Object>();

    public static Msg success(){
        Msg msgSuccess = new Msg();
        msgSuccess.setCode(100);
        msgSuccess.setMsg("处理成功！");
        return msgSuccess;
    }

    public static Msg file(){
        Msg msgFile = new Msg();
        msgFile.setCode(200);
        msgFile.setMsg("处理失败！");
        return msgFile;
    }

    public Msg add(String key, Object obj){
        this.getExtend().put(key,obj);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
