package com.example.bean;

import java.util.HashMap;
import java.util.Map;

public class Message {
    //状态码
    private int code;
    //提示信息
    private String msg;
    //用户要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String,Object>();

    public int getCode() {
        return code;
    }

    public  static  Message success(){
        Message message = new Message();
        message.setCode(100);
        message.setMsg("成功");
        return  message;
    }
    public  static  Message fail(){
        Message message = new Message();
        message.setCode(200);
        message.setMsg("失败");
        return  message;
    }
    public  Message add(String key, Object object){
        this.getExtend().put(key,object);
        return this;
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
