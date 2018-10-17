package com.hginfo.hbm.srv.jms.service;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

/**
 * ClassName:ProducerService <br/>
 * 生产者服务 <br/>
 * Date: 2017年6月19日 下午7:22:09 <br/>
 * @author henry
 * @version
 * @since V1.0.0
 * @see
 */
@Service("producerService")
public class ProducerService {
    
    private JmsTemplate jmsTemplate;
    
    public void sendMessage(Destination destination, final String message) {
        System.out.println("---------------生产者发送消息-----------------");
        System.out.println("---------------生产者发了一个消息：" + message);
        jmsTemplate.send(destination, new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createTextMessage(message);
            }
        });
    }
    
    public JmsTemplate getJmsTemplate() {  
        return jmsTemplate;  
    }
    
    @Resource
    public void setJmsTemplate(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }
}
